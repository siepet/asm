; makro wykonujące zwykłe wyjscie z programu używajac funkcji 4C przerwania 21h
exit	MACRO	k
	mov ah, 4Ch
	mov al, k
	int 21h
	ENDM
; zamiast używać na okrąglo przerwania 10h, mozna zastąpić to makrem 'putchar'
putchar	MACRO	k
	mov ah, 0Eh
	mov al, k
	int 10h
	ENDM

AATOI	SEGMENT
		ASSUME cs: AATOI, ds: AATOI, es: AATOI, ss: AATOI
		ORG 100h

start:
		;mov bx, offset string	; do bx wrzucany jest offset 'string'
		lea bx, string		; robi to samo, ale ładniej
		call atoi		; uruchamiamy funkcje atoi
		call hex		; wyswietlamy 'string' w postaci heksadecymalnej
		putchar 10	; enter
		putchar 13	; enter
		exit 0

string:	DB	"65535",0				; 3039h, definiujemy bajty
			
; *****************************************************************
;	ASCII TO INTEGER PRODECURE
;
;	Bierze napis i zamienia go na liczbe, zapisujac w ax.
;
;
; *****************************************************************


atoi	PROC
		mov si, 0		; do rejestru si(source index) ładujemy 0
		xor ax, ax		; zerujemy rejestr ax
		mov cx, 0Ah		; do cx wrzucamy 0Ah
		xor dx, dx		; zerujemy rejestr dx

s:
		mov dl, [bx+si]			; al == 31, pobieramy 1 znak ze stringu
		cmp dl, 0			; sprawdzamy czy nie jest 0 dla warunku wyjscia z petli
		je k				; jesli jest zerem, idziemy do k

		sub dl, 30h				; al == 1, odejmujemy od dla 30h	
		push dx					; wrzucamy caly dx na stos, bo mul go zeruje
		mul cx					; al * 10
		pop dx					; zabieramy dx ze stosu
				
		add ax, dx				; do ax dodajemy dx
		inc si					; inkrementujemy si
		jmp s					; i wracamy na poczatek bloku

k:
							; 
		ret
atoi	ENDP
deci2	PROC
		push ax
		; ax = 65535
		xor dx, dx
		mov cx, 10000
		div cx
		; DX = DX:AX % cx ; this case: 5535
		; AX = DX:AX / cx ; this case: 6
		; mov ax, 5
		; 0000 0000 0000 0110
		; 0000 0000 AH 
		; 	
		add al, 48
		putchar al

				
		mov ax, dx
		xor dx, dx
		mov cx, 1000
		div cx
		add al, 48
		putchar al
		
		mov ax, dx
		xor dx, dx
		mov cx, 100
		div cx
		add al, 48
		putchar al
		
		mov ax, dx
		xor dx, dx
		mov cx, 10
		div cx
		add al, 48
		putchar al
		
		mov ax, dx
		xor dx, dx
		mov cx, 1
		div cx
		add al, 48
		putchar al
		
		
		pop ax
		ret
deci2	ENDP

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

		push ax		; pushujemy na stos wszystkie 4 rejestry ogolnego przeznaczenia
		push bx
		push cx
		push dx
		
		mov dx,ax	; do dx wrzucamy ax
		mov dx,ax	; do dx wrzucamy ax
		
		mov bx,dx	; do bx, wrzucamy dx
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

AATOI	ENDS
		END start
