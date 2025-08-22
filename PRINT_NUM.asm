include "emu8086.inc"
.model small
.stack 100h
.data 
    result db "Product: $" 
    ten db 0ah


.code
main:  
    mov ax, @data
    mov ds, ax  
    
    mov ax, 123 
    
    ; num = bx
    ; div = cx
    mov bx, ax  
    mov ax, 1
    mov cx, 0ah  
    
    loop_div: 
         push ax     
         mul ten  
         cmp ax, bx      
         jge stop
         pop ax
         mul ten
         jmp loop_div 
         
    stop:
        pop ax 
        mov cx, ax
    next_dig:
        cmp bx, 0
        jle stop_loop  
        mov ax, bx
        div cx
        
        push dx ; save remainder
        
        call PRINT_NUM
        
        ;pop bx 
        mov bx, dx
        
        mov ax, cx 
        mov dx, 10
        div dx
        mov cx, ax
        
        jmp next_dig
 
    stop_loop:
        mov ah, 09h
        int 21h
        
    
    
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS       
        
end main