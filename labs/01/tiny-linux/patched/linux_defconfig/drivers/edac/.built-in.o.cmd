cmd_drivers/edac/built-in.o :=  ld -m elf_x86_64   -r -o drivers/edac/built-in.o drivers/edac/edac_stub.o drivers/edac/edac_mce_amd.o 
