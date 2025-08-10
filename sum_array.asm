.model small
.stack 100h

.data
    arr db 1,2,3,4,5
    size equ $ - arr
.code
main:
    ; init data segment
    mov ax, @data
    mov ds, ax         
    
    lea dx, arr
    push dx
    mov dx, size
    push dx
    
    call sum_arr  
    add sp, 4 ; cleanup args in stack
    
    mov ah, 4ch
    int 21h
 
sum_arr proc
    push bp
    mov bp, sp
                  
    ; set cx as counter, bx as pointer to arr
    mov cx, [bp + 4]
    mov bx, [bp + 6]
    mov si, 0
             
    ; return value
    mov ax, 0                                
start:
    mov dl, [bx + si]
    mov dh, 0                                  
    add ax, dx
    inc si    
    loop start      
    
    pop bp
    ret
sum_arr endp
    
    
end main