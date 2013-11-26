zad3	SEGMENT
		ASSUME	cs:zad3,ds:zad3,ss:zad3,es:zad3
		ORG	100h

xyz:
		
		mov ax,10
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
		
		
		
		mov	ah,4CH
		mov	al,0
		int	21h

zad3	ENDS
		END	xyz