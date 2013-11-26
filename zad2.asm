zad2	SEGMENT
		ASSUME	cs:zad2,ds:zad2,ss:zad2,es:zad2
		ORG	100h

xyz:
		
		mov bl,255
		and bl,0Fh
		add bl,30h
		
		
		
		mov ah,0Eh			; putchar
		mov al,bl			; putchar
		int 10h				; putchar
		
		mov	ah,4CH
		mov	al,0
		int	21h

zad2	ENDS
		END	xyz