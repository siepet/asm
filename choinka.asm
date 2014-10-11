exit	MACRO k
		mov ah, 4Ch
		mov al, k
		int 21h
		ENDM

putchar	MACRO k
		;mov ax, 0
		mov ah, 0Eh
		mov al, k
		int 10h
		ENDM
		
choinka	SEGMENT
		ASSUME ds: choinka, es: choinka, cs: choinka, ss: choinka
		ORG 100h
		
		
start:
		mov bl, 60
Gora:
		sub bl, 1
		putchar '*'
		cmp bl, 0
		jne Gora
		putchar 13
		putchar 10
		
		putchar '*'
		putchar 32		
		putchar 32		
		putchar 32		
		putchar '/'		
		putchar '\'		
		putchar 10		
		putchar 13		
		
		putchar '*'
		putchar 32
		putchar 32
		putchar '/'
		putchar '/'
		putchar '\'
		putchar '\'
		putchar 13
		putchar 10
		
		putchar '*'
		putchar 32
		putchar '/'
		putchar '/'
		putchar '/'
		putchar '\'
		putchar '\'
		putchar '\'
		putchar 13
		putchar 10
		
		putchar '*'
		putchar '/'
		putchar '/'
		putchar '/'
		putchar '/'
		putchar '\'
		putchar '\'
		putchar '\'
		putchar '\'
		putchar 13
		putchar 10
		
		
		putchar '*'
		putchar 32
		putchar 32
		putchar '-'
		putchar '-'
		putchar '-'
		putchar '-'
		putchar 13
		putchar 10
		
		
		putchar '*'
		putchar 32
		putchar 32
		putchar 32
		putchar '|'
		putchar '|'
	
		mov bl, 60
Dol:
		sub bl, 1
		putchar '*'
		cmp bl, 0
		jne Dol
		putchar 13
		putchar 10
		
		exit 0
		
choinka	ENDS
		END start