org 100h

.data
    str db 20, ?, 20 dup('$')
    prompt db "Enter string: $" 
    pal db "Palindrome$"
    notpal db "Not Palindrome$"

.code
main proc near    
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    mov ah, 0ah
    lea dx, str
    int 21h
    
    mov si, offset str+2
    xor bx, bx
    mov bl, [str+1]
    mov [si+bx], '$' 
    
    mov ah, 02h
    mov dh, 12
    mov dl, 40
    mov bh, 0
    int 10h
 
    mov si, offset str+2     ; SI points to start of string
    
    mov di, si  
    xor cx, cx
    mov cl, [str+1]
    add di, cx
    dec di                   ; DI points to end of string
    
    nxt_char:
        cmp si, di 
        je stop 
        xor cx, cx
        xor dx, dx
        mov cl, [si]
        mov dl, [di]
        
        cmp cl, 'a'
        jb conv_lower_cl
        cmp cl, 'z'
        jbe check_dl
        
    conv_lower_cl: 
        xor cl, 00100000b
    
    check_dl:
        cmp dl, 'a'
        jb conv_lower_dl
        cmp cl, 'z'
        jbe compare_cl_dl 
        
    conv_lower_dl: 
        xor dl, 00100000b
    
    compare_cl_dl:
        cmp cl, dl
        jne not_pal 
        inc si
        dec di
        jmp nxt_char
        
    stop:    
        mov ah, 09h
        lea dx, pal
        int 21h
        jmp terminate
        
    not_pal:
        mov ah, 09h
        lea dx, notpal
        int 21h 
        
    terminate:
        mov ax, 4c00h
        int 21h  
 
main endp

end main