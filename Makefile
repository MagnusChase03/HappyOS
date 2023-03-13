SRC=$(wildcard src/*.c)
OBJ=$(patsubst src/%.c, obj/%.o, $(SRC))

TARGET=bin/os.bin

all: $(TARGET)

$(TARGET): bin/bootloader.bin bin/kernel.bin
	cat $^ > $@

bin/bootloader.bin: bootloader.asm
	nasm -f bin -o $@ $^

bin/kernel.bin: obj/kernelEntry.o $(OBJ)
	ld -o $@ -Ttext 0x1000 -m elf_i386 $^ --oformat binary

obj/%.o: src/%.c
	gcc -o $@ -ffreestanding -fno-pie -m32 -c $^

obj/%.o: src/%.asm
	nasm -f elf -o $@ $^

clean:
	rm -r bin/* obj/*
