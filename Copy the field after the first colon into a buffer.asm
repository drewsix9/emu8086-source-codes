include 'emu8086.inc'
.model small
.stack 100h
.data  

    src db "user: Dan Mathew Gamale$", 0
    dst db 64 dup(?)


.code
main:
    mov ax, @data
    mov ds, ax
    mov es, ax
              
    lea di, src
    mov al, ':'
    mov cx, 0ffffh
                 
    repne scasb
    je found 
    jmp done
 
    found:  
        ; start moving si to di         
        mov si, di,
        lea di, dst
        
    copy_loop:
        lodsb
        cmp [si], 0
        je print
        stosb
        jmp copy_loop
        
    print: 
        mov [di], '$'    
        mov ah, 09h
        lea dx, dst
        int 21h
     
done:
	mov ah, 4ch
	int 21h

end main