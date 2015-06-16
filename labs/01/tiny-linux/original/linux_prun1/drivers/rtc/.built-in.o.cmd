cmd_drivers/rtc/built-in.o :=  ld -m elf_x86_64   -r -o drivers/rtc/built-in.o drivers/rtc/rtc-lib.o drivers/rtc/systohc.o drivers/rtc/rtc-core.o drivers/rtc/rtc-cmos.o 
