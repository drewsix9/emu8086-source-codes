include 'emu8086.inc'
.model small
.stack 100h

.data
    size dw ?       
    target db ?
    arr db 50 dup(?)
    newline db 0dh, 0ah, '$'
    prompt_size db "Enter array size: $"
    prompt_val db "Enter array $"
    prompt_target db "Enter value to find: $"  
    str_found db "Target found at index: $"      
    str_not_found db "Target NOT found!$" 
    result db ?

.code
main:
    mov ax, @data
    mov ds, ax
    
    CURSORON
    
    mov ah, 09h
    lea dx, prompt_size
    int 21h
        
    call SCAN_NUM
    mov size, cx 
    
    call print_newline
              
    lea bx, arr
    mov si, 0
    loop1:                
        mov ah, 09h
        lea dx, prompt_val
        int 21h 
        
        mov dx, si          
        add dl, '1'
        mov ah, 02h
        int 21h
        
        print ": "
        
        call SCAN_NUM
        mov [bx + si], cl

        
        call print_newline
        
        inc si
        cmp si, size
        jl loop1
 
	call print_newline
	  
    mov ah, 09h
    lea dx, prompt_target
    int 21h
    
    call SCAN_NUM
    mov target, cl
    
    lea dx, arr
    push dx
    mov dx, size
    push dx
    xor dx,dx
    mov dl, target
    push dx 
    
    call binary_search
             
    call print_newline 
    mov al, result 
    cmp al, 00h
    jge print_found
    jmp print_not_found

 	stop:
 		mov ah, 4ch
 		mov dl, 0
 		int 21h
 
        
binary_search proc
	push bp
	mov bp, sp
	mov bx, [bp + 8] ; arr
	mov cx, [bp + 6] ; size
	mov dx, [bp + 4] ; target 
	
	sub sp, 6
	;[bp]
	;[left]   -2
	;[right]  -4
	;[mid]    -6
	
	mov word ptr [bp-2], 0000H; left
	
	mov [bp-4], cx 	; right
	dec [bp-4]
	            
	xor si, si
	mov si, [bp-2]
           
    xor di, di
	mov di, [bp-4]
	
	bs_loop:
		mov ax, si
		cmp ax, di
		jg not_found
		
		; calculate mid  
	    mov ax, di
		add ax, si
		shr ax, 1
	    mov word ptr [bp-6], ax		
		
		; if mid is equal to target
		mov dx, [bp + 4]
		mov bx, [bp + 8] ; address of arr
		add bx, [bp-6]   ; arr + mid
		mov cl, byte ptr [bx]
		cmp cl, dl  
		
		;if equal
		je found 
		
		;if arr[mid] < targer
		jl search_right      
		
		; else search left
		dec ax
		mov di, ax
		jmp bs_loop
		 
			
	search_right:
	    ; left = mid + 1
	    inc ax
	    mov si, ax
	    jmp bs_loop:
	    
		
	found:
	    mov ax, [bp-6]
	    mov result, al 
	    ; do cleaning
	    jmp exit_bs
		
	not_found:
	    mov ax, -1
		mov result, al
		
    exit_bs:
        add sp, 6
        pop bp
        ret 6
	
binary_search endp 
          
          
print_found proc
    mov ah, 09h
    lea dx, str_found
    int 21h
    mov ah, 02h 
    mov dl, result  
    add dl, '0'
    int 21h
    ret 
print_found endp 
          
          
print_not_found proc
    mov ah, 09h
    lea dx, str_not_found
    int 21h
    ret
print_not_found endp
           
           
print_newline proc
    mov ah, 09h
    lea dx, newline
    int 21h
    ret
print_newline endp
    

DEFINE_SCAN_NUM
end main