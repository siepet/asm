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
		
		mov ax, SEG gora
		mov ds, ax
		mov bx, offset gora
		call puts					; 'it breaks'
		; 'no' wait for it 'yes'
		
		;mov ah, 10h
		;mov al, 3
		;mov bl, 1
		;int 10h
		
		mov bh, 0
		mov ah, 2
		; dh = y
		; dl = x
		mov dh, 15
		mov dl, 15
		int 10h
		
		mov cx, 1
		mov ah, 9h
		mov al, '*'
		
		mov bl, 83h
		
		; 0100 0000
		; 1011 1111
		int 10h
		
		; 0000 0000
		; czarny czarny
		; 1111 0000
		; 1000 1111
		; 
		
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
gora	DB "******************************************************************************", 13, 10
		DB "*                                     *                   *                  *", 13, 10
		DB "*  *        /\      *            *                                    *      *", 13, 10
		DB "*       *  //\\                   *           *                              *", 13, 10
		DB "*         ///\\\                                                             *", 13, 10
		DB "*        ////\\\\       *                                  *                 *", 13, 10
		DB "*         ------                    *                            *           *", 13, 10
		DB "*           ||      *                            *     *                     *", 13, 10
		DB "*  *             *                                                  *        *", 13, 10
		DB "*       *              *     *            *   *             *                *", 13, 10
		DB "*                *                                                  *        *", 13, 10
		DB "*                      *     *               *                               *", 13, 10
		DB "*   *            *        *                           *               *      *", 13, 10
		DB "*                                                                            *", 13, 10
		DB "*       *              *     *            *   *                              *", 13, 10
		DB "*                                                          *                 *", 13, 10
		DB "*              *                    *                                        *", 13, 10
		DB "**                                                                           *", 13, 10
		DB "*       *              *     *        *    *   *            *                *", 13, 10
		DB "******************************************************************************", 13, 10
		DB "**************************** ! WESOLYCH SWIAT ! ******************************", 13, 10
		DB "******************************************************************************", 0
PDANE	ENDS

STO		SEGMENT STACK
DW 20 DUP(?)
STO		ENDS
		END start
