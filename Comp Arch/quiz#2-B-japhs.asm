org 100h

.data  
    string db 20, ?, 20 dup('$')
    
.code
main proc near
           
    ; dawat string
    mov ah, 0ah
    lea dx, string
    int 21h
    
    ; termiante string with '$'
    xor bx, bx
    mov bl, [string+1]
    mov [string+2+bx], '$'   
     
    ; position cursor to center
    mov ah, 02h
    mov dh, 12
    mov dl, 40
    sub dl, string+1
    mov bh, 0
    int 10h
    
    ;mov ah, 09h
    ;lea dx, string+2
    ;int 21h
    
    ; print only consonants 
    xor cx, cx 
    mov cl, string+1  
    lea bx, string+2 
    add bx, cx
    dec bx
    
    l1:
        xor dx, dx 
        ; iterate to each character
        mov dl, [bx]   
        
        ; if vowel, skip
        cmp dl, 'A'
        je skip  
        cmp dl, 'E'
        je skip   
        cmp dl, 'I'
        je skip   
        cmp dl, 'O'
        je skip   
        cmp dl, 'U'
        je skip   
        cmp dl, 'a'
        je skip   
        cmp dl, 'e'
        je skip   
        cmp dl, 'i'
        je skip   
        cmp dl, 'o'
        je skip   
        cmp dl, 'u'
        je skip 
        ; else print the consonant
        mov ah, 02h
        int 21h
        
        skip: 
        dec bx
        loop l1
        
	; return 0
	mov ax, 4c00h
	int 21h

main endp
end main