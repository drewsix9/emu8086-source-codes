org 100h

.data 
    str1 db 20, ?, 20 dup('$')
    str2 db 20, ?, 20 dup('$')
    prompt1 db "Enter string1: $"
    prompt2 db 13, 10, "Enter string2: $"

.code
main proc near

	mov ah, 09h
	lea dx, prompt1
	int 21h
	
	mov ah, 0ah
	lea dx, str1
	int 21h
	         
	; termianate string
	mov si, offset str1+2
	xor bx, bx
	mov bl, [str1+1]
	mov [si+bx], '$'   
	
	mov ah, 09h
	lea dx, prompt2
	int 21h
	
	mov ah, 0ah
	lea dx, str2
	int 21h
	           
	; terminate string
	mov si, offset str2+2
	xor bx, bx
	mov bl, [str2+1]
	mov [si+bx], '$' 
	
	; move cursor
	mov ah, 02h
	mov dh, 23
	mov dl, 80
	sub dl, [str1+1]
	sub dl, [str2+1]
	mov bh, 0
	int 10h  
	         
	; SI points to the last character
	mov si, offset str1+2
	xor cx, cx 
	mov cl, [str1+1]
	add si, cx
	dec si  
	        
	; ready for character printing
	mov ah, 02h
	
    l1:
        mov dl, [si]
        int 21h
        dec si
        loop l1
 
	; just print second string    
	mov ah, 09h
	lea dx, str2+2
	int 21h

main endp

end main