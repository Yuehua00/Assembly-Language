; Greatest Common Divisor (GCD)  (7-6.asm)
; Program Description : The greatest common divisor (GCD) of two integers is the largest integer that will evenly divide both integers. 
;                       The GCD algorithm involves integer division in a loop, described by the following pseudocode:
;                            int GCD(int x, int y)
;                            {
;                                x = abs(x) // absolute value
;                                y = abs(y)
;                                do {
;                                int n = x % y
;                                x = y
;                                y = n
;                                } while (y > 0)
;                                return x
;                            }
;                       Implement this function in assembly language and write a test program that calls the function several times, passing it different values. Display all results on the screen
; Copy Website : https://stackoverflow.com/questions/63109332/the-greatest-common-divisor-gcd-of-two-integers-is-the-largest-integer-that-wi
; Author : Slider
; Creation Date : 2023/11/23
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array SDWORD -4,-20,36,24,11,9,448,224,15,-30

.code
main PROC

    mov  ecx,LENGTHOF array / 2
    mov  esi,OFFSET array
    

L1: mov  eax,[esi]
    mov  ebx,[esi+4]
    call findGCD
    add  esi,TYPE array * 2
    loop L1

main ENDP
 
findGCD PROC

    push ebx
    push edx

    .IF SDWORD PTR eax < 0
      neg eax
    .ENDIF

    .IF SDWORD PTR ebx < 0
      neg ebx
    .ENDIF

L1: mov  edx,0
    div  ebx
    cmp  edx,0
    je   L2
    mov  eax,ebx
    mov  ebx,edx
    jmp  L1

L2: mov eax,ebx ; EAX = GCD

    pop edx
    pop ebx
    ret
findGCD ENDP

END main
