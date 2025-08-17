include 'emu8086.inc'
.model small
.stack 100h

.data
    prompt db "Enter number to calculate factorial: $" 
    result_msg db "Result: $"  
    newline db 0dh, 0ah, '$'
    
.code
main:
    mov ax, @data
    mov ds, ax
   
    mov ah, 09h
    lea dx, prompt
    int 21h   
    
    call SCAN_NUM   
    
    call factorial 
    
    push ax
    
    call print_result
    
    mov ah, 4ch
    int 21h
    
    factorial proc
        push bp
        mov bp, sp   
        
        mov ax, 1 
        f_loop:
        mul cx
        loop f_loop  
     
        mov sp, bp 
        pop bp  
        ret
    factorial endp   

    print_result proc  
        mov ah, 09h
        lea dx, newline
        int 21h 
        
        lea dx, result_msg
        int 21h  
        
        pop dx
        call PRINT_NUM
        ret
    print_result endp 

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
    
    
        
end main