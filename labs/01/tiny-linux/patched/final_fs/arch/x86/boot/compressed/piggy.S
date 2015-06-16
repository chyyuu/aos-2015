.section ".rodata..compressed","a",@progbits
.globl z_input_len
z_input_len = 728620
.globl z_output_len
z_output_len = 4287144
.globl z_extract_offset
z_extract_offset = 0x376000
.globl z_extract_offset_negative
z_extract_offset_negative = -0x376000
.globl z_run_size
z_run_size = 4625566
.globl input_data, input_data_end
input_data:
.incbin "arch/x86/boot/compressed/vmlinux.bin.xz"
input_data_end:
