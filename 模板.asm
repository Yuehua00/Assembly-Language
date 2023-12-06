; 

; Program Description: 
; Author: Slider
; Creation Date: 
; Revisions: 
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main proc 
	

	invoke ExitProcess, 0

main endp
end main
