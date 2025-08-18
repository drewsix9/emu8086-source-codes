include 'emu8086.inc'
.model small
.stack 100h

.data
    arr db 50 dup(?)
    target db ?
    size dw ?
    
.code

main: 
    PRINT 'Enter array size: $'
    
    call SCAN_NUM
    mov size, cx
   




DEFINE_SCAN_NUM
;DEFINE_PRINT_NUM
;DEFINE_PRINT_STRING

end main 