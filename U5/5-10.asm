; Fibonacci Generator   (5-10.asm)
; Program Description: Write a procedure that produces N values ​​in the Fibonacci number series and stores them in an array of doubleword. 
;                      Input parameters should be a pointer to an array of doubleword, a counter of the number of values ​​to generate. 
;                      Write a test program that calls your procedure, passing N = 47.
;                      The first value in the array will be 1, and the last value will be 2,971,215,073.
;                      Use the Visual Studio debugger to open and inspect the array contents.
; Author: Slider
; Creation Date: 2023/11/19
; Revisions: 
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	arr DWORD 1, 1, 45 DUP(?)

.code
main proc 
	mov ecx, 45
	mov esi, offset arr
	add esi, TYPE arr
	add esi, TYPE arr

	L1 :
		call addFib
		add esi, TYPE arr                       ; move esi front
		loop L1

	invoke ExitProcess, 0

main endp

;------------------------------------------------------------------------------------;
; addFib                                                                             ;
; add the two front array into eax, and save the eax value into the array            ;                      
;------------------------------------------------------------------------------------;

addFIb proc
	mov eax, [esi - 8]                          ; mov the two values into eax 
	add eax, [esi - 4]
	mov [esi], eax
	ret
addFib endp

end main
