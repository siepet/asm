bin1	SEGMENT
		ASSUME cs:bin1,ds:bin1,ss:bin1,es:bin1
		ORG 100h
		
		
start:
		mov bl,24
		
		call bin
		
		
		mov ah, 4Ch
		mov al, 0
		int 21h
		
		
; *****************************************************************************
	; Opis: 	Procedura wypisuje liczbę z rejestru bl w systemie binarnym.
	
	; Wejście:	Na wejściu przyjmowany jest 8-bitowy rejestr w którym znajduje się liczba w systemie decymalnym bądź heksadecymalnym.
	
	; Wyjście:	Wypisana liczba binarna na stdout.

; *****************************************************************************
bin 	PROC
		push ax
		push bx
		push cx
		
		mov cx, 8
s:		
		mov al, 24
		shl bl,1
		rcl al,1
		
		mov ah,0Eh		;putchar
		int 10h

		loop s
		
		pop cx
		pop bx
		pop ax
		
		ret
bin 	ENDP
bin1	ENDS
		END start