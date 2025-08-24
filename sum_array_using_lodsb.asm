
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

arr db 5,4,3,2,1

main:
        
    mov cx, 5
    xor ax, ax 
    xor dx, dx
    lea si, arr
    loop1: 
        lodsb
        add dx, ax
        loop loop1
        
    
    mov ah, 4ch
    int 21h
        
end main  




