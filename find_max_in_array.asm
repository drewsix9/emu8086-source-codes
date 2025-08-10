.model small
.stack 100h

.data
    arr db 2,7,1,8,5
    size equ $ - arr
    
.code
main:               
    mov ax, @data
    mov ds, ax
    
    mov cx, size
    mov si, 1
                
    ; set bx as pointer to arr
    lea bx, arr               
    
    ; set current max as arr[0]
    mov al, [bx + 0]
    mov ah, 0

start:                                                  
    ; if si < cx, proceed with the loop
    cmp si, cx
    jge stop
    mov dl, [bx + si]
    
    ; if max (al) is greater than current num (dl), swap
    cmp al, dl
    jge skip
    xchg al, dl
    
skip:
    inc si
    jmp start
    

stop:
     mov ah, 4ch
     int 21h
     
     

end main