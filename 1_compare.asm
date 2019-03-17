.model small
.stack 100h
.data 
    number1 db "Enter the first number : $"
    number2 db 10,13,"Enter the second number: $"
    number3 db 10,13,"Enter the third number : $"     
    output db 10,13,"Result: $" 
    GSign db " <= $"                       
    
    num1 dw ?
    num2 dw ?
    num3 dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, number1
    mov ah, 9h
    int 21h
    
    mov ah, 1h
    int 21h
    mov num1 , ax
    
    lea dx, number2
    mov ah, 9h
    int 21h
    
    mov ah, 1h
    int 21h
    mov num2 , ax
    
    lea dx, number2
    mov ah, 9h
    int 21h  
    
    mov ah, 1h
    int 21h
    mov num3 , ax      
    
     
    mov bx, num1
    mov cx, num2
     
    cmp bx,cx
    ja larger1
    jmp next1

    larger1:
        mov di, num1    ;swapping 
        mov cx , num2
        mov num1, cx
        mov num2, di 
    
    next1:
    
        mov bx , num2
        mov cx, num3
        
        cmp bx,cx
        ja larger2
        jmp next2
    
    larger2:
        mov di, num3    ;swapping
        mov dx, num2
        mov num3, dx
        mov num2, di
    
    next2:       
    
    mov bx , num1
    mov cx, num2
    cmp bx,cx
    ja larger3
    jmp next3 
    larger3:
        mov di, num1    ;swapping 
        mov cx , num2
        mov num1, cx
        mov num2, di 
    next3:
    
    lea dx, output
    mov ah, 9h
    int 21h
    
    mov dx, num1
    mov ah,2h 
    int 21h    
    
    lea dx, GSign
    mov ah, 9h
    int 21h
    
    mov dx, num2
    mov ah,2h 
    int 21h  
              
    lea dx, GSign
    mov ah, 9h
    int 21h
              
    mov dx, num3
    mov ah,2h 
    int 21h
    
    
    main endp
    end main