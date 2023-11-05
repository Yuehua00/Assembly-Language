; Converting from Big Endian to Little Endian

; Program Description : Write a program that uses the variables below and MOV instructions to copy 
;                       the value from bigEndian to littleEndian, revirsing the order of the bytes.
;                       The number's 32-bit value is understood to be 12345678h.
; Author : Slider
; Creation Date : 2023/11/5
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	bigEndian BYTE 12h, 34h, 56h, 78h
	littleEndian DWORD ?

.code
main PROC
	mov eax, DWORD PTR bigEndian
	mov littleEndian, eax
	

	INVOKE ExitProcess, 0
main ENDP
END main
