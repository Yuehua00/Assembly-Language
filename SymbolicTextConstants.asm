; Program Description : Write a program that defines symbolic names for several string literals (characters between quotes). Use each symbolic name in a variable definition.
; Author : Slider
; Creation Date : 2023/11/4
; Revisions :
; Date :                  Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dxExitCode:DWORD

.data
	name BYTE "My name is Slider.", 0dh, 0ad
		 BYTE "Hahahaha ; )", 0dh, 0ah, 0

.code
main PROC

	INVOKE ExitProcess, 0
main ENDP
END main