hex1 	SEGMENT
		ORG	100h
	
start:
		mov al, 128
		
		
		mov ah,4Ch
		mov al, 0
		int 21h

