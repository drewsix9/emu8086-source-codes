.model small
.stack 100h

.data  
	name_buffer db 20
				db 0
				db 20 dup('$')
	prompt db "Enter string to reverse: $"
	result_msg db "Result: $"
	newline db 13, 10, '$'


.code

main: 
	mov ax, @data
	mov ds, ax 
	mov es, ax
	
	mov ah, 09h
	mov dx, offset prompt 
	int 21h   
	
	mov ah, 0ah
	lea dx, name_buffer
	int 21h
	       
	xor cx, cx
	mov cl, [name_buffer + 1] 
	shr cl, 1
               
    lea si, name_buffer + 2
    mov di, si  
    xor ax, ax
    mov al, [name_buffer + 1]
    add di, ax
    dec di
    	
reverse: 
	cmp si, di
	jg stop  
	
	mov al, [si]      
    mov bl, [di]      
    mov [si], bl      
    mov [di], al      
	
	inc si
	dec di
	jmp reverse
	
stop:
	call print_newline 
	
	mov ah, 09h
	lea dx, result_msg
	int 21h
	
	lea dx, name_buffer + 2
	int 21h 
	
quit:
	mov ah, 4ch
	mov al, 00h
	int 21h

print_newline proc
 	mov ah, 09h
 	lea dx, newline
 	int 21h
 	ret
print_newline endp

end main
