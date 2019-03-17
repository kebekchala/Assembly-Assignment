             
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
	remainder dw 0h 

	somevar db '$' 
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

		mov dx, 0 
		mov ax, dividend   
		;This part used to clear value from al
		mov cx, 0
		mov cl, al
		mov ax, cx
		mov bx, divisor 
		;this part used to clear value from cx
		mov cx, 0
		mov cl, bl
		mov bx, cx
		div bx
		 
		add dx, 30h
		mov remainder, dx ; store the value from dx to remainder
			
		add ax,30h	 
		mov quotient, ax ;store the value from ax to quotient
		lea dx,msg3
		mov ah,9h
		int 21h
		mov dx, quotient   ;store the value from quotient to dx
		mov ah, 2h	
		int 21h
        
        lea dx, msg4		
		mov ah,9h
		int 21h 
		mov dx, remainder  ;store the value from quotient to dx
		mov ah, 2h	
		int 21h
        
		mov ah,4ch
		int 21h
		
		    	
			
	main endp
	end main