; Copying a Word Array to a DoubleWord array   (4-4.asm)

; Program Description : Write a program that uses a loop to copy all the elements from an unsigned Word(16-bit) array into an unsigned doubleword(32-bit) array.
; Author : Slider
; Creation Date : 2023/11/5
; Revisions : 
; Date :                           Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	arrayW WORD 1, 2, 3, 4, 5, 6
	arrayD DWORD 6 DUP(?)

.code
main PROC
	mov ecx, LENGTHOF arrayW
	mov esi, 0
	
	L1:
		movzx eax, arrayW[esi]
		mov arrayD[esi*2], eax
		add esi, TYPE WORD
		loop L1
	
	INVOKE ExitProcess, 0
main ENDP
END main

