; Reverse an Array   (4-6.asm)

; Program Description : Use a loop with indirect or indexed addressing to reverse the elements of an integer array place.
;                       Do not copy the elements to any other array. Use the SIZEOF, TYPE, and LENGTHOF operators 
;                       to make the program as flexible as possibel if th array size and type should chaged in the future.
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
	array DWORD 1h, 2h, 3h, 4h, 5h, 6h, 7h
	

.code
main PROC
	mov esi, 0
	mov edi, (SIZEOF array - TYPE array)
	mov ecx, LENGTHOF array / 2

	L1:
		mov eax, array[esi]
		xchg eax,array[edi]
		mov array[esi], eax
		add esi, TYPE array
		sub edi, TYPE array
		loop L1
	
	INVOKE ExitProcess, 0
main ENDP
END main

