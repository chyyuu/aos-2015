cmd_drivers/input/serio/serio.ko := ld -r -m elf_i386 -T ./scripts/module-common.lds --build-id  -o drivers/input/serio/serio.ko drivers/input/serio/serio.o drivers/input/serio/serio.mod.o
