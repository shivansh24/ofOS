[bits 32]

VIDEO_MEMORY equ 0xb8000 ;Memory address for the current VGA(Video Graphics Array) mode
WHITE_ON_BLACK equ 0x0f

; specific memory range
; each character cell of screen is represented by two bytes of memory
; 1. Ascii code 2. chracter attribute

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] 	; setting ascii code 
    mov ah, WHITE_ON_BLACK ;setting attribute

    cmp al, 0  
    je print_done

    mov [edx], ax  ; storing in current memory cell

    add ebx, 1 ; moving to next character
    add edx, 2 ; moving to next memory cell

    jmp print_string_pm_loop

print_done:
    popa   ; pops all registers from the stack
    ret    ; returns
