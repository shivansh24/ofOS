disk_load:
    push dx
    mov ah, 0x2 ;; BIOS read sector funct
    mov al, dh
    mov ch, 0x0 ;; cyllinder 0
    mov dh, 0x0 ;; head 0
    mov cl, 0x2 ;; sector after BIOS
    int 0x13
    
    jc disk_error

    pop dx
    cmp dh, al  ;; assert read == expected
    jne disk_error
    ret

disk_error:
    mov bx, MSG_DISK_ERROR
    call print_string
    call print_endline
    jmp $

MSG_DISK_ERROR db "Aw snap - unable to read disk", 0x0
