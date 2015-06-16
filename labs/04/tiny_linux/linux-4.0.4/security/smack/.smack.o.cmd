cmd_security/smack/smack.o := ld -m elf_x86_64   -r -o security/smack/smack.o security/smack/smack_lsm.o security/smack/smack_access.o security/smack/smackfs.o 
