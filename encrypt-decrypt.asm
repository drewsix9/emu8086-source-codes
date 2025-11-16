org 100h          ; .COM program starts at offset 100h

jmp start         ; jump over data

; =====================
; DATA
; =====================

filename db "textfile.txt",0  ; change this to your file name (max 8.3 DOS name)
buffer   db 0                 ; 1-byte buffer for reading

; Optional error messages (zero-terminated)
open_err_msg db 13,10,"Error: cannot open file.$"
read_err_msg db 13,10,"Error: cannot read file.$"

; =====================
; CODE
; =====================

start:

    ;-------------------------
    ; Open file (read-only)
    ;-------------------------
    mov dx, offset filename   ; DS:DX -> ASCIIZ filename
    mov ax, 3D00h             ; AH=3Dh (open), AL=0 (read-only)
    int 21h
    jc open_error             ; if CF=1, error

    mov bx, ax                ; file handle in BX

read_loop:
    ;-------------------------
    ; Read 1 byte from file
    ;-------------------------
    mov ah, 3Fh               ; AH=3Fh (read from file)
    mov cx, 1                 ; read 1 byte
    mov dx, offset buffer     ; buffer address
    int 21h
    jc read_error             ; on error, jump

    or ax, ax                 ; AX = number of bytes read
    jz done_reading           ; if AX=0 -> EOF

    ;-------------------------
    ; Print the byte in buffer
    ;-------------------------
    mov dl, buffer            ; character to DL
    mov ah, 02h               ; DOS: display character in DL
    int 21h

    jmp read_loop             ; continue reading

;-----------------------------
; Done reading: close file
;-----------------------------
done_reading:
    mov ah, 3Eh               ; close file
    int 21h                   ; (BX still has handle)

    jmp exit_program

;-----------------------------
; Open error handler
;-----------------------------
open_error:
    mov dx, offset open_err_msg
    mov ah, 09h               ; print "$"-terminated string
    int 21h
    jmp exit_program

;-----------------------------
; Read error handler
;-----------------------------
read_error:
    mov dx, offset read_err_msg
    mov ah, 09h
    int 21h
    ; attempt to close file if handle is valid (not strictly necessary for simple tests)

;-----------------------------
; Exit to DOS
;-----------------------------
exit_program:
    mov ah, 4Ch
    xor al, al
    int 21h