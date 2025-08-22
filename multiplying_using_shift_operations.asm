include 'emu8086.inc'
.model small
.stack 100h


.code
main:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ; 66 = (11 * 2^1) + (11 * 2^2)
    ; 66 = 11 * 2 + 11 * 4
    ; 66 = 22 + 44 
    
    mov ax, 11d
    push ax
    shl ax, 1           ; (11 * 2^1)
    mov bx, ax
    pop ax
    shl ax, 2           ; (11 * 2^2)
    add ax, bx
    
    call PRINT_NUM  
    
    

	
	mov ah, 4ch
	int 21h
	
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS    

end main