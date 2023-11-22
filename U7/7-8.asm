; Add Packed Integers  (7-8.asm)
; Program Description : Extend the AddPacked procedure from Section 7.6.1 so that it adds two packed decimal integers of arbitrary size (both lengths must be the same). 
;                       Write a test program that passes AddPacked several pairs of integers: 4-byte, 8-byte, and 16-byte. We suggest that you use the
;                       following registers to pass information to the procedure:
;                           ESI - pointer to the first number
;                           EDI - pointer to the second number
;                           EDX - pointer to the sum
;                           ECX - number of bytes to add
; Author : Slider
; Creation Date : 2023/11/23
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
packed_1 WORD 4536h
packed_2 WORD 7297h
sum DWORD ?

.code
main PROC
	mov sum,0
	mov esi,0

	mov al,BYTE PTR packed_1[esi]
	add al,BYTE PTR packed_2[esi]
	daa
	mov BYTE PTR sum[esi],al

	; Add high bytes, include carry.
	inc esi
	mov al,BYTE PTR packed_1[esi]
	adc al,BYTE PTR packed_2[esi]   ; 兩個 64 bits 數值的相加或相減
	daa                             ; 將樹轉為10進制
	mov BYTE PTR sum[esi],al

	; Add final carry, if any.
	inc esi
	mov al,0
	adc al,0
	mov BYTE PTR sum[esi],al


main ENDP
END main
