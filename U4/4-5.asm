; Fibonacci Numbers   (4-5.asm)

; Program Description : Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence, 
;                       described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n-1) + Fib(n-2).
; Author : Slider
; Creation Date : 2023/11/5
; Revisions : 
; Date :                           Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	Fib WORD 1, 1, 5 DUP(?)

.code
main PROC
	mov ecx, 5
	mov esi, 4

	L1:
		mov eax, 0
		mov ax, Fib[esi-4]	
		add ax, Fib[esi-2]
		mov Fib[esi], ax
		add esi, TYPE WORD
		loop L1
	
	INVOKE ExitProcess, 0
main ENDP
END main
