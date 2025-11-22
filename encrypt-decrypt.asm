org 100h
jmp start

; Macro: Display file contents
WELCOME_SCREEN macro
    local read_loop, done_reading, open_error, read_error
    
    ; Open file (read-only)
    mov dx, offset filename
    mov ax, 3D00h
    int 21h
    jc open_error
    mov bx, ax

read_loop:
    ; Read 1 byte
    mov ah, 3Fh
    mov cx, 1
    mov dx, offset buffer
    int 21h
    jc read_error
    
    or ax, ax
    jz done_reading
    
    ; Print byte
    mov dl, buffer
    mov ah, 02h
    int 21h
    jmp read_loop

done_reading:
    mov ah, 3Eh
    int 21h
    jmp %%exit_macro

open_error:
    mov dx, offset open_err_msg
    mov ah, 09h
    int 21h
    jmp %%exit_macro

read_error:
    mov dx, offset read_err_msg
    mov ah, 09h
    int 21h

%%exit_macro:
endm

; Data
filename db "textfile.txt",0
buffer   db 0
open_err_msg db 13,10,"Error: cannot open file.$"
read_err_msg db 13,10,"Error: cannot read file.$"

start:
    WELCOME_SCREEN
    
    ; Wait for key
    mov ah, 00h
    int 16h
    
    ; Exit
    mov ah, 4Ch
    xor al, al
    int 21h