org 100h

.data  
    way db "way$"        
    str db 20, ?, 20 dup('$')   
    store db 20 dup('$')

.code
main proc near

	; input string              
	mov ah, 0ah
	lea dx, str
	int 21h
	
	; terminate string 
	xor bx, bx
	mov bl, str+1
	mov [str+2+bx], '$'  
	
	; move cursor to center
	mov ah, 02h
	mov dh, 12
	mov dl, 40
	sub dl, str+1
	int 10h
	
	; check if first char is vowel
	mov dl, [str+2]
	cmp dl, 'A'
	je append_way
	cmp dl, 'E'
	je append_way
	cmp dl, 'I'
	je append_way
	cmp dl, 'O'
	je append_way
	cmp dl, 'U'
	je append_way
	cmp dl, 'a'
	je append_way
	cmp dl, 'e'
	je append_way
	cmp dl, 'i'
	je append_way
	cmp dl, 'o'
	je append_way
	cmp dl, 'u'
	je append_way 
	
    ; else consonant  
    mov si, offset str+2
    xor cx, cx
    mov cl, str+1  
    mov di, offset store
       
    l1:      
        mov dl, [si]
    	cmp dl, 'A'
    	je stop
    	cmp dl, 'E'
    	je stop
    	cmp dl, 'I'
    	je stop
    	cmp dl, 'O'
    	je stop
    	cmp dl, 'U'
    	je stop
    	cmp dl, 'a'
    	je stop
    	cmp dl, 'e'
    	je stop
    	cmp dl, 'i'
    	je stop
    	cmp dl, 'o'
    	je stop
    	cmp dl, 'u'
    	je stop  
    	
    	; store the current letter
    	mov [di], dl
    	
        inc si  
        inc di
    	loop l1
    	
    stop:  
    mov ah, 02h
    
    l2:	 
        int 21h
        inc si   
        mov dl, [si]
        loop l2   
        
    ; print the stored characters
    mov ah, 09h
    lea dx, store
    int 21h
           
    ; print "ay"
    lea dx, way+1
    int 21h 
    
    jmp terminate    

	append_way:  
	; print the word
	mov ah, 09h
	lea dx, str+2
	int 21h
	
	lea dx, way
	int 21h
	; print "way" 
	
	terminate:
	mov ax, 4c00h
	int 21h

main endp
end main