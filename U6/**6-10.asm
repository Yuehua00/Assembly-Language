; Boolean Calculator (1)  (6-5.asm)
; Program Description : Data transmission systems and file subsystems often use a form of error detection that relies on calculating the parity (even or odd) of blocks of data. 
;                       Your task is to create a procedure that returns True in the EAX register if the bytes in an array contain even parity, or False if the parity is odd. 
;                       In other words, if you count all the bits in the entire array, their count will be even or odd. Preserve all other register values between calls to the procedure. 
;                       Write a test program that calls your procedure twice, each time passing it a pointer to an array and the length of the array. 
;                       The procedure’s return value in EAX should be 1 (True) or 0 (False). For test data, create two arrays containing at least 10 bytes, 
;                       one having even parity, and another having odd parity. 
;                       Tip: 
;                       Earlier in this chapter, we showed how you can repeatedly apply the XOR instruction to a sequence of byte values to determine their parity. 
;                       So, this suggests the use of a loop. But be careful, since some machine instructions affect the Parity flag, and others do not. 
;                       You can find this out by looking at the individual instructions in Appendix B. 
;                       The code in your loop that checks the parity will have to carefully save and restore the state of the Parity flag to avoid having it unintentionally modified by your code.
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    byte1 BYTE 11111110b, 11011110b, 10001110b, 11101100b, 11001100b, 11001010b, 11001010b, 11001010b, 11000110b, 10001100b                            ; 0
    byte2 BYTE 11111110b, 11011111b, 10001110b, 11101100b, 11001100b, 11001011b, 11001010b, 11001010b, 11000110b, 10001100b, 11111110b, 11011110b      ; 1

.code
main PROC
    mov esi, OFFSET byte1
    mov ecx, SIZEOF byte1
    call PFCheck

    mov esi, OFFSET byte2
    mov ecx, SIZEOF byte2
    call PFCheck

main ENDP

;------------------------------------------;
; PFCheck                                  ;
; Use xor to check.                        ;
; eax PF = 1 TURE PF = 0 FALSE             ;
;------------------------------------------;

PFCheck PROC USES esi ecx
    sub ecx, 1
    mov al, 0
    xor al, 0

    mov al, [esi]

    L1:
        inc esi
        xor al, [esi]
        mov bl, [esi]
    loop L1

    jp LPF1
    mov eax, 0
    jmp quit

    LPF1:
        mov eax, 1
    quit:
    ret

PFCheck ENDP

END main

