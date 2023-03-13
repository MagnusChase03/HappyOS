all: build
build:
	nasm -f bin -o obj/bootloader.bin bootloader.asm 
	nasm -f elf -o obj/kernelEntry.o src/kernelEntry.asm
	gcc -ffreestanding -fno-pie -m32 -c src/kernel.c -o obj/kernel.o
	ld -o obj/kernel.bin -Ttext 0x1000 -m elf_i386 obj/kernelEntry.o obj/kernel.o --oformat binary
	cat obj/bootloader.bin obj/kernel.bin > bin/os.bin

clean:
	rm -r bin/* obj/*
