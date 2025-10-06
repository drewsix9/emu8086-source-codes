org 100h

jmp main
    prompt db 'Enter a number: $'
    msg db "Result: $"
    ten dw 10 
    result dw 0 
    n_dig dw ?

main proc near

    mov ah, 09h
    lea dx, prompt
    int 21h
    call input_number
    
    mov ah, 02h
    mov dh, 12
    mov dl, 30
    mov bh, 0
    int 10h
                      
    mov ah, 09h
    lea dx, msg
    int 21h                      

    call output_number
    
    mov ax, 4c00h   
    int 21h

main endp 

output_number proc near
    pusha
    
    mov ax, result  
    xor cx, cx
    xor dx, dx
    
    l10:  
        div ten  
        cmp dx, 0
        jz l2
        push dx        
        xor dx, dx
        inc cx 
        jmp l10
        
    l2:
        mov ah, 02h
        pop dx      
        add dl, '0'
        int 21h
        loop l2
         
    popa   
    ret
output_number endp

input_number proc near
    pusha             ; push all registers onto stack incase callee used them
    
    xor cx, cx  ; use to count how many digits
    xor bx, bx  ; use to store each digit
    xor ax, ax  ; use to store running sum
    
    l1:
    mov ah, 07h ; input character without echo
    int 21h        
    
    ; input ascii is in al  
    cmp al, 0dh         ; 0dh is ascii of carriage return
    je stop_l1  
    cmp al, 08h         ; 08h is ascii of backspace
    je backspace_detected
    cmp al, '0'
    jb next_dig
    cmp al, '9'
    ja next_dig   
    
    ; print character 
    mov ah, 02h
    mov dl, al 
    int 21h 
    inc cx
    
    ; calculate running sum  
    xor ah, ah              ; clear ah to make ax = al
    sub ax, '0'             ; convert ascii to number
    ; save al to bl
    mov bx, ax              ; copy digit to bx
    mov ax, result          ; get running sum
    mul ten                 ; ax = ax * 10
    add ax, bx              ; ax = ax + bl
    mov result, ax          ; store new running sum    
    jmp next_dig
    
    
    backspace_detected:
    mov ax, result          ; get running sum
    xor dx, dx              ; clear dx for division  (explained in docs)
    div ten                 ; ax = ax / 10, dx = ax % 10
    mov result, ax          ; store new running sum
    dec cx                  ; decrement digit count
    
    ; move cursor back, print space, move cursor back again
    mov ah, 0eh
    mov al, 8
    int 10h 
    mov al, ' '
    int 10h    
    mov al, 8
    int 10h
         
    next_dig:
    jmp l1


    stop_l1:
    mov n_dig, cx
    popa                    ; restore all registers from stack
    ret
input_number endp

end main