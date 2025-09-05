.data  

ten db 10h   

.code

main:   

mov ax, @data
mov ds, ax
mov es, ax 

xor ax, ax 

mov al, 23h  
mov cx, 0

lp:
    cmp al, 0
    je done 
    div ten  
    inc cx
    push ax 
    xor ah, ah
    jmp lp
    
done:  
mov ah, 02h
    
print_dig:  
    pop dx
    mov dl, dh
    add dl, '0'
    int 21h
    loop print_dig

end main