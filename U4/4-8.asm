; Shifting the Elements in an Array   (4-8.asm)

; Program Description : Using a loop and indexed addressing, write code that rotates the members of a 32-bit integer array forward one position. 
;                       The value at the end of array must wrap around to the first position. 
;                       For example, the array [10, 20, 30, 40] would be transformed into [40, 10, 20, 30].
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
	array WORD 10h, 20h, 30h, 40h
	

.code
main PROC
	mov ecx, LENGTHOF array - 1
	mov esi, 0
	mov eax, 0
	mov ax, array[esi]
	
	L1:
		add esi, TYPE array
		xchg ax, array[esi]
		loop L1

	mov array, ax
	
	INVOKE ExitProcess, 0
main ENDP
END main

