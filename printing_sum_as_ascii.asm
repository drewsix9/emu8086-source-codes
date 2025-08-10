.model small
.stack 100h

.data
msg db "Result: $"
result_str db 10 dup('$')  ; Buffer for up to 10 digits + terminator

.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    
    ; Print "Result: "
    mov ah, 09h
    mov dx, offset msg
    int 21h
    
    ; Calculate sum (example: 5 + 10 = 15, but could be any calculation)
    mov ax, 1000
    add ax, 693        ; AX now contains the sum
    
    ; Convert number to string
    call number_to_string
    
    ; Print the result
    mov ah, 09h
    mov dx, offset result_str
    int 21h
    
    ; Exit gracefully
    mov ah, 4ch
    mov al, 0
    int 21h

; Procedure to convert number in AX to ASCII string
; Input: AX = number to convert
; Output: result_str contains ASCII representation
number_to_string proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    ; Clear the result string
    mov si, offset result_str
    mov cx, 10
    clear_loop:
        mov byte ptr [si], '$'
        inc si
        loop clear_loop
    
    ; Handle special case of zero
    cmp ax, 0
    jne convert_start
    mov result_str[0], '0'
    jmp convert_done
    
    convert_start:
    mov si, 0           ; Index for storing digits
    mov bx, 10          ; Divisor
    
    ; Extract digits by repeated division
    extract_loop:
        mov dx, 0       ; Clear DX for division
        div bx          ; AX = AX/10, DX = remainder
        add dl, '0'     ; Convert remainder to ASCII
        
        ; Store digit at current position
        mov result_str[si], dl
        inc si
        
        ; Continue if quotient is not zero
        cmp ax, 0
        jne extract_loop
    
    ; Reverse the string (digits are stored backwards)
    dec si              ; SI now points to last digit
    mov di, 0           ; DI = start index
    
    reverse_loop:
        ; Check if DI and SI have met or crossed (prevent collision)
        cmp di, si
        jge reverse_done    ; If DI >= SI, we're done reversing
        
        ; Swap characters at DI and SI
        mov al, result_str[di]
        mov bl, result_str[si]
        mov result_str[di], bl
        mov result_str[si], al
        
        inc di
        dec si
        jmp reverse_loop    ; Continue loop
    
    reverse_done:
    convert_done:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
number_to_string endp

end main