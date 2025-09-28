.model small
.data 

    msg db "Hello Mike Leuster Estrada!"
 

.code
main proc near
    mov ax, data
    mov ds, ax
    mov es, ax 
    
    start:  
    
    mov ah, 02h
    mov dh, 12
    mov dl, 32
    mov bh, 0
    int 10h   
    
    mov cx, 27
    mov ah, 0eh
    mov dx, offset msg 
    mov si, 0 
    
    print:     
        mov al, [msg + si]
        int 10h
        inc si
        loop print
    
    mov ah, 07h
    int 21h 
    
    call cls    
    
    jmp start   

main endp  

cls proc near
    pusha  
    
    mov ah, 02h
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10h
    
    mov ah, 09h
    mov al, ' '
    mov bh, 0
    mov bl, 07h
    mov cx, 2024
    int 10h
    
    popa
    ret

cls endp
end main ; set entry point and stop the assembler.
