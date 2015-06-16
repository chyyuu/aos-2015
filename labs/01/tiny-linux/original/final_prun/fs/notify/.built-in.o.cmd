cmd_fs/notify/built-in.o :=  ld -m elf_x86_64   -r -o fs/notify/built-in.o fs/notify/dnotify/built-in.o fs/notify/inotify/built-in.o fs/notify/fanotify/built-in.o 
