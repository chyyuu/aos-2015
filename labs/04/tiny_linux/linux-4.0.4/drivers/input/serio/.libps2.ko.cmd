cmd_drivers/input/serio/libps2.ko := ld -r -m elf_i386 -T ./scripts/module-common.lds --build-id  -o drivers/input/serio/libps2.ko drivers/input/serio/libps2.o drivers/input/serio/libps2.mod.o
