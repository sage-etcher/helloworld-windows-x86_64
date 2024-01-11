

# directories
SRC_DIR := .
BUILD_DIR := .\build

# files
EXEC_FILE := $(BUILD_DIR)\hello.exe
SRC_FILENAMES := hello.asm
SRC_FILES := $(foreach filename,$(SRC_FILENAMES),$(SRC_DIR)\$(filename))
OBJ_FILES := $(foreach filename,$(SRC_FILENAMES),$(BUILD_DIR)\$(filename).o)


# assembler variables
ASSEMBLER := nasm
A_FLAGS := -f win64


# linker variables
LINKER := gcc
L_FLAGS := -Wl,-subsystem,console


# make the object files and executable
.PHONY: build
build: $(EXEC_FILE)

$(EXEC_FILE): $(OBJ_FILES)
	@if not exist $(dir $@) mkdir $(dir $@)
	$(LINKER) -o $@ $(L_FLAGS) $(OBJ_FILES)

$(BUILD_DIR)\\%.asm.o: $(SRC_DIR)\\%.asm
	@if not exist $(dir $@) mkdir $(dir $@)
	$(ASSEMBLER) -o $@ $(A_FLAGS) $<


# test that variables are set propperly
.PHONY: test
test:
	@echo SRC_DIR: $(SRC_DIR)
	@echo BUILD_DIR: $(BUILD_DIR)
	@echo EXEC_FILE: $(EXEC_FILE)
	@echo SRC_FILENAMES: $(SRC_FILENAMES)
	@echo SRC_FILES: $(SRC_FILES)
	@echo OBJ_FILES: $(OBJ_FILES)
	@echo ASSEMBLER: $(ASSEMBLER)
	@echo A_FLGS: $(A_FLAGS)
	@echo LINKER: $(LINKER)
	@echo L_FLAGS: $(L_FLAGS)


# clean up build files
.PHONY: clean
clean:
	@if exist $(BUILD_DIR) ( del /s /q $(BUILD_DIR) & rmdir /s /q $(BUILD_DIR) )


