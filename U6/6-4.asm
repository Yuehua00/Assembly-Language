; WARNING : Program Description 當中有非法字，我沒找到，執行時擔心出錯可以把Program Description拿掉
; College Registration  (6-4.asm)
; Program Description : Using the College Registration example from Section 6.7.3 as a starting point, do the following:
;                       • Recode the logic using CMP and conditional jump instructions (instead of the IF and ELSEIF directives).
;                       • Perform range checking on the credits value; it cannot be less than 1 or greater than 30. If an invalid entry is discovered, display an appropriate error message.
;                       • Prompt the user for the grade average and credits values.
;                       • Display a message that shows the outcome of the evaluation, such as "The student can register" or "The student cannot register". (The Irvine 32 library is required for this solution program.)
;                        < I change this question to "replace the .IF and .ELSEIF to using cmp and jump instruction" >
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	gradeAverage DWORD 275
    credits DWORD 12
    okRegister BYTE ?

.code
main PROC
	mov okRegister, 0
    mov eax, gradeAverage
    mov ebx, 350
    cmp eax, ebx
    jb L2
    jmp quit
    L2:
        mov ebx, 250
        cmp eax, ebx
        jb L3
        mov eax, credits
        mov ebx, 16
        cmp eax, ebx
        ja L3
        jmp quit
    L3:
        mov ebx, 12
        ja L4
        jmp quit
    quit:
        mov okRegister, 1
    L4:
        
    INVOKE ExitProcess, 0
main ENDP
END main
