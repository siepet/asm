hex1 	SEGMENT
		ASSUME	cs:hex1,ds:hex1,ss:hex1,es:hex1
		ORG	100h



start:
		mov ax, 255
		
		call hex
		;kod
		;call hex
		;kod
		;call hex
		;kod
		;call hex
		mov ah,4Ch
		mov al, 0
		int 21h

		
; *********************************************************************
	; Opis:
	; Prodecura wypisuje liczbę z rejestru ax w systemie heksadecymalnym.
	; PUSH-ując rejestry modyfikowane wewnątrz i POP-ując je przed zakończeniem.

	; Wejście:
	; Przyjmowany na wejsciu jest 16-bitowy rejestr ax, w którym znajduje się liczba

	; Wyjście:
	; Wypisana liczba heksadecymalna na stdout.

; *********************************************************************

hex 	PROC 	

		push ax				; pushujemy 4 rejestry na stos dla beki
		push bx
		push cx
		push dx
		
		mov dx,ax			; do dx wrzucamy ax
		mov dx,ax			; dwa razy for the lulz XD
						; 1*)
		mov bx,dx			; do bx wrzucamy dx
		shr bx,12			; przesuwamy bx o 12 bitow w prawo
		and bx,15			; andujemy z FF / 1111 / 15
		mov ax,bx			; do ax wrzucamy wynik andowania
				
		cmp ax,10			; porownujemy ax z 10
		jge yyy				; jesli jest wieksze skaczemy do yyy
		add al,48			; dodajemy do al 48
		sub al, 55			; odejmujemy od al 55
yyy:
		add al, 55			; dodajemy do al 55
		
		mov ah, 0Eh
		int 10h
		
		mov bx,dx			; powtarzamy krok 1*) z poprawka
		shr bx,8			; na inne przesuniecie bx
		and bx,15
		mov ax,bx			; wiec program dziala tak samo, robi 4 razy to samo
						; prostota ogarniecia: poziom very easy
		cmp ax,10
		jge yyz
		add al,48
		sub al, 55
yyz:
		add al, 55
		
		mov ah, 0Eh
		int 10h
		
		mov bx,dx
		shr bx,4
		and bx,15
		mov ax,bx
		
		cmp ax,10
		jge yya
		add al,48
		sub al, 55
yya:
		add al, 55
		
		mov ah, 0Eh
		int 10h
		

		
		mov cl, 0
		mov bx,dx
		shr bx,cl
		and bx,15
		mov ax,bx
		
		cmp ax,10
		jge yyb
		add al,48
		sub al, 55
yyb:
		add al, 55
		
		mov ah, 0Eh
		int 10h
		
		pop dx
		pop bx
		pop cx
		pop ax
		
		ret
hex		ENDP
hex1	ENDS
		END start

