org 100h

.data
    str db 20, ?, 20 dup('$') 
    prompt db "Input: $" 
    msg db "Output: $"
    
.code
main proc near 
    mov ah, 09h
    lea dx, prompt
    int 21h 
    
    mov ah, 0ah
    lea dx, str
    int 21h 
    
    mov ah, 02h
    mov dh, 23
    mov dl, 80
    sub dl, [str+1]
    sub dl, 8
    int 10h  
    
    mov ah, 09h
    lea dx, msg
    int 21h         
    
    lea bx, str+2
    xor dx, dx
    mov dl, [str+1]
    mov di, dx  
    dec di

    nxt_char:    
        cmp di, 0
        jl stop    
        
        mov al, [bx+di] 
                   
        cmp al, 'A'
        je skip
        cmp al, 'E'
        je skip   
        cmp al, 'I'
        je skip   
        cmp al, 'O'
        je skip   
        cmp al, 'U'
        je skip 
        cmp al, 'a'
        je skip
        cmp al, 'e'
        je skip   
        cmp al, 'i'
        je skip   
        cmp al, 'o'
        je skip   
        cmp al, 'u'
        je skip  
        
        print:
        mov ah, 0eh
        int 10h
          
        skip:
        dec di 
        jmp nxt_char
         
    stop:        
    mov ah, 4ch
    int 21h
    
main endp

end main