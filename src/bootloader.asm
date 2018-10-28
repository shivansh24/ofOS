[org 0x7c00]

mov bx, WelcomeMessage
call print_string
call print_endline
jmp $

%include "print.asm"

WelcomeMessage:
    db 'Welcome to ofOS', 0

times 510 - ($ - $$) db 0x0
dw 0xaa55
