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
		
		mov cx, 8		; wrzucamy 8 z racji tego, ze chcemy wypisac BAJT - 8 bitow
s:		
		mov al, 24		; wrzucamy do al 24, z racji tego ze 1*)
		shl bl,1		; przesuwamy BL w lewo o jeden bit
		rcl al,1		; 1*) robiac RCL przesuwamy z carry do al wiec 24 z al zmieni się w 48 lub 49
					; by był znak ascii
		mov ah,0Eh		;putchar
		int 10h

		loop s			; loopujemy sobie cx razy
		
		pop cx
		pop bx
		pop ax
		
		ret
bin 	ENDP
bin1	ENDS
		END start
