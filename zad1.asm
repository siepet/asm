zad1	SEGMENT
		ASSUME	cs:zad1,ds:zad1,ss:zad1,es:zad1
		ORG	100h

xyz:
	mov ah,0Eh
	mov al,4Dh
	int 10h
	
	mov ah,0Eh
	mov al,61h
	int 10h
	
	mov ah,0Eh
	mov al,72h
	int 10h
	
	mov ah,0Eh
	mov al,63h
	int 10h
	
	mov ah,0Eh
	mov al,69h
	int 10h
	
	mov ah,0Eh
	mov al,6Eh
	int 10h
	
	;mov ah,0Eh
	;mov al,0Ah
	;int 10h
	
	mov ah,0Eh
	mov al,0Dh
	int 10h
	
	mov ah,0Eh
	mov al,53h
	int 10h
	
	mov ah,0Eh
	mov al,69h
	int 10h
	
	mov ah,0Eh
	mov al,65h
	int 10h
	
	mov ah,0Eh
	mov al,70h
	int 10h
	
	mov ah,0Eh
	mov al,65h
	int 10h
	
	mov ah,0Eh
	mov al,74h
	int 10h
	
	mov ah,0Eh
	mov al,6Fh
	int 10h
	
	mov ah,0Eh
	mov al,77h
	int 10h
	
	mov ah,0Eh
	mov al,73h
	int 10h
	
	mov ah,0Eh
	mov al,6Bh
	int 10h
	
	mov ah,0Eh
	mov al,69h
	int 10h
	
	mov	ah,4CH
	mov	al,0
	int	21h
zad1	ENDS
	END	xyz