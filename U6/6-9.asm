; Validating a PIN  (6-9.asm)
; Program Description : Banks use a Personal Identification Number (PIN) to uniquely identify each customer.
;                       Let us assume that our bank has a specified range of acceptable values for each digit in its customers 5-digit PINs.
;                       The table shown below contains the acceptable ranges, where digits are numbered from left to right in the PIN. 
;                       Then we can see that the PIN 52413 is valid. But the PIN 43534 is invalid because the first digit is out of range. Similarly, 64535 is invalid because of its last digit.
;                       Digit Number       Range
;                            1             5 to 9
;                            2             2 to 5
;                            3             4 to 8
;                            4             1 to 4
;                            5             3 to 6
;                      Your task is to create a procedure named Validate_PIN that receives a pointer to an array of byte containing a 5-digit PIN.
;                      Declare two arrays to hold the minimum and maximum range values, and use these arrays to validate each digit of the PIN that was passed to the procedure. 
;                      If any digit is found to be outside its valid range, immediately return the digit's position (between 1 and 5) in the EAX register. 
;                      If the entire PIN is valid, return 0 in EAX. Preserve all other register values between calls to the procedure. 
;                      Write a test program that calls Validate_PIN at least four times, using both valid and invalid byte arrays. By running the program in a debugger,
;                      verify that the return value in EAX after each procedure call is valid. Or, if you prefer to use the book’s library, you can display "Valid" or "Invalid" on the console after each procedure call
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	cnt DWORD 0
	
	small DWORD 5, 2, 4, 1, 3
	big DWORD 9, 5, 8, 4, 6
	password1 DWORD 5, 2, 4, 1, 3             ; password can change 
	password2 DWORD 4, 3, 5, 3, 4 
	password3 DWORD 3, 3, 2, 1, 5
	password4 DWORD 2, 4, 1, 3, 5

.code
main PROC
	; password1
	mov esi, OFFSET password1
	mov edi, OFFSET small
	mov edx, OFFSET big
	call Validate_PIN

	; password2
	mov esi, OFFSET password2
	mov edi, OFFSET small
	mov edx, OFFSET big
	call Validate_PIN

	; password3
	mov esi, OFFSET password3
	mov edi, OFFSET small
	mov edx, OFFSET big
	call Validate_PIN

	; password4
	mov esi, OFFSET password4
	mov edi, OFFSET small
	mov edx, OFFSET big
	call Validate_PIN
		
main ENDP

;--------------------------------------------------;
; Validate_PIN                                     ;
; Compare to the small and big array, assure the   ;
; number in the range.                             ;
;--------------------------------------------------;

Validate_PIN PROC USES esi edi edx
	mov ecx, 5
	mov cnt, 0
	L1:
		inc cnt                     ; rember the bits position now
		mov ebx, [esi]              ; ebx = password bit now
		mov eax, [edi]              ; eax = small
		cmp ebx, eax
		jb invaild
		mov eax, [edx]              ; eax = big
		cmp ebx, eax
		ja invaild
		jmp vaild
	invaild:
		mov eax, cnt                
		jmp quit
	vaild:
		mov eax, 0
		jmp next
	next:	
		add esi, TYPE password1
		add edi, TYPE small
		add edx, TYPE big
	loop L1
	quit:
 
	ret	
Validate_PIN ENDP

END main

;-<Sol2>----------------------------------------;
; mov cnt, 0                                    ;
; mov ecx, 5                                    ;
; L1:                                           ;
;   mov ebx, [esi]                              ;
;   inc cnt                                     ;
;   .IF (ebx >= [edi]) && (ebx <= [edx])        ;
;     add esi, TYPE password1                   ;
;  	  add edi, TYPE small                       ;
;		  add edx, TYPE big                         ;
;   .ELSE                                       ;
;     mov eax, cnt                              ;
;     jmp quit                                  ;
;   .ENDIF                                      ;
; loop L1                                       ;
; mov eax, 0                                    ;
; ret                                           ;
;-----------------------------------------------;
