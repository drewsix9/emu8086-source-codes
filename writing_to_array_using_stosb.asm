.model small
.stack 100h
.data
arr db 5 dup(?)     
     
.code
main:     

    mov ax, @data
    mov ds, ax 
    mov es, ax
    
    xor ax, ax

    mov al, 'a'
    mov cx, 5
    lea di, arr
    loop1:     
        stosb        ; STOSB writes to ES:DI
        loop loop1
        
    hlt
        
end main