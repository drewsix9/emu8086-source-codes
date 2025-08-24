section .text
  mov ah, 09h
  mov dx, offset msg
  int 21h

  mov ah, 4ch 
  int 21h

section .data 
  msg db "Hello WOrld!$"
