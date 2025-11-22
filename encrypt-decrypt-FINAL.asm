org 100h

jmp start

;===========================================
; DATA SECTION (CP437/OEM-US encoding)
;===========================================

; Header with double-line box (CP437: +-+¦++)
header db 201,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205,187,13,10
db 186,"       _____ _   _  ____ ______   _______ _______ ___ ___  _   _             ",186,13,10
db 186,"      | ____| \ | |/ ___|  _ \ \ / /  _  |_   _|_   _/ _ \| \ | |            ",186,13,10
db 186,"      |  _| |  \| | |   | |_) \ V /| |_) | | |   | || | | |  \| |            ",186,13,10
db 186,"      | |___| |\  | |___|  _ < | | |  __/  | |   | || |_| | |\  |            ",186,13,10
db 186,"      |_____|_| \_|\____|_| \_\|_| |_|     |_|  |___|\___/|_| \_|            ",186,13,10
db 186,"       ____  _____ ____ ______   _______ _______ ___ ___  _   _              ",186,13,10
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
db "                    ",179,"                                      ",179,13,10
db "                    ",179,"   [1] ",254," Encrypt                   ",179,13,10
db "                    ",179,"                                      ",179,13,10
db "                    ",179,"   [2] ",254," Decrypt                   ",179,13,10
db "                    ",179,"                                      ",179,13,10
db "                    ",179,"   [ESC] Back to Main Menu           ",179,13,10
db "                    ",179,"                                      ",179,13,10
db "                    ",192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10
db "                    ",175," Select: $"

; Footer (for other screens)
footer db 13,10,13,10
db "                    ",219,219," Press any key to continue...",13,10,"$"

newline db 13,10,"$"

;===========================================
; CODE SECTION
;===========================================

start:
call clear_screen
call set_color_cyan_black

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
call display_submenu
; Add your Caesar cipher logic here
call wait_key
jmp main_menu

option_xor:
call display_submenu
; Add your XOR logic here
call wait_key
jmp main_menu

option_des:
call display_submenu
; Add your DES logic here
call wait_key
jmp main_menu

option_about:
call clear_screen
mov dx, offset header
call print_string
; Display about/help text
mov dx, offset footer
call print_string
call wait_key
jmp main_menu

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

exit_program:
mov ax, 0003h           ; restore text mode
int 10h
mov ah, 4Ch
xor al, al
int 21h

