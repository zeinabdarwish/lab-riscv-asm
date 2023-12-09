
SOURCE_C = max.c
SOURCE_ASM = max.s
DUMP_FILE = max.dump


EXECUTABLE = max.elf


default: $(DUMP_FILE) $(EXECUTABLE)

$(EXECUTABLE): $(SOURCE_C)
    riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 $< -o $@


$(DUMP_FILE): $(EXECUTABLE)
    riscv64-unknown-elf-objdump -D $< > $@


clean:
    rm -f $(DUMP_FILE)
    rm -f $(EXECUTABLE)
