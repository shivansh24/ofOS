; print_string function
; it will use the value of bx register

print_string:
    pusha
    mov ah, 0xe

print_string_loop:
    mov al, [bx]
    cmp al, 0x0
    je print_string_end

    int 0x10
    add bx, 0x1
    jmp print_string_loop

print_string_end:
    popa
    ret


; print_endline function
; equivalent of \r\n

print_endline:
    pusha
    mov ah, 0xe
    mov al, 0xd ;\r
    int 0x10
    mov al, 0xa ;\n
    int 0x10
    popa
    ret


; print_hex function
; it will use the value of dx register

print_hex:
    pusha
    mov ah, 0xe
    mov cx, 0x10

print_hex_loop:
    sub cx, 0x4
    cmp cx, 0x0
    jl print_hex_end

    mov bx, dx
    shr bx, cl
    and bx, 0xf
    cmp bx, 0x9
    jg print_hex_char

print_hex_int:
    add bx, 0x30
    mov al, bl
    int 0x10
    jmp print_hex_loop

print_hex_char:
    add bx, 0x57
    mov al, bl
    int 0x10
    jmp print_hex_loop

print_hex_end:
    popa
    ret

