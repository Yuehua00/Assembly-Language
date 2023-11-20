; Summing Array Elements in Range  (6-2.asm)

; Program Description : Create a procedure that returns the sum of all array elements falling within the range j...k (inclusive). 
;                       Write a test program that calls the procedure twice, passing a pointer to a signed doubleword array, the size of the array, and the values of j and k. 
;                       Return the sum in the EAX register, and preserve all other register values between calls to the procedure
; Author : Slider
; Creation Date : 2023/11/20
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	arr SDWORD -5, 10, -22, -3, 17, 6, 35, -15, 4, 11
	len DWORD LENGTHOF arr
	sum SDWORD 0
	j DWORD 0
	k DWORD 0

.code
main PROC
	mov j, 0
	mov k, 20
	mov esi, OFFSET arr
	mov ecx, len
	call sumArr
	mov sum, eax

	mov j,-30
	mov k, 40
	mov esi, OFFSET arr
	mov ecx, len
	call sumArr
	mov sum, eax

	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------------------;
; sumArr                                                           ;
; Compare the value with j and k. If it in the range of j to k,    ;
; then add it to eax.                                              ;
;------------------------------------------------------------------;
sumArr PROC USES ecx esi
	mov eax, 0
	
	L1:
		mov ebx, [esi]
		cmp ebx, j                   ; j <= ebx <= k
		jl quit                               ; ebx < j
		cmp ebx, k           
		jg quit                               ; ebx > k
		add eax, ebx
			
			quit:
				add esi, TYPE SDWORD
		loop L1
  
    ;-<Sol2>---------------------------------------;
    ; l1:                                          ;
    ;       mov ebx, [esi]                         ;
    ;       cmp ebx, j                             ;
    ;       jge true1                              ;
    ;       jmp next                               ;
    ;       true1:                                 ;
    ;           cmp ebx, k                         ;
    ;           jle true2                          ;
    ;           jmp next                           ;
    ;       true2:                                 ;
    ;           add eax, ebx                       ;
    ;       next:                                  ;
    ;           add esi, 4                         ;
    ;                                              ;
    ;   loop l1                                    ;
    ;----------------------------------------------;
    
	ret 
sumArr ENDP

END main
