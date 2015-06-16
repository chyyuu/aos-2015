cmd_drivers/md/built-in.o :=  ld -m elf_i386   -r -o drivers/md/built-in.o drivers/md/md-mod.o drivers/md/dm-mod.o drivers/md/dm-builtin.o 
