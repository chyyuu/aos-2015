.section ".rodata..compressed","a",@progbits
.globl z_input_len
z_input_len = 5943497
.globl z_output_len
z_output_len = 20912312
.globl z_extract_offset
z_extract_offset = 0xe58000
.globl z_extract_offset_negative
z_extract_offset_negative = -0xe58000
.globl z_run_size
z_run_size = 21987328
.globl input_data, input_data_end
input_data:
.incbin "arch/x86/boot/compressed/vmlinux.bin.gz"
input_data_end:
