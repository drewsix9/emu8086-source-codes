.model small
.stack 100h

.data 
    arr db 4,6,2,7,1
    size equ $ - arr
	not_fnd db " not found in array$"
	fnd db " found in array$"
	value db 9

.code
main:   
    mov ax, @data
    mov ds, ax
       
    ; let si start at arr, di end of arr
    mov si, 0       
    mov di, size
    ; let bx point to start of arr
    lea bx, arr

start:
    ; si does not reach end of arr, loop again    
    cmp si, di 
    jge not_found
                        
    ; al temporary varable to store the current arr[i]
    mov al, [bx + si]
    ; if al is equal to value to be found, jump to found label
    cmp al, value
    je found
 
    ; otherwise increment si and jump back to loop start
    inc si
    jmp start  
       
not_found:
    mov ah, 02h
    mov dl, value
    add dl, '0'     ; add 48 ( ascii code for '0')
    int 21h
    
    mov ah, 09h
    lea dx, not_fnd
    int 21h
    jmp stop

found:
    mov ah, 02h
    mov dl, value
    add dl, '0'     ; add 48 ( ascii code for '0')
    int 21h
    
    mov ah, 09h
    lea dx, fnd
    int 21h
    
stop:
    mov ah, 4ch
    int 21h 
    
    


end main