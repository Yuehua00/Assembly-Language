; Converting from Big Endian to Little Endian

; Program Description : Write a program with a loop and indexed addressing that exchanges every pair of values in an array with an even number of elements. Therefore, item i will exchange with i+1, and item i+2 will exchange with item i+3, and so on.
; Author : Slider
; Creation Date : 2023/22/14
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

PWORD TYPEDEF PTR WORD

.data
	array WORD 1000h, 2000h, 3000h, 4000h, 5000h, 6000h
	times DWORD LENGTHOF array / 2

.code
main PROC

	mov ECX, times
	mov esi, 0

	L1:
		mov ax, array[esi]
		xchg ax, array[esi+2]
		xchg array[esi], ax
		add esi, TYPE array * 2
		loop L1
	
	INVOKE ExitProcess, 0
main ENDP
END main
