.model small
.stack 100h
.data  
    str db 'hello world$', 0


.code
main:   
    mov ax, @data
    mov ds, ax
    mov es, ax     
    
    xor ax, ax 
    mov cx, 0ffffh          ; set cx to a max num (REPNE terminates when CX == 0)
    lea di, str
    mov al, '$'             ; search for '$'
    CLD
          
    repne scasb 
    
    mov cx, di
    sub cx, offset str
    dec cx       
    
    ; cx = length  
    ; si = first char
    ; di = last char

    lea si, str
    lea di, str
    add di, cx 
    dec di
    
    swap_loop:
        cmp si, di 
        jge stop   
        mov bl, [di]                ; save right to temp reg (bl)
        CLD
        lodsb                       ; load to al, pointed by si (INCREMENTS SI)
        STD
        stosb                       ; store to di the value inside al (DECREMENTS DI)
        mov byte ptr [si-1], bl     ; readjust si because we incremented it earlier
        jmp swap_loop
        
    stop: 
        mov ax, 4C00h
        int 21h
 
end main