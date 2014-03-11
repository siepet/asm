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

PEXE	SEGMENT
		ASSUME cs:PEXE, ds: PEXE, es: PEXE, ss: PEXE
		ORG 0
		
start:
		
		mov ax, SEG napis				; do ax wrzucamy SEGMENT napisu
		mov ds, ax					; wrzucamy do DS ax, bo DS:BX tworzy adres danych
		mov bx, offset napis				; do bx wrzucamy offeset napisu
		call puts					; 'it breaks'
									; 'no' wait for it 'yes'

		exit 0


;	***************************************************
;
;	Drukuje napis, ktorego offest znajduje sie w bx.
;	; w PARZE REJESTROW DS:BX
; 	***************************************************
puts	PROC
		mov si, 0				; licznik znaku
		
a:
		mov al, [bx+si]				; drukujemy znak 0 indeksujac od 0, a0, a1, a2... an
		cmp al, 0				; porownujemy z 0, jako "string terminator" z C null byte
		je cd					; jesli jest 0 to skaczemy na koniec "cd"
		putchar al				; jesli nie skoczy to wyswietla to co jest al
		inc si					; inkrementujemy si
		jmp a					; skaczemy do a
cd:
		
		ret
puts	ENDP

PEXE 	ENDS

PDANE	SEGMENT
napis	DB "ALAMAKOTALOLNIEMAKOTA13ALA", 0
PDANE	ENDS

STO		SEGMENT STACK
DW 20 DUP(?)
STO		ENDS
		END start
