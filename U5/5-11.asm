; FFinding Multiples of K   (5-11.asm)
; Program Description: In a byte array of size N, write a procedure that finds all multiples of K that are less than N. 
;                      Initialize the array to all zeros at the beginning of the program, and then whenever a multiple is found, set the corresponding array element to 1.
;                      Your procedure must save and restore any registers it modifies. Call your procedure twice, with K = 2, and again with K = 3. 
;                      Let N equal to 50. Run your program in the debugger and verify that the array values were set correctly.
; Author: Slider
; Creation Date: 2023/11/19
; Revisions: 
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	arr DWORD 50 DUP (0)
	k DWORD 0

.code
main proc 
	mov ecx, 50
	mov k, 2
	call Findit

	mov ecx, 50
	mov k, 3
	mov esi, offset arr
	L1:                                   ; reset the arr to zero
		mov DWORD PTR [esi], 0
		add esi, TYPE arr
		loop L1
	call Findit

	invoke ExitProcess, 0

main endp

;------------------------------------------------------------------------------------;
; findit                                                                             ;
; Find the multiple of k, and mark it in the array.                                  ;
; EBX : the check number                                                             ;
; EDX : the multiple of k                                                            ;
;------------------------------------------------------------------------------------;

Findit proc USES esi ecx
	mov ecx, 50
	mov esi, offset arr
	mov ebx, 1
	mov edx, k

	L2:
		cmp ebx, edx
		jne findNext                             ; edx != ebx

		mov DWORD PTR [esi], 1
		add edx, k

		findNext:
			inc ebx
			add esi, TYPE arr

		loop L2
	
	ret
Findit endp

end main
