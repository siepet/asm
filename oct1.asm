oct1	SEGMENT
		ASSUME cs:oct1,ds:oct1,es:oct1,ss:oct1
		ORG 100h
		
start:
		mov ax, 255
		
		call oct
		
		mov ah, 4Ch
		mov al, 0
		int 21h

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

s:	
		mov bx,dx
		shr bx,cl
		and bx,7
		mov ax,bx
		add al,48
		mov ah, 0Eh
		int 10h
		
		sub cl, 3
		jnc s
		
		
		
		
		pop dx
		pop cx
		pop bx
		pop ax
		ret
oct		ENDP
oct1	ENDS
		END start