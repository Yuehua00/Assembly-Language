; Listing File for AddTwoSum Template  

; Program Description : Generate a listing file for the AddTwoSum program and write a description of the machine code bytes generated for each instruction. You might have to guess at some of the meaning of the byte values.
; Author :
; Creation Date :
; Revisions :
; Date :                           Modified by :

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	sum DWORD 0

.code
main PROC
	mov eax, 5
	add eax, 5
	mov sum, eax
	
	INVOKE ExitProcess, 0
main ENDP
END main
