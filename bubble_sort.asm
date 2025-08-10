.model small
.stack 100h

.data
	arr db 15, 42, 7, 23, 91, 8, 56, 34, 12, 67, 89, 3, 45, 78, 19, 33, 52, 6, 84, 27
	count equ $ - arr
	
.code
main:                
	mov ax, @data
	mov ds, ax
	          
	mov cx, count
	mov si, 0
	mov di, 1
outer:
	cmp si, cx
	jge done_outer
	mov di, si
	inc di
inner:
	cmp di, cx
	jge done_inner
compare:
	mov al, arr[si]
	mov bl, arr[di]
	cmp al, bl
	jle done_compare
swap:
	xor al, bl
	xor bl, al
	xor al, bl
	
	mov arr[si], al
	mov arr[di], bl
done_compare:
	inc di
	jmp inner
done_inner:         
	inc si
	jmp outer
done_outer:       
	mov ah, 4ch
	int 21h
end main