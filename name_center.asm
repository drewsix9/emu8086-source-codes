.model small
.data
    prompt db "Enter name: $"  
    buffer_name db 20, ?, 20 dup('$')
    msg db "NAME: $"
    

.code
main proc near
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ah, 02h
    mov bh, 0
    mov dh, 10
    mov dl, 34
    int 10h
    
    mov ah, 09h
    lea dx, prompt
    int 21h   
    
    mov ah, 0ah
    mov dx, offset buffer_name
    int 21h      
    
    ; get cursor pos   
    mov ah, 03h
    mov bh, 0
    int 10h         
    
    ; update cursor pos
    mov ah, 02h
    mov bh, 0
    add dh, 01h
    mov dl, 34
    int 10h    
 
    ; print msg
    mov ah, 09h
    lea dx, msg   
    int 21h
    
    ; print name
    mov ah, 09h
    lea dx, buffer_name+2
    int 21h
    

    mov ax, 4c00h ; exit to operating system.
    int 21h 
 


main endp
end main ; set entry point and stop the assembler.
