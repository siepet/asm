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

		mov cl, 15			; do cl wrzucamy poczatkowa wartosc przesuniecia
		mov dx, ax			; do dx wrzucamy ax, by ax byl glowna zmienna a dx tempem

s:	
		mov bx,dx			; do bx wrzucamy dx
		shr bx,cl			; przesuwamy bx o cl bitow w prawo
		and bx,7			; andujemy z 7 / 111
		mov ax,bx			; do ax wrzucamy bx
		add al,48			; dodemy do al 48
		mov ah, 0Eh			; putcharujemy
		int 10h				; ladnie na ekran
				
		sub cl, 3			; odejmujemy od cl 3, bo grupujemy cyferki po 3 bo tak rodzi sie osemkowy system
		jnc s				; jesli nie wyszlo poza 0, czyli nie ma pozyczki skaczemy do s
		
		
		
		
		pop dx
		pop cx
		pop bx
		pop ax
		ret
oct		ENDP
oct1	ENDS
		END start
