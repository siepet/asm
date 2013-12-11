exit	MACRO	k
	mov ah, 4Ch
	mov al, k
	int 21h
	ENDM

putchar	MACRO	k
	mov ah, 0Eh
	mov al, k
	int 10h
	ENDM

Atoi	SEGMENT
	ASSUME cs: Atoi, ds: Atoi, es: Atoi, ss: Atoi
	ORG 100h

start:
	mov bx, offset string
	call atoi

	putchar 65	; prints capital letter 'a'
	exit 0

string:	DB	"12345",0

; *****************************************************************
;	ASCII TO INTEGER PRODECURE
;
;	Bierze napis i zamienia go na liczbe, zapisujac w ax.
;
;
; *****************************************************************


atoi	PROC
	mov si, 0
	mov ax, 0
	mov cx, 10

s:
	mov dl, [bx+si]
	cmp dl, 0
	je k

	sub dl, 48
	mul cx
	add ax, dl
	;lea ax, [ax*10+dl] ; (??) it works?
	inc si
	jmp s

k:
	ret
atoi	ENDP


Atoi	ENDS
	END start
