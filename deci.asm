putchar	MACRO k
		;mov ax, 0
		mov ah, 0Eh
		;mov al, k
		int 10h
		ENDM

deci	SEGMENT
		ASSUME    cs:deci, es:deci, ds:deci, ss:deci
		ORG    100h
start:
		mov ax, 12341								;	max number available: 65535 !!! 0FFFFh !!!!!
		call deci2
		call entery
		
		mov ax, 0
		mov	ah, 4Ch
		mov al, 0
		int	21h
; **********************************************************************************

	; Opis: 	Procedura wypisuje liczbę z rejestru ax w systemie dziesiętnym

	; Wejscie: 	Na wejsciu przyjmowana jest liczba z przedzialu 0...65535 do rejestru ax
	
	; Wyjscie:	Wypisana liczba w systemie dziesietnym
	

; **********************************************************************************
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
dec1	PROC
		
		mov si, 0		;; licznik
		mov cl, 10		;; divider
Divide:
		
		add si, 2					; AH:AL => DX:AX 
		div cl 						; remainder in AH, quotient in AL 59 / 10 == 5 * 10 + (9) -> 5 / 10 == 0 * 10 + (5) <- ah
		
		

		mov bh, ah
		mov bl, al
		add bh, 48  				; liczba jednostek
		push bx
		mov ax, 0
		mov al, bl
		cmp al, 0					; Z = 1, gdy wynik arg1 - arg2 == 0 (cmp arg1, arg 2)
		jnz Divide					; skacz dopóki AL != 0


Show:
		sub si, 2
		pop bx
		
		mov ax, 0
		mov ah, 0Eh
		mov al, bh

		int 10h
		cmp si, 0
		jnz Show
		
		ret
dec1	ENDP	
		
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
entery ENDP


deci	ENDS
		END start
