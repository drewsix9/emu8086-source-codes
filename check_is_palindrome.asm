.model small
.stack 100h

.data
    isPal db "is Palindrome$"  
    isNotPal db "is Not Palindrome$"  
    str db "racecar$"

.code
main:    
    ; Init data segment
    mov ax, @data
    mov ds, ax
    
    mov si, offset str
    call checkIsPal
          
    ; Compare if return value is 0 or 1
    cmp ax, 0
    je not_palindrome    ; Jump if AX = 0 (not palindrome)

palindrome:
    call print_str
    mov ah, 09h
    mov dx, offset isPal
    int 21h
    jmp exit_program

not_palindrome:
    call print_str
    mov ah, 09h
    mov dx, offset isNotPal
    int 21h
    
exit_program:
    mov ah, 4ch
    mov al, 0
    int 21h

; Procedure to check if string is palindrome
checkIsPal proc
    push bx
    push cx
    push dx
    push si       
    push di   
    
    mov di, si
    mov cx, 0
    
count_len:
    cmp byte ptr [di], '$'
    je found_terminator
    inc di
    inc cx
    jmp count_len
       
found_terminator:
    cmp cx, 0
    je is_pal
    cmp cx, 1
    je is_pal

    mov di, si          ; DI points to start
    add si, cx
    dec si              ; SI points to last character
    
compare_loop:
    cmp di, si
    jge is_pal          ; If pointers meet/cross, it's a palindrome

    ; Compare characters at start and end
    mov al, [di]        ; Get character from start
    mov bl, [si]        ; Get character from end
    
    ; Convert to lowercase for case-insensitive comparison
    call to_lowercase_al
    mov ah, al
    mov al, bl
    call to_lowercase_al
    mov bl, al
    mov al, ah
    
    ; Compare
    cmp al, bl
    jne not_pal
    
    inc di
    dec si
    jmp compare_loop    ; Continue the loop
    
is_pal:
    mov ax, 1
    jmp pal_done
    
not_pal:        
    mov ax, 0
      
pal_done:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ret                 ; IMPORTANT: Missing return statement
checkIsPal endp

print_str proc
	mov ah, 09h
	mov dx, offset str
	int 21h    
	mov ah, 02h
	mov dl, ' '
	int 21h
	ret   
print_str endp

; Helper procedure to convert character to lowercase
to_lowercase_al proc
    cmp al, 'A'
    jb no_convert       ; Below 'A', no conversion needed
    cmp al, 'Z'
    ja no_convert       ; Above 'Z', no conversion needed      dadwadadwa
    add al, 32          ; Convert to lowercase
no_convert:
    ret
to_lowercase_al endp

end main