; Program Description : Write a program that defines symbolic consyants for all seven days of week. Create an array variable that uses the symbols as initializers.
; Author : Slider
; Creation Date : 2023/11/3
; Revisions :
; Date :                    Modifird by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

SUN = 0   ;put these in the .data won't get wrong too
MON = 1
TUE = 2
WEN = 3
THU = 4
FRI = 5
SAT = 6

.data
week BYTE SUN, MON, TUE, WEN, THU, FRI, SAT

.code
main PROC
	

	INVOKE ExitProcess, 0
main ENDP
END main