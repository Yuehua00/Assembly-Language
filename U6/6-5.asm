; Boolean Calculator (1)  (6-5.asm)
; Program Description : Create a program that functions as a simple boolean calculator for 32-bit integers. 
;                       It should display a menu that asks the user to make a selection from the following list:
;                       1. x AND y
;                       2. x OR y
;                       3. NOT x
;                       4. x XOR y
;                       5. Exit program
;                       When the user makes a choice, call a procedure that displays the name of the operation about to be performed. 
;                       You must implement this procedure using the Table-Driven Selection technique,
;                       shown in Section 6.5.4. (You will implement the operations in Exercise 6.) (The Irvine32 library is required for this solution program.)
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	string DWORD 'DNA', 'RO', 'TON', 'ROX'
	tmp DWORD ?
	time DWORD 4
	x DWORD 1
	y DWORD 0

	CaseTable BYTE 'AND'
		DWORD Process_AND
	EnterSize = ( $- CaseTable )
		BYTE 'OR'
		DWORD Process_OR
		BYTE 'NOT'
		DWORD Process_NOT
		BYTE 'XOR'
		DWORD Process_XOR

.code
main PROC
	mov ebx, OFFSET CaseTable
	mov ecx, time
	mov esi, OFFSET string
	L1:
		mov eax, [esi]
		mov edx, [ebx]
		cmp eax, edx
		jne L2
		call NEAR PTR [ebx + 1]
		jmp L3
	L2:
		add esi, TYPE string
		add ebx, EnterSize
	loop L1

	L3:
		
    INVOKE ExitProcess, 0
main ENDP

Process_AND PROC
	mov eax, x
	mov edx, y
	AND eax, edx
	ret
Process_AND ENDP

Process_OR PROC
	mov eax, x
	mov edx, y
	OR eax, edx
	ret
Process_OR ENDP

Process_NOT PROC
	mov eax, x
	NOT eax
	ret
Process_NOT ENDP

Process_XOR PROC
	mov eax, x
	mov edx, y
	XOR eax, edx
	ret
Process_XOR ENDP



END main
