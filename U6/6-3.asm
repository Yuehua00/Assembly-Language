; Test Score Evaluation  (6-3.asm)
; Program Description : Create a procedure named CalcGrade that receives an integer value between 0 and 100, and returns a single capital letter in the AL register. 
;                       Preserve all other register values between calls to the procedure. The letter returned by the procedure should be according to the following ranges:
;                       Score Range  Letter Grade
;                       ----------------------------------
;                       90 to 100        A
;                       80 to  89        B
;                       70 to  79        C
;                       60 to  69        D
;                        0 to  59        F
;                       Write a test program that generates 10 random integers between 50 and 100, inclusive. 
;                       Each time an integer is generated, pass it to the CalcGrade procedure.  
;                       You can test your program using a debugger, or if you prefer to use the book’s library, you can display each integer and its corresponding letter grade. 
;                       (The Irvine32 library is required for this solution program because it uses the RandomRange procedure.)
; Author : Slider
; Creation Date : 2023/11/20
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	arr DWORD 52, 78, 63, 91, 88, 64, 72, 55, 77, 95  ; change random to an array 
	ans DWORD 10 DUP(?)

.code
main PROC
	mov ecx, 10
    mov esi, OFFSET arr
    mov edi, OFFSET ans

    L1:
        mov ebx, [esi] 
        call CalGrade   
        mov [edi], al    

        add edi, TYPE DWORD
        add esi, TYPE DWORD
        loop L1

    INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------------------;
; CalGrade                                                         ;
; Procedure to calculate the letter grade based on the score.      ;
;------------------------------------------------------------------;
CalGrade PROC USES ebx
    cmp ebx, 90
    jge Agrade
    cmp ebx, 80
    jge Bgrade
    cmp ebx, 70
    jge Cgrade
    cmp ebx, 60
    jge Dgrade
    jmp Fgrade

    Agrade:
        mov al, 'A'
        ret

    Bgrade:
        mov al, 'B'
        ret

    Cgrade:
        mov al, 'C'
        ret

    Dgrade:
        mov al, 'D'
        ret

    Fgrade:
        mov al, 'F'
        ret

CalGrade ENDP

END main

;-------------------------------;
;  .IF eax >= 90                ;
;     mov al,'A'                ;
;   .ELSEIF eax >= 80           ;
;     mov al,'B'                ;
;   .ELSEIF eax >= 70           ;
;     mov al,'C'                ;
;   .ELSEIF eax >= 60           ;
;     mov al,'D'                ;
;   .ELSE                       ;
;     mov al,'F'                ;
;   .ENDIF                      ;
;-------------------------------;
