.model small
.stack 100h

.data
     result dw ?
     buffer db 10,? 10 dup(?)
     base dw 10

.code     
main:
    mov ax, @data
    mov ds, ax
    
    ; read string input
    mov ah, 0ah
    lea dx, buffer
    int 21h 
    
string_to_integer:  
    xor ax, ax     ; result
    xor bx, bx     ; gets the current char                        
    xor cx, cx     ; size of string      
    mov cl, buffer[1]
    mov si, 0
              
start:
    xor bx, bx  
    cmp si, cx
    jge stop
    
    mov bl, buffer[si+2]
    sub bl, '0'
    
    ; char to integer
    ; Optimize: use shift and add instead of mul for base 10
    ; ax = ax * 10 = ax * 8 + ax * 2 = (ax << 3) + (ax << 1)
    push ax         ; save current result
    shl ax, 3       ; ax = ax * 8
    pop dx          ; restore original ax to dx
    shl dx, 1       ; dx = original_ax * 2
    add ax, dx      ; ax = ax * 8 + original_ax * 2 = ax * 10
    
    add ax, bx      ; add new digit
    
    inc si
    jmp start
 
stop: 
    mov result, ax
    
    mov ah, 4ch
    int 21h
    
end main                       