#!/bin/bash

rm -rf bin
mkdir -p bin
nasm -i `pwd`/src/ -f bin -o bin/bootloader.bin src/bootloader.asm
nasm src/kernel_entry.asm -f elf64 -o bin/kernel_entry.o
gcc -ffreestanding -c src/kernel.c -o bin/kernel.o
ld -o bin/kernel.bin -Ttext 0x1000 bin/kernel_entry.o bin/kernel.o --oformat binary
cat bin/bootloader.bin bin/kernel.bin > bin/ofos.image

qemu-system-i386 -fda bin/ofos.image
