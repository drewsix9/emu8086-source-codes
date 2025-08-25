org 0x100
bits 16

arr db 5 dup(?)     
     
main:     
    xor ax, ax

    mov al, 'a'
    mov cx, 5
    lea di, arr
    loop1:     
        stosb        ; STOSB writes to ES:DI
        loop loop1
        
    hlt
        
