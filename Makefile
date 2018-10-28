all: bootloader

bootloader: src/bootloader.asm
	nasm -i `pwd`/src/ -f bin -o bin/bootloader src/bootloader.asm

run: bin/bootloader
	qemu-system-i386 -drive format=raw,file=bin/bootloader
