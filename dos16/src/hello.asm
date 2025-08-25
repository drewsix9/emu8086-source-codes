; 16-bit DOS .COM (NASM)
org 0x100
bits 16

start:
    mov dx, msg
    mov ah, 0x09         ; DOS print-string ($-terminated)
    int 0x21

    mov ax, 0x4C00       ; exit to DOS with code 0
    int 0x21

msg db "Hello from 16-bit DOS!", 13,10, "$"
