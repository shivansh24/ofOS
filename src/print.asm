print_string:
    pusha
    mov ah, 0xe

print_string_loop:
    mov al, [bx]
    cmp al, 0
    je print_string_end

    int 0x10
    add bx, 1
    jmp print_string_loop

print_string_end:
    popa
    ret


print_endline:
    pusha
    mov ah, 0xe
    mov al, 0xd ;\r
    int 0x10
    mov al, 0xa ;\n
    int 0x10
    popa
    ret
