org 100h

jmp start

;===========================================
; DATA SECTION (CP437/OEM-US encoding)
;===========================================

; Header with double-line box (CP437: +-+�++)
header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
db 186,"       _____ _   _  ____ ______   _______ _____ _____ ___  _   _             ",186,13,10
db 186,"      | ____| \ | |/ ___|  _ \ \ / /  _  |_   _|_   _/ _ \| \ | |            ",186,13,10
db 186,"      |  _| |  \| | |   | |_) \ V /| |_) | | |   | || | | |  \| |            ",186,13,10
db 186,"      | |___| |\  | |___|  _ < | | |  __/  | |   | || |_| | |\  |            ",186,13,10
db 186,"      |_____|_| \_|\____|_| \_\|_| |_|     |_|  |___|\___/|_| \_|            ",186,13,10
db 186,"       ____  _____ ____ ______   _______ _____ _____ ___  _   _              ",186,13,10
db 186,"      |  _ \| ____/ ___|  _ \ \ / /  _  |_   _|_   _/ _ \| \ | |             ",186,13,10
db 186,"      | | | |  _|| |   | |_) \ V /| |_) | | |   | || | | |  \| |             ",186,13,10
db 186,"      | |_| | |__| |___|  _ < | | |  __/  | |   | || |_| | |\  |             ",186,13,10
db 186,"      |____/|_____|____|_| \_\|_| |_|     |_|  |___|\___/|_| \_|             ",186,13,10
db 186,"                  _____ _   _  ____ ___ _   _ _____                          ",186,13,10
db 186,"                 | ____| \ | |/ ___|_ _| \ | | ____|                         ",186,13,10
db 186,"                 |  _| |  \| | |  _ | ||  \| |  _|                           ",186,13,10
db 186,"                 | |___| |\  | |_| || || |\  | |___                          ",186,13,10
db 186,"                 |_____|_| \_|\____|___|_| \_|_____|                         ",186,13,10
db 186,"                                                                             ",186,13,10
db 186,"             By: Group 2 - Bulilan, Gamale, Layan, Pacatang                  ",186,13,10
db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

; Press any key prompt (for initial screen)
press_any_key db 13,10
db "                       ",219,219," Press any key to start... ",219,219,13,10,"$"

; Main menu with single-line box
menu_box db 13,10
db "                    ",218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10
db "                    ",179,"    ",16," MAIN MENU ",17,"                    ",179,13,10
db "                    ",195,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,180,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [1] ",26," Caesar Cipher               ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [2] ",26," XOR Encryption              ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [3] ",26," DES-like Bit Manipulation   ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [4] ",26," About / Help                ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [ESC] Exit Program                ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10
db "                    ",175," Select option: $"

; Sub-menu (Encrypt/Decrypt)
submenu_box db 13,10
db "                    ",218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10
db "                    ",179,"   SELECT OPERATION                  ",179,13,10
db "                    ",195,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,180,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [1] ",254," Encrypt                     ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [2] ",254," Decrypt                     ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",179,"   [ESC] Back to Main Menu           ",179,13,10
db "                    ",179,"                                     ",179,13,10
db "                    ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10
db "                    ",175," Select: $"

; Footer (for other screens)
footer db 13,10,13,10
db "                    ",219,219," Press any key to continue...",13,10,"$"

; About/Help text
about_text db 13,10
db "  ",201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
db "  ",186," ABOUT / HELP                                                            ",186,13,10
db "  ",200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10
db 13,10
db "  ENCRYPTION/DECRYPTION ENGINE v1.0",13,10
db "  By: Group 2 - Bulilan, Gamale, Layan, Pacatang",13,10
db 13,10
db "  This program provides three classical encryption algorithms:",13,10
db 13,10
db "  ",16," CAESAR CIPHER",13,10
db "    - Shifts each letter by a key value (0-25)",13,10
db "    - Preserves non-alphabetic characters",13,10
db "    - Encrypt: Plaintext ",26," Shifted text",13,10
db "    - Decrypt: Shifted text ",26," Original plaintext",13,10
db 13,10
db "  ",16," XOR ENCRYPTION",13,10
db "    - XORs each byte with a single character key",13,10
db "    - Symmetric cipher (same key for encrypt/decrypt)",13,10
db "    - Encrypt: Plaintext ",26," Hex output (e.g., 03 0E 07)",13,10
db "    - Decrypt: Hex string ",26," Original plaintext",13,10
db 13,10
db "  ",16," DES-LIKE FEISTEL CIPHER",13,10
db "    - 1-round nibble Feistel network (4-bit operations)",13,10
db "    - Uses key (0-9) for bit manipulation",13,10
db "    - Splits bytes into nibbles and applies F(R,K) function",13,10
db "    - Encrypt: Plaintext ",26," Hex output",13,10
db "    - Decrypt: Hex string ",26," Original plaintext",13,10
db 13,10
db "  USAGE: Select cipher ",26," Choose encrypt/decrypt ",26," Enter data",13,10
db "$"

;===========================================
; INPUT UI DATA
;===========================================

; Caesar Cipher Screen
caesar_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
              db 186,"                       CAESAR CIPHER - ENCRYPT                               ",186,13,10
              db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

caesar_decrypt_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
                      db 186,"                       CAESAR CIPHER - DECRYPT                               ",186,13,10
                      db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

; XOR Cipher Screen
xor_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
           db 186,"                         XOR CIPHER - ENCRYPT                                ",186,13,10
           db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

xor_decrypt_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
                   db 186,"                         XOR CIPHER - DECRYPT                                ",186,13,10
                   db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

; DES Cipher Screen
des_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
           db 186,"                      DES-LIKE CIPHER - ENCRYPT                              ",186,13,10
           db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

des_decrypt_header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
                   db 186,"                      DES-LIKE CIPHER - DECRYPT                              ",186,13,10
                   db 200,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,188,13,10,"$"

input_box_top       db 13,10,"  ",218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10,"$"

input_box_label_enc db "  ",179," Enter text to encrypt:                                                  ",179,13,10,"$"
input_box_label_dec db "  ",179," Enter text to decrypt:                                                  ",179,13,10,"$"
input_box_label_xor_dec db "  ",179," Enter hex string with spaces (e.g., "03 0E 07 07 04"):                  ",179,13,10,"$"

input_box_prompt    db "  ",179," ",16," $"

input_box_bottom    db 13,10,"  ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10,"$"

key_box_top         db 13,10,"  ",218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10,"$"
key_box_label       db "  ",179," Enter shift key (0-25):                                                 ",179,13,10,"$"
key_box_label_xor   db "  ",179," Enter key (single character):                                           ",179,13,10,"$"
key_box_label_des   db "  ",179," Enter key (0-9):                                                        ",179,13,10,"$"
key_box_prompt      db "  ",179," ",16," $"
key_box_bottom      db 13,10,"  ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10,"$"

result_box_top      db 13,10,"  ",218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10,"$"
result_box_label    db "  ",179," ",251," RESULT:                                                               ",179,13,10,"$"
result_box_prompt   db "  ",179,"   $"
result_box_bottom   db 13,10,"  ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10,"$"

input_instructions  db 13,10,"  [ESC] Back to Menu",13,10,"$"

; Input buffers
user_input          db 65 dup(0)    ; input data buffer (64 chars + null)
user_key            db 0            ; encryption key (single byte)
output_result       db 65 dup(0)    ; result buffer

; Cursor position storage
input_cursor_row    db 0
input_cursor_col    db 0
key_cursor_row      db 0
key_cursor_col      db 0

;===========================================
; CODE SECTION
;===========================================

start:
; Display header/splash screen
call show_splash_screen

; Wait for user to press any key
call wait_key_to_start

; Now show main menu
jmp main_menu

;-------------------------------------------
; Show splash screen (header only)
;-------------------------------------------
show_splash_screen:
call clear_screen
call set_color_cyan_black
mov dx, offset header
call print_string
mov dx, offset press_any_key
call print_string
ret

;-------------------------------------------
; Wait for key to start (initial screen)
;-------------------------------------------
wait_key_to_start:
mov ah, 00h             ; wait for keypress
int 16h
ret

;-------------------------------------------
; Main menu loop
;-------------------------------------------
main_menu:
call clear_screen
call set_color_cyan_black

; Display menu
mov dx, offset menu_box
call print_string

; Get user choice
call get_keypress

cmp al, '1'
je option_caesar
cmp al, '2'
je option_xor
cmp al, '3'
je option_des
cmp al, '4'
je option_about
cmp al, 27              ; ESC key
je exit_program

jmp main_menu           ; invalid key, loop

;-------------------------------------------
; Option handlers
;-------------------------------------------
option_caesar:
call caesar_submenu
jmp main_menu

option_xor:
call xor_submenu
jmp main_menu

option_des:
call des_submenu
jmp main_menu

option_about:
call clear_screen
call set_color_cyan_black
mov dx, offset about_text
call print_string
call wait_key
jmp main_menu

;===========================================
; CAESAR CIPHER SUBMENU
;===========================================
caesar_submenu:
    call clear_screen
    call set_color_cyan_black
    mov dx, offset submenu_box
    call print_string
    call get_keypress
    
    cmp al, '1'
    je caesar_encrypt_screen
    cmp al, '2'
    je caesar_decrypt_screen
    cmp al, 27              ; ESC
    je .back
    
    jmp caesar_submenu
    
.back:
    ret

;===========================================
; XOR CIPHER SUBMENU
;===========================================
xor_submenu:
    call clear_screen
    call set_color_cyan_black
    mov dx, offset submenu_box
    call print_string
    call get_keypress
    
    cmp al, '1'
    je xor_encrypt_screen
    cmp al, '2'
    je xor_decrypt_screen
    cmp al, 27              ; ESC
    je .back_xor
    
    jmp xor_submenu
    
.back_xor:
    ret

;===========================================
; DES CIPHER SUBMENU
;===========================================
des_submenu:
    call clear_screen
    call set_color_cyan_black
    mov dx, offset submenu_box
    call print_string
    call get_keypress
    
    cmp al, '1'
    je des_encrypt_screen
    cmp al, '2'
    je des_decrypt_screen
    cmp al, 27              ; ESC
    je .back_des
    
    jmp des_submenu
    
.back_des:
    ret

;===========================================
; CAESAR CIPHER ENCRYPT SCREEN
;===========================================
caesar_encrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset caesar_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_enc
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0                       ; page 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_key_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Process encryption
    call caesar_encrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    mov dx, offset output_result
    call print_string
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 11
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; CAESAR CIPHER DECRYPT SCREEN
;===========================================
caesar_decrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset caesar_decrypt_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_dec
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0                       ; page 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_key_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Process decryption
    call caesar_decrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    mov dx, offset output_result
    call print_string
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; GET STRING INPUT (with live display)
;===========================================
get_string_input:
    push ax
    push bx
    push cx
    push dx
    push si
    
    ; Clear input buffer
    mov si, offset user_input
    mov cx, 65
.clear_loop:
    mov byte [si], 0
    inc si
    loop .clear_loop
    
    mov si, offset user_input
    xor cx, cx                      ; character counter
    
.input_loop:
    mov ah, 00h                     ; wait for keypress
    int 16h
    
    cmp al, 13                      ; ENTER key?
    je .done
    
    cmp al, 27                      ; ESC key?
    je .done
    
    cmp al, 8                       ; BACKSPACE?
    je .backspace
    
    cmp cx, 64                      ; max length reached?
    jge .input_loop
    
    ; Check if printable character (space to ~)
    cmp al, 32
    jl .input_loop
    cmp al, 126
    jg .input_loop
    
    ; Store character
    mov [si], al
    inc si
    inc cx
    
    ; Echo character to screen
    mov dl, al
    mov ah, 02h
    int 21h
    
    jmp .input_loop
    
.backspace:
    cmp cx, 0
    je .input_loop
    
    dec si
    dec cx
    mov byte [si], 0
    
    ; Move cursor back and erase
    mov ah, 02h
    mov dl, 8
    int 21h
    mov dl, 32
    int 21h
    mov dl, 8
    int 21h
    
    jmp .input_loop
    
.done:
    mov byte [si], '$'                ; null-terminate
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

;===========================================
; GET KEY INPUT (0-25)
;===========================================
get_key_input:
    push ax
    push dx
    
.retry:
    mov ah, 00h
    int 16h
    
    cmp al, '0'
    jl .retry
    cmp al, '9'
    jg .retry
    
    sub al, '0'                     ; convert ASCII to number
    
    ; Check if in range 0-25
    cmp al, 25
    jg .retry
    
    mov [user_key], al
    
    ; Echo to screen
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    
    pop dx
    pop ax
    ret

;===========================================
; CAESAR ENCRYPT PROCEDURE
;===========================================
caesar_encrypt_proc:
    push ax
    push si
    push di
    
    mov si, offset user_input
    mov di, offset output_result
    mov cl, [user_key]
    
.loop_en:
    lodsb                           ; load byte from [SI] into AL
    test al, al                     ; check if null terminator
    jz .done_en
    cmp al, '$'
    jz .done_en
    
    ; Only encrypt letters
    cmp al, 'A'
    jl .not_letter_en
    cmp al, 'Z'
    jle .uppercase_en
    cmp al, 'a'
    jl .not_letter_en
    cmp al, 'z'
    jle .lowercase_en
    jmp .not_letter_en
    
.uppercase_en:
    sub al, 'A'                     ; convert to 0-25
    add al, cl                      ; add key
    mov ah, 0
    mov bl, 26
    div bl                          ; AL = quotient, AH = remainder
    mov al, ah                      ; AL = (char + key) mod 26
    add al, 'A'                     ; convert back to ASCII
    jmp .store_en
    
.lowercase_en:
    sub al, 'a'
    add al, cl
    mov ah, 0
    mov bl, 26
    div bl
    mov al, ah
    add al, 'a'
    jmp .store_en
    
.not_letter_en:
    ; Keep non-letters as-is
    
.store_en:
    stosb                           ; store to [DI]
    jmp .loop_en
    
.done_en:
    mov byte [di], '$'              ; DOS string terminator
    pop di
    pop si
    pop ax
    ret

;===========================================
; CAESAR DECRYPT PROCEDURE
;===========================================
caesar_decrypt_proc:
    push ax
    push si
    push di
    
    mov si, offset user_input
    mov di, offset output_result
    mov cl, [user_key]
    
.loop_de:
    lodsb
    test al, al
    jz .done_de
    cmp al, '$'
    jz .done_de
    
    ; Only decrypt letters
    cmp al, 'A'
    jl .not_letter_de
    cmp al, 'Z'
    jle .uppercase_de
    cmp al, 'a'
    jl .not_letter_de
    cmp al, 'z'
    jle .lowercase_de
    jmp .not_letter_de
    
.uppercase_de:
    sub al, 'A'
    sub al, cl                      ; subtract key
    cmp al, 0
    jge .pos_upper_de
    add al, 26                      ; handle negative wrap
.pos_upper_de:
    mov ah, 0
    mov bl, 26
    div bl
    mov al, ah
    add al, 'A'
    jmp .store_de
    
.lowercase_de:
    sub al, 'a'
    sub al, cl
    cmp al, 0
    jge .pos_lower_de
    add al, 26
.pos_lower_de:
    mov ah, 0
    mov bl, 26
    div bl
    mov al, ah
    add al, 'a'
    jmp .store_de
    
.not_letter_de:
    ; Keep non-letters as-is
    
.store_de:
    stosb
    jmp .loop_de
    
.done_de:
    mov byte [di], '$'
    pop di
    pop si
    pop ax
    ret

;===========================================
; XOR CIPHER ENCRYPT SCREEN
;===========================================
xor_encrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset xor_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_enc
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label_xor
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0                       ; page 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_char_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Process encryption
    call xor_encrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    call display_hex_output
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 11
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; XOR CIPHER DECRYPT SCREEN
;===========================================
xor_decrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset xor_decrypt_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_xor_dec
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label_xor
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0                       ; page 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_char_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Convert hex string to bytes
    call parse_hex_string
    
    ; Process decryption
    call xor_decrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    mov dx, offset output_result
    call print_string
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 11
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; GET CHAR INPUT (single character for XOR key)
;===========================================
get_char_input:
    push ax
    push dx
    
    mov ah, 00h
    int 16h
    
    mov [user_key], al
    
    ; Echo to screen
    mov dl, al
    mov ah, 02h
    int 21h
    
    pop dx
    pop ax
    ret

;===========================================
; XOR ENCRYPT PROCEDURE
;===========================================
xor_encrypt_proc:
    push ax
    push si
    push di
    
    mov si, offset user_input
    mov di, offset output_result
    mov cl, [user_key]
    
.loop_xen:
    lodsb
    test al, al
    jz .done_xen
    cmp al, '$'
    jz .done_xen
    
    xor al, cl                      ; XOR with key
    stosb
    jmp .loop_xen
    
.done_xen:
    mov byte [di], 0                ; null terminator
    pop di
    pop si
    pop ax
    ret

;===========================================
; PARSE HEX STRING (converts "03 0E 07" to bytes)
;===========================================
parse_hex_string:
    push ax
    push bx
    push cx
    push si
    push di
    
    mov si, offset user_input       ; source hex string
    mov di, offset user_input       ; destination (overwrite)
    xor cx, cx                      ; byte counter
    
.parse_loop:
    lodsb                           ; get character
    
    cmp al, '$'                     ; end of string?
    je .parse_done
    cmp al, 0
    je .parse_done
    
    cmp al, ' '                     ; skip spaces
    je .parse_loop
    
    ; Convert first hex digit
    call ascii_to_hex
    cmp al, 0FFh                    ; invalid?
    je .parse_loop
    
    mov bl, al                      ; save high nibble
    shl bl, 4
    
    ; Get second hex digit
    lodsb
    cmp al, '$'
    je .parse_done
    cmp al, 0
    je .parse_done
    
    call ascii_to_hex
    cmp al, 0FFh
    je .parse_loop
    
    or bl, al                       ; combine nibbles
    mov al, bl
    stosb                           ; store byte
    inc cx
    
    jmp .parse_loop
    
.parse_done:
    mov byte [di], 0                ; null terminator
    
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret

;===========================================
; ASCII TO HEX (converts '0'-'9','A'-'F' to 0-15)
;===========================================
ascii_to_hex:
    cmp al, '0'
    jl .invalid
    cmp al, '9'
    jle .digit
    
    cmp al, 'A'
    jl .try_lower
    cmp al, 'F'
    jle .upper_letter
    
.try_lower:
    cmp al, 'a'
    jl .invalid
    cmp al, 'f'
    jg .invalid
    sub al, 'a'
    add al, 10
    ret
    
.upper_letter:
    sub al, 'A'
    add al, 10
    ret
    
.digit:
    sub al, '0'
    ret
    
.invalid:
    mov al, 0FFh
    ret

;===========================================
; XOR DECRYPT PROCEDURE
;===========================================
xor_decrypt_proc:
    push ax
    push si
    push di
    
    mov si, offset user_input
    mov di, offset output_result
    mov cl, [user_key]
    
.loop_xde:
    lodsb
    test al, al
    jz .done_xde
    cmp al, '$'
    jz .done_xde
    
    xor al, cl                      ; XOR with key (same operation)
    stosb
    jmp .loop_xde
    
.done_xde:
    mov byte [di], '$'              ; DOS string terminator
    pop di
    pop si
    pop ax
    ret

;===========================================
; DISPLAY HEX OUTPUT (for encrypted data)
;===========================================
display_hex_output:
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov si, offset output_result
    xor cx, cx                      ; byte counter
    
.loop:
    lodsb
    test al, al
    jz .done_display
    
    ; Convert byte to hex and display
    mov bl, al
    
    ; High nibble
    mov al, bl
    shr al, 4
    call hex_to_ascii
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; Low nibble
    mov al, bl
    and al, 0Fh
    call hex_to_ascii
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; Print space
    mov dl, ' '
    mov ah, 02h
    int 21h
    
    inc cx
    jmp .loop
    
.done_display:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

;===========================================
; HEX TO ASCII CONVERSION
;===========================================
hex_to_ascii:
    cmp al, 9
    jle .dig
    add al, 7                       ; 'A' - '9' - 1
.dig:
    add al, '0'
    ret

;-------------------------------------------
; Utility functions
;-------------------------------------------

clear_screen:
mov ax, 0003h           ; text mode 80x25
int 10h
ret

set_color_cyan_black:
mov ah, 06h             ; scroll up (clear)
mov al, 0               ; entire screen
mov bh, 1Bh             ; cyan on blue (11b = cyan, 1 = blue bg)
mov cx, 0               ; top-left
mov dx, 184Fh           ; bottom-right (24,79)
int 10h
ret

print_string:
mov ah, 09h
int 21h
ret

get_keypress:
mov ah, 00h             ; wait for key
int 16h                 ; AL = ASCII, AH = scan code
ret

display_submenu:
call clear_screen
call set_color_cyan_black
mov dx, offset submenu_box
call print_string
call get_keypress
ret

wait_key:
mov dx, offset footer
call print_string
mov ah, 00h
int 16h
ret

;===========================================
; DES CIPHER ENCRYPT SCREEN
;===========================================
des_encrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset des_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_enc
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label_des
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_des_key_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Process encryption
    call des_encrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    call display_hex_output
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; DES CIPHER DECRYPT SCREEN
;===========================================
des_decrypt_screen:
    call clear_screen
    call set_color_cyan_black
    
    ; Display header
    mov dx, offset des_decrypt_header
    call print_string
    
    ; Display input text box
    mov dx, offset input_box_top
    call print_string
    mov dx, offset input_box_label_xor_dec
    call print_string
    mov dx, offset input_box_prompt
    call print_string
    
    mov dx, offset input_box_bottom
    call print_string
    
    ; Display key input box
    mov dx, offset key_box_top
    call print_string
    mov dx, offset key_box_label_des
    call print_string
    mov dx, offset key_box_prompt
    call print_string
    mov dx, offset key_box_bottom
    call print_string

    ; Save cursor position for input (row 5, col 7)
    mov  [input_cursor_row], 6
    mov  [input_cursor_col], 7 
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [input_cursor_row]
    mov dl, [input_cursor_col]
    int 10h
    
    ; Get user input for text
    call get_string_input
    
    ; Save cursor position for key input (row 10, col 7)
    mov [key_cursor_row], 11
    mov [key_cursor_col], 7
    
    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    mov dh, [key_cursor_row]
    mov dl, [key_cursor_col]
    int 10h
    
    ; Get key input
    call get_des_key_input
    
    mov dx, offset key_box_bottom
    call print_string
    
    ; Convert hex string to bytes
    call parse_hex_string
    
    ; Process decryption
    call des_decrypt_proc
    
    ; Display result box
    mov dx, offset result_box_top
    call print_string
    mov dx, offset result_box_label
    call print_string
    mov dx, offset result_box_prompt
    call print_string
    
    ; Display result
    mov dx, offset output_result
    call print_string
    
    mov dx, offset result_box_bottom
    call print_string
    
    ; Show instructions
    mov dx, offset input_instructions
    call print_string

    mov ah, 02h
    mov dh, 6
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dh, 16
    mov dl, 76
    mov bh, 0
    int 10h

    mov ah, 0Ah
    mov al, 179
    mov bh, 0
    mov cx, 1
    int 10h
    
    ; Wait for key
    call get_keypress
    ret

;===========================================
; GET DES KEY INPUT (single digit 0-9)
;===========================================
get_des_key_input:
    push ax
    push dx
    
.retry_key:
    mov ah, 00h
    int 16h
    
    cmp al, '0'
    jl .retry_key
    cmp al, '9'
    jg .retry_key
    
    sub al, '0'                     ; convert ASCII to number (0-9)
    mov [user_key], al
    
    ; Echo to screen
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    
    pop dx
    pop ax
    ret

;===========================================
; FEISTEL NIBBLE ROUND - ENCRYPT
;===========================================
des_encrypt_proc:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    mov si, offset user_input
    mov di, offset output_result
    
    ; Calculate string length
    xor cx, cx
    push si
.count_len:
    lodsb
    cmp al, 0
    je .got_len
    cmp al, '$'
    je .got_len
    inc cx
    jmp .count_len
    
.got_len:
    pop si
    cmp cx, 0
    je .feist_enc_done
    
    ; Reset SI to start
    mov si, offset user_input
    mov al, [user_key]
    and al, 0Fh                     ; mask to 4-bit key
    
.feist_enc_loop:
    mov dl, [si]                    ; load source byte
    
    ; Split Nibbles
    mov dh, dl
    shr dh, 4                       ; DH = Upper Nibble (L)
    and dl, 0Fh                     ; DL = Lower Nibble (R)
    
    ; Calculate Round Function F
    mov bl, dl                      ; copy R to BL
    xor bl, al                      ; BL = R XOR Key
    
    ; Rotate F left by 1 bit (within 4-bit range)
    shl bl, 1
    test bl, 10h                    ; check for carry out of bit 3
    jz .no_wrap_enc
    or bl, 01h                      ; wrap bit to position 0
.no_wrap_enc:
    and bl, 0Fh                     ; mask to keep it 4-bit
    
    ; Form New Byte
    shl dl, 4                       ; New Upper = Old R
    xor dh, bl                      ; New Lower = L XOR F
    and dh, 0Fh                     ; safety mask
    or dl, dh                       ; combine
    
    mov [di], dl                    ; write result
    inc si
    inc di
    loop .feist_enc_loop
    
.feist_enc_done:
    mov byte [di], 0
    
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

;===========================================
; FEISTEL NIBBLE ROUND - DECRYPT
;===========================================
des_decrypt_proc:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    mov si, offset user_input
    
    ; Calculate string length
    xor cx, cx
    push si
.count_len_dec:
    lodsb
    cmp al, 0
    je .got_len_dec
    inc cx
    jmp .count_len_dec
    
.got_len_dec:
    pop si
    cmp cx, 0
    je .feist_dec_done
    
    ; Step 1: Swap nibbles of ciphertext
    push cx
    mov si, offset user_input
.swap1_loop:
    mov dl, [si]
    rol dl, 4                       ; swap upper/lower
    mov [si], dl
    inc si
    loop .swap1_loop
    pop cx
    
    ; Step 2: Run cipher again
    push cx
    mov si, offset user_input
    mov di, offset output_result
    mov al, [user_key]
    and al, 0Fh
    
.feist_dec_loop:
    mov dl, [si]
    
    ; Split Nibbles
    mov dh, dl
    shr dh, 4
    and dl, 0Fh
    
    ; Calculate Round Function F
    mov bl, dl
    xor bl, al
    
    ; Rotate F left by 1 bit
    shl bl, 1
    test bl, 10h
    jz .no_wrap_dec
    or bl, 01h
.no_wrap_dec:
    and bl, 0Fh
    
    ; Form New Byte
    shl dl, 4
    xor dh, bl
    and dh, 0Fh
    or dl, dh
    
    mov [di], dl
    inc si
    inc di
    loop .feist_dec_loop
    pop cx
    
    ; Step 3: Swap nibbles again to finish
    mov si, offset output_result
.swap2_loop:
    mov dl, [si]
    rol dl, 4
    mov [si], dl
    inc si
    loop .swap2_loop
    
.feist_dec_done:
    mov byte [di], '$'
    
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

exit_program:
mov ax, 0003h           ; restore text mode
int 10h
mov ah, 4Ch
xor al, al
int 21h