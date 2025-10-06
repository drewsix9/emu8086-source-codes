org 100h

jmp main 

    data dw 65535
    ten dw 10

main proc near 
    
    mov ax, data  
    xor cx, cx
    xor dx, dx
    
    l1:  
        div ten  
        cmp dx, 0
        jz l2
        push dx        
        xor dx, dx
        inc cx 
        jmp l1
        
    l2:
        mov ah, 02h
        pop dx      
        add dl, '0'
        int 21h
        loop l2
         
main endp

end main