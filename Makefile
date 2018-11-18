all: bootloader

bootloader: src/bootloader.asm
	nasm -i `pwd`/src/ -f bin -o bin/bootloader.bin src/bootloader.asm
	cat bin/bootloader.bin > bin/ofos.image

run: bin/bootloader
	qemu-system-i386 -fda bin/ofos.image
