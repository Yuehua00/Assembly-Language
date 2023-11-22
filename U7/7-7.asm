; Bitwise Multiplication  (7-7.asm)
; Program Description : Write a procedure named BitwiseMultiply that multiplies any unsigned 32-bit integer by EAX, using only shifting and addition. 
;                       Pass the integer to the procedure in the EBX register, and return the product in the EAX register. 
;                       Write a short test program that calls the procedure and displays the product. (We will assume that the product is never larger than 32 bits.)
;                       This is a fairly challenging program to write. One possible approach is to use a loop to shift the multiplier to the right, 
;                       keeping track of the number of shifts that occur before the Carry flag is set.
;                       The resulting shift count can then be applied to the SHL instruction, using the multiplicand as the destination operand.
;                       Then, the same process must be repeated until you find the last 1 bit in the multiplier
; Author : Slider
; Creation Date : 2023/11/23
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main PROC
    mov ebx, 456
    mov eax, 52
    call BitwiseMultiply

main ENDP

BitwiseMultiply PROC
    
    mov edx, 0
    
    ;asign cl to 0 to keep track of the number of
    ;shifts that occure before the Carry Flag is set.
    mov cl, 0

    
    LOOP1:
        shr eax, 1    
        jc shiftAndAdd  ;if CF is 1, then jump to shiftadd
        inc cl       ;if CF is 0 increment the counter value
        jmp next     

    shiftAndAdd:
        shl ebx, cl  
        add edx, ebx 
        shl ebx, 1  
        mov cl, 0  

    next:
        cmp eax, 0 
        je final
        jmp LOOP1 
    final:
        mov eax, edx  ;move the result into eax
    ret
BitwiseMultiply ENDP
END main
