.data
    str db "hello world!", 0
    vowels db "aeiouAEIOU", 0
    
.code

main:
    mov ax, @data
    mov ds, ax
    mov es, ax   
              
    lea si, str
    xor ax, ax
    xor bx, bx               ; bx =  vowel count
    cld        
    
    next_char:   
        lodsb               ; SI is auto incremented
        cmp al, 0
        je done
        lea di, vowels     
        mov cx, 0ah         ; length of "aeiouAEIOU"
        
        repne scasb         ; DI is auto incremented, ZF is 1 if vowel is equal
        
        jnz not_vowel
        inc bx
    not_vowel:
        jmp next_char 
        

    done:
        mov ah, 4ch
        int 21h

end main