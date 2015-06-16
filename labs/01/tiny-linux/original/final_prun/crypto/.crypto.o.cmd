cmd_crypto/crypto.o := ld -m elf_x86_64   -r -o crypto/crypto.o crypto/api.o crypto/cipher.o crypto/compress.o crypto/memneq.o 
