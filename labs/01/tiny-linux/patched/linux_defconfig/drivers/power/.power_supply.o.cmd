cmd_drivers/power/power_supply.o := ld -m elf_x86_64   -r -o drivers/power/power_supply.o drivers/power/power_supply_core.o drivers/power/power_supply_sysfs.o drivers/power/power_supply_leds.o 
