; 3) Show ASCII of a pressed key

; Task: Read one key (with echo). Then, on the last row, display: Key = X (NNh) 
; where X is the key you pressed and NNh is its two-digit hex ASCII.

.model small
.data           
    prompt db "Press any key...$"
    msg db "Key = $" 
    sixteen db 10h   
    newline db 0dh, 0ah, '$'
    

.code
main proc near
    mov ax, data
    mov ds, ax
    mov es, ax  
    
    start: 
    
    ; print prompt 
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; get char
    mov ah, 07h
    int 21h   
    
    call cls
    
    xor ah, ah
    push ax    
                
    ; print msg
    mov ah, 09h
    lea dx, msg
    int 21h       
    
    pop ax
            
    ; print char
    mov ah, 02h
    mov dl, al
    int 21h 
    
    xor ah, ah  
    
    mov cx, 0 
    divd: 
          cmp al, 00h 
          jle stop    
          xor ah, ah
          div sixteen
          xor dx, dx
          mov dl, ah 
          push dx  
          inc cx  
          jmp divd 
          
    stop:    
        mov ah, 02h 
        mov dl, ' '
        int 21h 
        
    print:
        pop dx  
        add dl, 30h
        int 21h
        loop print 
        
        ;print H
        mov ah, 02h
        mov dl, 'H'
        int 21h
         
        
        ; wait for key
        mov ah, 07h
        int 21h  
        xor ax, ax 
     
        call cls
        
        jmp  start
        
main endp   
 
cls proc near
        pusha  
        
        mov ah, 02h
        mov dh, 0
        mov dl, 0
        mov bh, 0
        int 10h

        mov ah, 09h 
        mov al, ' '
        mov bh, 0
        mov bl, 07h
        mov cx, 2024
        int 10h  
        popa 
        ret
cls endp
    

end main ; set entry point and stop the assembler.

