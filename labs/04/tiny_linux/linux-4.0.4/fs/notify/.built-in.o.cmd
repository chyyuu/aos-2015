cmd_fs/notify/built-in.o :=  ld -m elf_i386   -r -o fs/notify/built-in.o fs/notify/dnotify/built-in.o fs/notify/inotify/built-in.o fs/notify/fanotify/built-in.o 
