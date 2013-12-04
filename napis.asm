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
		
		mov ax, SEG napis
		mov ds, ax
		mov bx, offset napis
		call puts					; 'it breaks'
									; 'no' wait for it 'yes'

		exit 0


;	***************************************************
;
;	Drukuje napis, ktorego offest znajduje sie w bx.
;	; w PARZE REJESTROW DS:BX
; 	***************************************************
puts	PROC
		mov si, 0
		
a:
		mov al, [bx+si]
		cmp al, 0
		je cd
		putchar al
		inc si
		jmp a
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
