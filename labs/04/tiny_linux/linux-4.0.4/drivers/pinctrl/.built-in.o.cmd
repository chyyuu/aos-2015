cmd_drivers/pinctrl/built-in.o :=  ld -m elf_i386   -r -o drivers/pinctrl/built-in.o drivers/pinctrl/freescale/built-in.o drivers/pinctrl/intel/built-in.o drivers/pinctrl/nomadik/built-in.o 
