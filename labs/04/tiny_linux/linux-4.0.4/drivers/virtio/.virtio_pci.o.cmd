cmd_drivers/virtio/virtio_pci.o := ld -m elf_i386   -r -o drivers/virtio/virtio_pci.o drivers/virtio/virtio_pci_modern.o drivers/virtio/virtio_pci_common.o drivers/virtio/virtio_pci_legacy.o 
