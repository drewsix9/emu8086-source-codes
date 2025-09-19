org 100h   
string db 50, ?, 50 dup('$')  
.code
main proc near 
    ; read string  
    mov dx, offset string
    mov ah, 0ah
    int 21h
                 
    ; terminate the string with '$'
    xor bx, bx
    mov bl, string[1] 
    mov string[bx+2], '$'  
    
    mov ah, 02h
    mov bh, 00h
    mov dx, 0c20h
    int 10h
                   
    ; divide by 2
    xor ax, ax
    mov al, bl
    mov dl, 02h  
    div dl        
    
    
    cmp ah, 01h
    je odd
    
    even:
        mov ah, 02h  
        mov dl, string[2]  
        int 21h
        jmp stop
 
    odd: 
        mov ah, 09h  
        mov dx, offset string+2
        int 21h
 
    stop:
        mov ax, 4c00h
        int 21h 

main endp
end main