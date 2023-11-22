; Extended Subtraction Procedure  (7-2.asm)
; Program Description : Create a procedure named Extended_Sub that subtracts two binary integers of arbitrary size. 
;                       The storage size of the two integers must be the same, and their size must be a multiple of 32 bits.
;                       Write a test program that passes several pairs of integers, each at least 10 bytes long.
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    op1 QWORD 0A2B2A40674981234h
	op2 QWORD 08010870000234502h
	result QWORD 1 DUP(0)           ; = 22A21D067474CD32h
	DoubleWords = SIZEOF op1 / TYPE DWORD ; 64 / 32 = 2, count the number of doublewords in each operand

.code
main PROC
    mov esi, OFFSET op1
	mov edi, OFFSET op2
	mov ebx, OFFSET result
	mov ecx, DoubleWords
	call Extended_Sub
	
main ENDP

;--------------------------------------------------------------------;
; Extended_Sub                                                       ;
; Subtracts two binary integers whose size is a multiple of 32 bits. ;
; Carry Flag = 1 = 上一位數相減 < 0                                  ;
;--------------------------------------------------------------------;

Extended_Sub PROC
	pushad
	clc             ; clear the Carry flag

	L1:
		mov eax, [esi]
		sub eax, [edi]
		pushfd                    ; save the Carry flag
		mov [ebx], eax
		add esi, 4
		add edi, 4
		add ebx, 4
		popfd                     ; restore the Carry flag
	loop L1

	sub word ptr [ebx], 0         ; subtract any leftover carry
	popad
	ret
Extended_Sub ENDP

END main

!
sub word ptr [ebx], 0 的目的是減去任何剩餘的進位。

解釋這行指令：

sub: 代表減法指令。
word ptr: 這是指明操作的大小。word 表示16位元，而 ptr 表示指標。這裡用 word ptr 是因為我們想要對一個16位元的值進行操作，而 ebx 中存儲的是一個雙字（DWORD，32位元）。
[ebx]: 是 ebx 寄存器中存儲的地址的內容。
所以，這條指令的效果是對 ebx 指向的雙字數據的低 16 位元（即一個 word）進行減法。而這個操作的目的是減去任何可能在 Extended_Sub 過程中產生的進位。

當我們對一組雙字進行減法時，可能會在某些位元上產生進位，而這個進位可能會影響到下一組雙字。這條指令的作用是在運算結束後，檢查是否還有可能存在的進位，如果有，就減去這個進位。

簡而言之，sub word ptr [ebx], 0 的功用是確保最終的減法結果中沒有任何剩餘的進位。
!
