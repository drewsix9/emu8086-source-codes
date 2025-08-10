org 100h

.data
    prompt db "Enter your name: $"
    msg db "Your name is: $"
    newline db 0DH, 0AH, '$'
    buffer db 255, ?, 255 dup(?)
    

.code
    mov ax, @data
    mov ds, ax
              
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    mov ah, 0Ah
    lea dx, buffer
    int 21h
    
    ; add string terminator
    xor bx, bx                  ; clear bx register
    mov bl, buffer[1]        ; gets the actual size of string
    mov buffer[bx+2], '$'            ; +2 bcz string starts at indx 2 ang +bl bcz last indx
    
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, msg
    int 21h
    
    mov ah, 09h
    lea dx, buffer + 2
    int 21h
    
    