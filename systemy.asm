systemy	SEGMENT
		ASSUME cs:systemy,ds:systemy,ss:systemy,es:systemy
		ORG 100h
		
start: 
		mov ax,255
		
		call bin
		call entery
		;mov ax, 255
		call oct
		call entery
		call hex
		call entery
		call pozdro
		call entery
		
		mov ah, 4Ch
		mov al, 0
		int 21h
		
		
		
entery	PROC
		push ax
		mov ah, 0Eh
		mov al, 10
		int 10h
		
		mov ah, 0Eh
		mov al, 13
		int 10h
		
		pop ax
		ret
entery	ENDP
; *****************************************************************************
	; Opis: 	Procedura wypisuje liczbę z rejestru bl w systemie binarnym.
	
	; Wejście:	Na wejściu przyjmowany jest 8-bitowy rejestr w którym znajduje się liczba w systemie decymalnym bądź heksadecymalnym.
	
	; Wyjście:	Wypisana liczba binarna na stdout.

; *****************************************************************************
bin 	PROC
		push ax
		push bx
		push cx
		
		mov bx,ax
		
		mov cx, 8
binS:		
		mov al, 24
		shl bl,1
		rcl al,1
		
		mov ah,0Eh		;putchar
		int 10h

		loop binS
		
		pop cx
		pop bx
		pop ax
		
		ret
bin 	ENDP

; *********************************************************************************
	; Opis:	Zamienia liczbę z rejestru ax na system oktagonalny.
	
	; Wejscie: rejestr ax w którym znajduje się liczba do konwersji na system oktagonalny.
	
	; Wyjscie:	wypisanie liczby w systemie oktagonalnym na stdout.

; *********************************************************************************
oct		PROC
		push ax
		push bx
		push cx
		push dx

		mov cl, 15
		mov dx, ax

octS:	
		mov bx,dx
		shr bx,cl
		and bx,7
		mov ax,bx
		add al,48
		mov ah, 0Eh
		int 10h
		
		sub cl, 3
		jnc octS
		
		
		
		
		pop dx
		pop cx
		pop bx
		pop ax
		ret
oct		ENDP

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

		push ax
		push bx
		push cx
		push dx
		
		mov dx,ax
		mov dx,ax
		
		mov bx,dx
		shr bx,12
		and bx,15
		mov ax,bx
		
		cmp ax,10
		jge yyy
		add al,48
		sub al, 55
yyy:
		add al, 55
		
		mov ah, 0Eh
		int 10h
		
		mov bx,dx
		shr bx,8
		and bx,15
		mov ax,bx
		
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

pozdro	PROC
		push ax
		
		mov ah, 0Eh
		mov al, 80
		int 10h

		mov ah, 0Eh
		mov al, 111
		int 10h
		
		mov ah, 0Eh
		mov al, 122
		int 10h
		
		mov ah, 0Eh
		mov al, 100
		int 10h
		
		mov ah, 0Eh
		mov al, 114
		int 10h
		
		mov ah, 0Eh
		mov al, 97
		int 10h
		
		mov ah, 0Eh
		mov al, 119
		int 10h
		
		mov ah, 0Eh
		mov al, 105
		int 10h
		
		mov ah, 0Eh
		mov al, 97
		int 10h
		
		mov ah, 0Eh
		mov al, 109
		int 10h
		
		pop ax
		ret
pozdro	ENDP


		

systemy	ENDS
		END start