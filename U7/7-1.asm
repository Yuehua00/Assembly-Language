; Display ASCII Decimal  (7-1.asm)
; Program Description : Write a procedure named WriteScaled that outputs a decimal ASCII number with an implied decimal point. 
;                       Suppose the following number were defined as follows, where DECIMAL_OFFSET indicates that the decimal point must be inserted five positions from the right side of the number:
;                           DECIMAL_OFFSET = 5
;                           .data
;                           decimal_one BYTE "100123456789765"
;                       WriteScaled would display the number like this:
;                           1001234567.89765
;                       When calling WriteScaled, pass the number’s offset in EDX, the number length in ECX, and the decimal offset in EBX. 
;                       Write a test program that passes three numbers of different sizes to the WriteScaled procedure.
; Reference Website : https://handhikayp.medium.com/display-ascii-decimal-assembly-programming-solution-730a5214a781
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    decimal_one BYTE "100123456789765"

.code
main PROC
    mov edx, OFFSET decimal_one		
	mov ecx, LENGTHOF decimal_one
	mov ebx, 5                     ; how many bits after float point
	exit

main ENDP

;------------------------------------------;
; WriteScaled                              ;
; Use esi to count how many number now     ;
; after floating point.                    ;
;------------------------------------------;

WriteScaled PROC
	push ecx
	sub ecx,ebx
	mov ebx,ecx
	pop ecx
	mov esi,0                ; count 
	L1:
		.IF esi==ebx         ; 已經達到所需小數位數
			mov al,2Eh       ; "." ASKII
			                 ; write
		.ENDIF
		mov al,[edx]
		add edx, TYPE BYTE
		                     ; write
		inc esi
	loop L1
    ret

WriteScaled ENDP

END main

;--------------------------------------------------------
; WriteScaled PROC
;	push ecx
;	sub ecx,ebx
;	mov ebx,ecx
;	pop ecx
;	mov esi,0                ; count 
;	L1:
;		cmp esi, ebx         ; 已經達到所需小數位數
;       je writedot
;		mov al,[edx]
;		                     ; write
;		inc esi
;       jmp next
;   writedot:
;		mov al, 2Eh          ; "." ASKII
;                            ; write
;   next:
;		add edx, TYPE BYTE
;
;	loop L1
;   ret
;
; WriteScaled ENDP
;------------------------------------------------------
