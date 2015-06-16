cmd_fs/binfmt_script.ko := ld -r -m elf_i386 -T ./scripts/module-common.lds --build-id  -o fs/binfmt_script.ko fs/binfmt_script.o fs/binfmt_script.mod.o
