[bits 16]

switch_to_pm:
    cli
    lgdt [gdt_descriptor] ; setting gdt_descriptor

    mov eax, cr0	; setting cr0 register to 1
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm  ; to flush the pipelines

[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax     ;setting offset of data segment
    mov ss, ax     ;setting offset of stack segment
    mov es, ax     ;setting offset of extra segment
    mov fs, ax     ;
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

call BEGIN_PM

