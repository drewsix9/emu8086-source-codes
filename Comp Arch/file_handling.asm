org 100h

jmp main     
    filename db "c:\test.txt", 0
    msg db "HELLO, Assembly World!$"
    handle dw ?

main proc near
    mov ah, 3ch
    mov cx, 0
    lea dx, filename
    int 21h       
    
    jc error
    mov handle, ax
    
    mov ah, 40h
    mov bx, handle
    mov cx, 23
    lea dx, msg
    int 21h
    
    mov ah, 3eh
    mov bx, handle
    int 21h
    
    error:
    mov ah, 4ch
    int 21h

main endp

end main