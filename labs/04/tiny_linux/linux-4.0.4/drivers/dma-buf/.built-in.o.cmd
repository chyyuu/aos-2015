cmd_drivers/dma-buf/built-in.o :=  ld -m elf_x86_64   -r -o drivers/dma-buf/built-in.o drivers/dma-buf/dma-buf.o drivers/dma-buf/fence.o drivers/dma-buf/reservation.o drivers/dma-buf/seqno-fence.o 
