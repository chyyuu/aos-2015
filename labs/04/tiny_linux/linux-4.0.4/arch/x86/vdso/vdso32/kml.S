
#if defined(CONFIG_KERNEL_MODE_LINUX) && defined(CONFIG_X86_32)

	.text
	.org __kernel_rt_sigreturn+32,0x90
	.globl __kernel_vsyscall_kml
	.type __kernel_vsyscall_kml,@function
__kernel_vsyscall_kml:
.LSTART_vsyscall_kml:
	jmp *0x12345678(,%eax,4) /* "0x12345678" is used as dummy */
.LEND_vsyscall_kml:
	.size __kernel_vsyscall_kml,.-.LSTART_vsyscall_kml
	.balign 32
	.previous

	.section .eh_frame,"a",@progbits
.LSTARTFRAMEDLSI_KML:
	.long .LENDCIEDLSI_KML-.LSTARTCIEDLSI_KML
.LSTARTCIEDLSI_KML:
	.long 0
	.byte 1
	.string "zR"
	.uleb128 1
	.uleb128 -4
	.byte 8
	.uleb128 1
	.byte 0x1b
	.byte 0x0c
	.uleb128 4
	.uleb128 4
	.byte 0x88
	.uleb128 1
	.align 4
.LENDCIEDLSI_KML:
	.long .LENDFDEDLSI_KML-.LSTARTFDEDLSI_KML
.LSTARTFDEDLSI_KML:
	.long .LSTARTFDEDLSI_KML-.LSTARTFRAMEDLSI_KML
	.long .LSTART_vsyscall_kml-.
	.long .LEND_vsyscall_kml-.LSTART_vsyscall_kml
	.uleb128 0
	.align 4
.LENDFDEDLSI_KML:
	.previous

#endif
