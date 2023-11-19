; Recursive Procedure   (5-9.asm)
; Program Description: Direct recursion is the term we use when a procedure calls itself. Of course, you never want to let a procedure keep calling itself forever,
;                      because the runtime stack would fill up. Instead, you must limit the recursion in some way.
;                      Write a program that calls a recursive procedure. Inside this procedure, add 1 to a counter so you can verify the number of times it executes.
;                      Run your program with a debugger, and at the end of the program, check the counter’s value.
;                      Put a number in ECX that specifies the number of times you want to allow the recursion to continue.
;                      Using only the LOOP instruction (and no other conditional statements from later chapters), find a way for the recursive procedure to call itself a fixed number of times.
; Author: Slider
; Creation Date: 2023/11/19
; Revisions: 
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	count DWORD 0

.code
main proc 
	mov ecx, 10                                  ; total runtimes
	call RecursiveProcedure

	invoke ExitProcess, 0

main endp

;------------------------------------------------------------------------------------;
; RecursiveProcedure                                                                 ;
; increasing count every time and compare to ecx(runtimes)                           ;
;------------------------------------------------------------------------------------;

RecursiveProcedure proc
	inc count
	cmp count, ecx
	jz quit                                      ; count == ecx
	call RecursiveProcedure

	quit:
	ret
RecursiveProcedure endp

end main
