SRC_DIR := ./src
BIN_DIR := ./bin

EXECUTABLE := $(BIN_DIR)/happyOS.bin
BOOTLOADER_BIN := $(BIN_DIR)/rm/bootloader.o

.PHONY: clean

$(EXECUTABLE): $(BOOTLOADER_BIN) 
	cat $^ >> $(EXECUTABLE)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.asm
	@mkdir -p $(@D)
	nasm -o $@ $<

clean:
	rm -r bin