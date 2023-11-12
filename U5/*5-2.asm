; Linking Array Items  (5-2.asm)

; Program Description : Suppose you are given three data items that indicate a starting index in a list, an array of characters, and an array of link index. 
;                       You are to write a program that traverses the links and locates the characters in their correct sequence. 
;                       For each character you locate, copy it to a new array. 
;                       Suppose you used the following sample data, and assumed the arrays use zero-based indexes:
;                       start = 1
;                       chars: H    A    A    C    C    E    B    D    D    F    F    G
;                       links: 0    4    4    5    5    6    2    3    3    7    7    0
;                       Then the values copied (in order) to the output array would be A,B,C,D,E,F,G,H. 
;                       Declare the character array as type BYTE, and to make the problem more interesting, declare the links array type DWORD.
; Author : Slider
; Creation Date : 2023/11/12
; Revisions :
; Date :                          Modified by : 

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	char DWORD 'H', 'A', 'A', 'C', 'C', 'E', 'B', 'D', 'D', 'F', 'F', 'G'
	link DWORD 0, 4, 4, 5, 5, 6, 2, 3, 3, 7, 7, 0
	linktype DWORD TYPE link
	newarray DWORD LENGTHOF char DUP(?)
	start DWORD 1

.code
main PROC
	mov ECX, LENGTHOF newarray
	mov EDI, OFFSET newarray

	L1:
		; Get char array element accoridng to start
		mov ESI, OFFSET char
		add ESI, start
		mov AL, [ESI]

		; Move element to new array
		mov [EDI], AL

		; Move start to element in the links array
        mov EAX, start
        mul linktype
		mov EDX, OFFSET link   ; If this do before "mov EAX, start mul linktype", EDX will be reseted to 000000, and occure error
        mov start, EAX
        add EDX, start

		; Replace start      
        mov EAX, [EDX]
        mov start, EAX

        inc EDI
    LOOP L1

	INVOKE ExitProcess, 0
main ENDP
END main
