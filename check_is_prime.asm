.model small 
.stack 100h

.data
    num db 45
    range db 100
    is_prime_msg db " is Prime$"
    is_comp_msg db " is Composite$"

.code
main:
    mov ax, @data
    mov ds, ax
    
    mov al, num
    cmp al, 1
    jle is_comp
    
    cmp al, 2
    je is_prime
    
    mov bl, 2           ; Use BL as divisor instead of CL
    
loop_here:
    cmp bl, num         ; Compare divisor with number
    jge is_prime
    
    xor ah, ah           ; Clear AH (high byte of AX)
    mov al, num         ; Load dividend into AL
    
    div bl
    cmp ah, 0 
    je is_comp
    
    inc bl              ; Increment divisor
    jmp loop_here

is_prime:
    mov ah, 09h
    mov dx, offset is_prime_msg
    int 21h
    jmp exit            ; Jump to exit after printing
    
is_comp:
    mov ah, 09h
    mov dx, offset is_comp_msg  ; Fixed: was pointing to wrong message
    int 21h 
    
exit:
    mov ah, 4ch
    mov al, 0           ; Exit code
    int 21h

end main