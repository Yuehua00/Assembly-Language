; WARNNING : 其實我不太確定對不對，6-3.4 是 XOR 兩個數字
; Message Encryption  (6-8.asm)
; Program Description : Revise the encryption program in Section 6.3.4 in the following manner: Create an encryption key consisting of multiple characters. 
;                       Use this key to encrypt and decrypt the plaintext by XORing each character of the key against a corresponding byte in the message. 
;                       Repeat the key as many times as necessary until all plain text bytes are translated. Suppose, for example, the key were equal to “ABXmv#7".
;                       This is how the key would align with the plain text bytes
;                       Plain text T h i s   i s   a   P l a i n t e x t   m e s s a g e (etc.)
;                       key        A B X m v # 7 A B X m v # 7 A B X m v # 7 A B X m v # 7 
;                       (The key repeats until it equals the length of the plain text...)
; Author : Slider
; Creation Date : 2023/11/21
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    PlainText   BYTE "This is a Plaintext message", 0
    Key         BYTE "ABXmv#7", 0
    keyLen      DWORD LENGTHOF Key

.code
main PROC
    call TranslateBuffer
    invoke ExitProcess, 0

main ENDP

;------------------------------------------;
; TranslateBuffer                          ;
;
;------------------------------------------;

TranslateBuffer PROC
    pushad

    mov ecx, LENGTHOF PlainText
    mov esi, 0

    mov edx, LENGTHOF Key
    mov edi, 0
    mov ecx, LENGTHOF PlainText

    L1:
        mov al, PlainText[esi]
        xor al, Key[edi]
        mov PlainText[esi], al

        inc esi
        inc edi
        cmp keyLen, edi
        je L2
        jne next
    L2:
        mov edi, 0
    next:
loop L1

    popad
    ret

TranslateBuffer ENDP

END main

