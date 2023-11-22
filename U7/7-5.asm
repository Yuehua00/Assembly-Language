; Prime Numbers  (7-5.asm)
; Program Description : Write a program that generates all prime numbers between 2 and 1000, using the Sieve of Eratosthenes method. 
;                       You can find many articles that describe the method for finding primes in this manner on the Internet. Display all the prime values.
; Author : Slider
; Creation Date : 2023/11/22
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

FIRST_PRIME = 2
LAST_PRIME = 1000

.data
sieve BYTE LAST_PRIME dup(0)

.code
main proc

    mov esi, FIRST_PRIME

    ; The outer loop to find prime numbers
    .WHILE esi <= LAST_PRIME
        ; Check if the number is marked as prime
        .IF sieve[esi] == 0
            mov edx, esi
            call CrossOutMultiples
        .ENDIF
        inc esi
    .ENDW

    invoke ExitProcess, 0
main endp

CrossOutMultiples proc
    ; Input: edx - the prime number to cross out multiples of
    ; Output: None

    push ebx 
    push ecx

    mov ebx, edx         ; ebx = edx (the prime number)
    mov ecx, ebx         ; ecx = ebx

    ; Start crossing out multiples of the prime number
    add ecx, ebx         ; ecx += ebx (skip the prime number itself)
    .WHILE ecx <= LAST_PRIME
        mov sieve[ecx], 1 ; Mark as not prime
        add ecx, ebx      ; Move to the next multiple
    .ENDW

    pop ecx 
    pop ebx
    ret
CrossOutMultiples endp

end main
