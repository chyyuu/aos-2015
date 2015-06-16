cmd_kernel/locking/built-in.o :=  ld -m elf_x86_64   -r -o kernel/locking/built-in.o kernel/locking/mutex.o kernel/locking/semaphore.o kernel/locking/rwsem.o kernel/locking/rwsem-xadd.o 
