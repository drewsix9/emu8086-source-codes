.model small
.stack 100h
.data
    dmp db "vnfdkhvbdfhbfd"
    msg db "Hello World$"

.code
main:
    mov ax, @data
    mov ds, ax
    
    lea ax, msg
    push ax
    call print_hw
    
    mov ah, 4ch
    int 21h
     

print_hw proc
    push bp
    mov bp, sp
    
    mov dx, [bp+4]
    mov ah, 09h
    int 21h
    
    pop bp
    ret
    

print_hw endp
     
end main