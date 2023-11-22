; Encryption Using Rotate Operations  (7-4.asm)
; Program Description : Write a procedure that performs simple encryption by rotating each plaintext byte a varying number of positions in different directions.
;                       For example, in the following array that represents the encryption key, a negative value indicates a rotation to the left and a positive value 
;                       indicates a rotation to the right. The integer in each position indicates the magnitude of the rotation:
;                               key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
;                       Your procedure should loop through a plaintext message and align the key to the first 10 bytes of the message. 
;                       Rotate each plaintext byte by the amount indicated by its matching key array value.
;                       Then, align the key to the next 10 bytes of the message and repeat the process. 
;                       Write a program that tests your encryption procedure by calling it twice, with different data sets.
; Copy Website : https://handhikayp.medium.com/encryption-using-rotate-operations-assembly-solution-9c76a76c22a5
; Author : Slider
; Creation Date : 2023/11/22
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
keySize = $ - key
plainText Byte "Handhika Yanuar Pratama",0

.code
main PROC
	mov edx,OFFSET plainText
	mov esi,OFFSET plainText

L1: mov ecx,keySize
	mov edi, OFFSET key
	jnz L1

	mov edx,OFFSET plainText

main ENDP

Encryption PROC
L1: push ecx
	cmp BYTE PTR[esi],0
	je L4

	mov cl,[edi]
	cmp cl,0
	jge L2
	rol BYTE PTR[esi],cl
	jmp L3

L2: ror BYTE PTR[esi],cl

L3: inc esi
	inc edi
	pop ecx
	loop L1
	 
	or eax,1
	jmp L5

L4: pop ecx

L5: ret
Encryption ENDP
END main
