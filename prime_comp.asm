org 100h

jmp main  
    prime db " is Prime$"
    comp db " is Comp$"

    data db 12

main proc near

    mov cl, 2
    
    l1:     
        cmp cl, data
        je is_prime
        xor ax, ax
        mov al, data
        div cl
        cmp ah, 0
        jz is_comp 
        inc cx
        jmp l1 
        
        
    is_prime:
    mov ah, 09h
    lea dx, prime
    int 21h 
    jmp exit
    
    is_comp: 
    mov ah, 09h
    lea dx, comp
    int 21h   
    
    exit:
    mov ax, 4c00h
    int 21h
    

main endp

end main