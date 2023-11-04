; Program Description : Write a program that contains a definition of each data type listed in Table 3-2 in Session 3.4. Initialize each variable to a value that is consisten with its data type.
; Author : Slider
; Creation Data : 2023/11/4
; Revisions :
; Date :                   Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	valb BYTE 255
	valsb SBYTE -128
	valw WORD 65535
	valsw SWORD -32768
	valdw DWORD 4294967295
	valsdw SDWORD -2147483648
	valfw FWORD 281474976710655
	valqw QWORD 18446744073709551615
	valtb TBYTE 1000000000123456789Ah
	valr4 REAL4 -1.2
	valr8 REAL8 1.0E-260
	valr10 REAL10 1.0E+4000

.code
main PROC

	INVOKE ExitProcess, 0
main ENDP
END main
