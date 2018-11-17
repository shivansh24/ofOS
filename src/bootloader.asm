[org 0x7c00]

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string

    call switch_to_pm
    jmp $

%include "print_string_16.asm"
%include "gdt_32.asm"
%include "print_string_pm_32.asm"
%include "switch_to_pm_32.asm"

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    jmp $


MSG_REAL_MODE db "Started in 16-bit Real Mode", 0 
MSG_PROT_MODE db "Successfully switched to 32-bit Protected Mode :)", 0

; Bootsector Padding
times 510-($-$$) db 0
dw 0xaa55
