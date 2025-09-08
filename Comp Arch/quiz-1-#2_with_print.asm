.data
ten db 10

.code

main:

mov ax, @data
mov ds, ax
mov es, ax

mov al, 79; input

mov cl, al
mov bl, 05h

div_five:
    sub al, bl
    jz print_b
    jns div_five

mov al, cl
mov bl, 04h

div_four:
    sub al, bl
    jz print_b
    jns div_four
    
mov al, cl
mov bl, 03h

div_three:
    sub al, bl
    jz print_b
    jns div_three
    
else: 
; print the doubled num  
mov al, cl 
xor ah, ah
shl al, 1 

xor ah, ah 
mov bl, 10
xor cx, cx  

modulo:
    cmp al, 0
    je print  
    div bl
    inc cx
    push ax 
    xor ah, ah
    jmp modulo

print:  
    mov ah, 02h
    
print_dig: 
    pop dx
    mov dl, dh  
    add dl, '0'
    int 21h
    loop print_dig

jmp done

print_b:
mov dl, bl    
add dl, '0'
mov ah, 02h
int 21h

done:
mov ah, 4ch
int 21h


endm main
