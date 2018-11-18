[org 0x7c00]
KERNEL_OFFSET equ 0x1000
    mov [BOOT_DRIVE], dl ;; BIOS Stores boot drive in dl

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string
    call print_endline

    call load_kernel

    call switch_to_pm
    jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "switch_to_pm.asm"
%include "disk_load.asm"

[bits 16]
load_kernel:
    mov bx, MSG_LOAD_KERN
    call print_string
    call print_endline
    
    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret

[bits 32]
BEGIN_PM:
    call KERNEL_OFFSET
    jmp $

BOOT_DRIVE    db 0x0
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0x0
MSG_LOAD_KERN db "Loading kernel into memory", 0x0

times 510-($-$$) db 0
dw 0xaa55
