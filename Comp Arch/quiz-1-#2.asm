
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, 07h

mov cl, al
mov bl, 05h

div_five:
    sub al, bl
    jz print_b
    jns div_five

mov al, cl
mov bl, 04h

div_four:
    sub al, bl
    jz print_b
    jns div_four
    
mov al, cl
mov bl, 03h

div_three:
    sub al, bl
    jz print_b
    jns div_three
    
else:   
mov al, cl 
xor ah, ah
shl al, 1
hlt   
jmp done

print_b:
mov dl, bl    
add dl, '0'
mov ah, 02h
int 21h

done:
mov ah, 4ch
int 21h





ret




