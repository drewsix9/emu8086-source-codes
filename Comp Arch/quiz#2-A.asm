org 100h

.data
    str db 20, ?, 20 dup('$') 
    prompt db "Input: $" 
    
.code
main proc near 
    mov ah, 09h
    lea dx, prompt
    int 21h 
    
    mov ah, 0ah
    lea dx, str
    int 21h 
              
    ; move cursor top right
    mov ah, 02h
    mov dh, 0
    mov dl, 80
    sub dl, [str+1]     ; adjust column to left depending on string size
    mov bh, 0
    int 10h  
    
    ; print only consonants
    lea bx, str+2
    xor dx, dx
    xor si, si
    mov dl, [str+1]
    mov di, dx  
    dec di

    nxt_char_c:    
        cmp si, di
        jge print_v_start    
        
        mov al, [bx+si] 
                   
        call is_vowel
        cmp dl, 01h
        je skp_c  
        
        print_c:
        mov ah, 0eh
        int 10h
          
        skp_c:
        inc si 
        jmp nxt_char_c 
        
           
    ; move cursor bottom right
    print_v_start:    
    mov ah, 02h
    mov dh, 23
    mov dl, 80
    sub dl, [str+1]     ; adjust column to left depending on string size
    mov bh, 0
    int 10h   
        
    ; print only vowels
    lea bx, str+2
    xor dx, dx
    xor si, si
    mov dl, [str+1]
    mov di, dx  
    dec di

    nxt_char_v:    
        cmp si, di
        jge stop    
        
        mov al, [bx+si] 
                   
        call is_vowel
        cmp dl, 00h
        je skp_v  
        
        print_v:
        mov ah, 0eh
        int 10h
          
        skp_v:
        inc si 
        jmp nxt_char_v
         
    stop:        
    mov ah, 4ch
    int 21h
    
main endp

is_vowel proc near
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
    
    mov dl, 00h  ; dl serves as flag value to tell if vowel or consonant
    jmp done 
    
    skip:
    mov dl, 01h 
      
    done:
    ret
is_vowel endp

end main 