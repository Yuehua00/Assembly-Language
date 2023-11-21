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
; Reference Website : https://github.com/rastone/Review/blob/master/Assembly/BooleanCalc.asm
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	num WORD '1', '2', '3', '4'
	len DWORD LENGTHOF num
	x DWORD 1
	y DWORD 0
	caseTable BYTE '1'			; lookup value
		DWORD AND_op			; address of procedure
	EntrySize = ($ - caseTable )
		BYTE '2'
		DWORD OR_op
		BYTE '3'
		DWORD NOT_op
		BYTE '4'
		DWORD XOR_op
		BYTE '5'
		DWORD ExitProgram
	NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC
	mov esi, OFFSET num
	mov ecx, len
	mov eax, 0
	L1:	
		mov al, [esi]
		cmp al, '5'				; is selection valid (1-5)?
		ja L2					; jump if above 5, go back
		cmp al, '1'
		jb L2					; jump if below 1, go back
		jc quit				    ; jump if carry = 1, exit
		call ChooseProcedure

	L2:
		add esi, TYPE num
	loop L1

	quit: 

main ENDP

ChooseProcedure PROC USES ebx ecx
		mov ebx, OFFSET caseTable	; pointer to the table
		mov ecx, NumberOfEntries	; loop counter

	L1:	
		cmp al, [ebx]			    ; match found?
		jne L2				        ; if no, continue
		call NEAR PTR [ebx + 1]		; if yes, call procedure
		jmp quit

	L2:	
		add ebx, EntrySize	    ; point to the next entry
		loop L1				    ; repeat until ECX = 0
	quit:

	ret					        ; return from procedure

ChooseProcedure ENDP

AND_op PROC
	pushad				    ; push all registers onto stack
	mov eax, x			
	mov ebx, y
	and eax, ebx			; x AND y
	popad					; save and restore registers
	ret					    ; return from procedure
AND_op ENDP

OR_op PROC
	pushad					; push all registers onto stack
	mov eax, x			
	mov ebx, y
	or eax, ebx				; x OR y
	popad					; save and restore registers
	ret						; return from procedure
OR_op ENDP

NOT_op PROC
	pushad					; push all registers onto stack
	mov eax, x
	not eax					; NOT operand
	popad					; restore registers
	ret						; return from procedure
NOT_op ENDP

XOR_op PROC
	pushad					; push all registers onto stack
	mov eax, x
	mov ebx, y
	xor eax, ebx			; x XOR y
	popad					; save and restore registers
	ret						; return from procedure

XOR_op ENDP

ExitProgram PROC

	stc					; set the carry flag to 1
	ret					; return from procedure

ExitProgram ENDP

END main
