include 'emu8086.inc'
.model small
.stack 100h
.data 
    msg_even db " is Even$"
    msg_odd db " is Odd$"

.code
main:
    mov ax, @data
    mov ds, ax
    mov es, ax 
    
    mov ah, 01h
    int 21h
    
    sub  al, '0'
    
    mov bl, 02h
    
    subtract:  
        sub al, bl
        jz even
        js odd
        jmp subtract
        
    even:
        mov ah, 09h
        lea dx, msg_even
        int 21h
        jmp done
        
    odd:
        mov ah, 09h
        lea dx, msg_odd
        int 21h  

	done:
	mov ah, 4ch
	int 21h

end main