;Integer Expression Calculation

; Program Description: A = ( A + B ) - ( C + D )
; Author: Slider
; Creation Date: 2023/11/2
; Revisions: 
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main proc 
	mov eax, 4
	mov ebx, 3
	mov ecx, 2
	mov edx, 1

	add eax, ebx
	add ecx, edx
	sub eax, ecx

	invoke ExitProcess, 0

main endp
end main
