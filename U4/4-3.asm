; Summing the Gaps between Array Values   (4-3.asm)

; Program Description : Write a program with a loop and indexed addressing 
;                       that calculates the sum of all the gaps between successive array elements. 
;                       The array elements are doublewords, sequenced in nondecreasing order. 
;                       So, fo example, the array {0, 2, 5, 9, 10} has gaps of 2, 3, 4, and 1, whose sum equals 10.
; Author : Slider
; Creation Date : 2023/11/5
; Revisions : 
; Date :                           Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	array DWORD 0, 2, 5, 9, 10
	sum DWORD 0

.code
main PROC
	mov esi, 0
	mov ECX, (LENGTHOF array-1)
	mov ebx, 0

	L1:
		mov eax, array[esi]
		neg eax
		add ebx, array[esi+4]
		add ebx, eax
		add esi, TYPE DWORD
		loop L1

	mov sum, ebx
	
	INVOKE ExitProcess, 0
main ENDP
END main
