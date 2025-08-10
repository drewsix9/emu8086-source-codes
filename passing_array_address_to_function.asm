.model small
.stack 100h
.data
    arr db 1,2,3,4,5
    size equ $ - arr 
.code
main:
    mov ax, @data
    mov ds, ax
    
    ; Push args to stack    
    lea dx, arr    
    push dx    
    mov dx, size
    push dx
                      
    call double_array
    
    ; cleanup the passed args
    add sp, 2   ; 2 bytes for the size
    add sp, 2   ; 2 bytes for the address of arr
    
    ; exit
    mov ah, 4ch
    int 21h
    
double_array proc 
    ; prologue
    push bp
    mov bp, sp
    
    ; initialize counter and index
    mov cx, [bp+4]      ; size parameter
    mov bx, [bp+6]      ; arr address parameter
    mov si, 0
    
 start:
    ; compares SI to CX, if greater than or equal, jump to stop
    cmp si, cx
    jge stop
    
    ; square the value of arr[si]
    mov al, [bx+si]     ; BX as base address
    add al, al          
    
    ; save it to original arr
    mov [bx+si], al     ; BX as base address
    
    ; increment index and loop back
    inc si
    jmp start           ; Removed colon after start
    
stop:
    ; epilogue
    pop bp
    ret
double_array endp
end main