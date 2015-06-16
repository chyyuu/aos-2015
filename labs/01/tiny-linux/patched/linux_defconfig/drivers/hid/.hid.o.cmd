cmd_drivers/hid/hid.o := ld -m elf_x86_64   -r -o drivers/hid/hid.o drivers/hid/hid-core.o drivers/hid/hid-input.o drivers/hid/hid-debug.o drivers/hid/hidraw.o 
