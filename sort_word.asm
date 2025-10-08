org 100h

.data 
    arr dw 6,4,8,1,6,8
    size dw 6

.code
main proc near

	lea si, arr
	mov di, si
	add di, 2
	
	l1:
	    cmp si, offset arr+0ch
	    jge stop                    
	                 
	    l2:             
    	    cmp di, offset arr+0ch
    	    jge nxt_l1
    	             
    	    mov cx, [si]
    	    mov dx, [di]         
    	    cmp cx, dx
    	    jl skip_swap
    	    
    	    xor cx, dx
    	    xor dx, cx
    	    xor cx, dx
    	    
    	    mov [si], cx
    	    mov [di], dx
    	          
            skip_swap:
    	    add di, 2
    	    jmp l2
	    
	    nxt_l1:
	    add si, 2
	    mov di, si
	    add di, 2
	    jmp l1
	    
	    
	    
	stop:  
	
	mov cx, 6
	
	lea bx, arr
	mov ah, 0eh
	          
	l3:
    	mov al, [bx]
    	add al, '0'
    	int 10h
    	add bx, 2
    	loop l3 
    	
    hlt
	
	    

main endp

end main