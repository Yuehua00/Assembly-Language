; Packed Decimal Conversion  (7-3.asm)
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
    numbers DWORD 87654321h, 45346894h, 00193492h
	buffer BYTE 9 DUP(0)                             ; 8 digits plus null character

.code
main PROC
    mov esi, OFFSET numbers
	mov ecx, LENGTHOF numbers

	L1:
		mov eax, [esi]
		mov edx, OFFSET buffer
		call PackedToAsc

		add esi, TYPE numbers
	loop L1
	
main ENDP

;--------------------------------------------------------------------;
; PackedToAsc                                                        ;
; 將打包十進制數據轉換為ASCII碼的過程                                ;
; shr -> MSB   and 00001111 -> LSB                                   ;
;--------------------------------------------------------------------;

PackedToAsc PROC USES ecx esi edx
	mov edx, [esi]
	mov eax, 0
	mov ebx, 0

	L1:
		rol edx, 8             ; 將 edx 的內容向左旋轉 8 位元
		mov [esi], edx         ; 將結果存儲回 esi 指向的位置
		mov al, BYTE PTR [esi] ; 從 esi 指向的地址讀取一個位元組到 al
		mov bl, BYTE PTR [esi] ; 從 esi 指向的地址讀取一個位元組到 bl
		shr al, 1              ; 右移 al 中的位元，相當於除以 2，為了取得原始位元組中的 MSB（Most Significant Bit）
		and bl, 00001111b      ; 使用位元運算確保只保留低 4 位元，為了取得原始位元組中的 LSB（Least Significant Bits）
		add al, 48             ; 將 al 加上 ASCII '0' 的碼值，使其轉換為 ASCII 碼
		                       ; display al
		mov al, bl             
		add al, 48             ; 將 al 加上 ASCII '0' 的碼值，使其轉換為 ASCII 碼
		                       ; display al
	loop L1
	
	ret
PackedToAsc ENDP

END main
