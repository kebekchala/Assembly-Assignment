.model small
.stack 100h
.data
	msg1 db "ENTER THE DIVIDEND NUMBER==> $"
	msg2 db 10,13,"ENTER THE DIVISOR NUMBER==>  $"
	msg3 db 10,13,'Quotient==>  $'
	msg4 db 10,13,'Remainder==> $'

	dividend dw 0h 
	divisor dw 0h 
	quotient dw 0h 
	remainder db ? 
	
.code     

	main proc
		mov ax,@data
		mov ds,ax
		lea dx, msg1
		mov ah,9h
		int 21h
		
		;to take the dividend number from user
		mov ah,1h
		int 21h		
		sub ax,30h
		mov dividend,ax
		
		lea dx, msg2		
		mov ah,9h
		int 21h 
		
		;to take the divisor number from user
		mov ah,1h
		int 21h 
		sub ax,30h
		mov divisor, ax
        
        
        
		mov ax, dividend 
		mov bx, divisor   
		;This part used to clear value from al 
		mov cx, 0     
        mov cl, al
        mov ax, cx
		div bl	
		
		mov cx,0      ;clearing register cx to store al
			 
		mov cl, al    ;store al from al to cl
		add cl, 30h
		mov quotient, cx;move cx(incloding ch=0 & cl) to result
		
		mov remainder , ah 
		add remainder , 30h
		
		;To display the quotient	
		lea dx,msg3
		mov ah,9h
		int 21h
		mov dx, quotient
		mov ah, 2h	
		int 21h 
		
		;To display the remainder
		lea dx,msg4
		mov ah,9h
		int 21h
		mov dl, remainder
		mov ah, 2h	
		int 21h
        
		mov ah,4ch
		int 21h
		
		    	
			
	main endp
	end main