SRC=$(wildcard src/*.c drivers/*.c)
OBJ_TMP=$(patsubst src/%.c, obj/%.o, $(SRC))
OBJ=$(patsubst drivers/%.c, obj/%.o, $(OBJ_TMP))

TARGET=bin/os.bin

all: $(TARGET)

$(TARGET): bin/bootloader.bin bin/kernel.bin
	cat $^ > $@

bin/bootloader.bin: bootloader.asm
	nasm -f bin -o $@ $^

bin/kernel.bin: obj/kernelEntry.o $(OBJ) obj/idt.o
	ld -o $@ -Ttext 0x1000 -m elf_i386 $^ --oformat binary

obj/%.o: src/%.asm
	nasm -f elf -o $@ $^

obj/%.o: src/%.c
	gcc -o $@ -ffreestanding -fno-pie -fno-stack-protector -m32 -c $^

obj/%.o: drivers/%.c
	gcc -o $@ -ffreestanding -fno-pie -fno-stack-protector -m32 -c $^

clean:
	rm -r bin/* obj/*
