; Copy a String in Reverse Order   (4-7.asm)

; Program Description : Write a program with a loop and indirect addressing that copies a string from source to target, 
;                       reversing the character order in the process.
; Author : Slider
; Creation Date : 2023/11/5
; Revisions : 
; Date :                           Modified by :
;-------------------------------------------------------------------------------------------------------------------------

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	source BYTE "This is the source string", 0
	target BYTE SIZEOF source DUP('#')
	

.code
main PROC
	mov ecx, LENGTHOF source
	mov esi, 0
	mov edi, SIZEOF source - TYPE source

	L1:
		mov al, source[esi]
		mov target[edi], al
		add esi, TYPE source
		sub edi, TYPE source
		loop L1
	
	INVOKE ExitProcess, 0
main ENDP
END main

