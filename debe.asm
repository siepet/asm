exit	MACRO k
		mov ah, 4Ch
		mov al, k
		int 21h
		ENDM


debe	SEGMENT
		ASSUME cs:debe, es:debe, ss: debe, ds: debe
		ORG 100h
		
start:
		
		mov bx, offset liczba
		mov al, [bx]
		call hex




		exit 0		
		
liczba:	DB 254
napis:	DB "Marcinek", 0
; * printing sting **
print	PROC
		mov si, 0
		
a:
		mov al, [bx+si]
		
		inc si
		jmp a
		


		ret
print 	ENDP
; *** hexing ***
hex 	PROC 	

		push ax
		push bx
		push cx
		push dx
		
		mov dx,ax
		mov dx,ax
		
		mov bx,dx
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
		
debe	ENDS
		END start