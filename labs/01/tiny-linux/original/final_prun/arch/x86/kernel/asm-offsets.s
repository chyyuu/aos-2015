	.file	"asm-offsets.c"
# GNU C (Ubuntu 4.8.2-19ubuntu1) version 4.8.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.8.2, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -nostdinc
# -I /home/child/my-linux/linux-4.0.4/arch/x86/include
# -I arch/x86/include/generated/uapi -I arch/x86/include/generated
# -I /home/child/my-linux/linux-4.0.4/include -I include
# -I /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi
# -I arch/x86/include/generated/uapi
# -I /home/child/my-linux/linux-4.0.4/include/uapi
# -I include/generated/uapi -I /home/child/my-linux/linux-4.0.4/. -I .
# -imultiarch x86_64-linux-gnu -D __KERNEL__ -D CONFIG_AS_CFI=1
# -D CONFIG_AS_CFI_SIGNAL_FRAME=1 -D CONFIG_AS_CFI_SECTIONS=1
# -D CONFIG_AS_FXSAVEQ=1 -D CONFIG_AS_SSSE3=1 -D CONFIG_AS_CRC32=1
# -D CONFIG_AS_AVX=1 -D CONFIG_AS_AVX2=1 -D CC_HAVE_ASM_GOTO
# -D KBUILD_STR(s)=#s -D KBUILD_BASENAME=KBUILD_STR(asm_offsets)
# -D KBUILD_MODNAME=KBUILD_STR(asm_offsets)
# -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include
# -include /home/child/my-linux/linux-4.0.4/include/linux/kconfig.h
# -MD arch/x86/kernel/.asm-offsets.s.d
# /home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c -m64
# -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone
# -mcmodel=kernel -maccumulate-outgoing-args -mno-sse -mno-mmx -mno-sse2
# -mno-3dnow -mno-avx -march=x86-64
# -auxbase-strip arch/x86/kernel/asm-offsets.s -Os -Wall -Wundef
# -Wstrict-prototypes -Wno-trigraphs -Werror=implicit-function-declaration
# -Wno-format-security -Wno-sign-compare -Wno-maybe-uninitialized
# -Wframe-larger-than=1024 -Wno-unused-but-set-variable
# -Wdeclaration-after-statement -Wno-pointer-sign -Werror=implicit-int
# -Werror=strict-prototypes -std=gnu90 -fno-strict-aliasing -fno-common
# -funit-at-a-time -fno-asynchronous-unwind-tables
# -fno-delete-null-pointer-checks -fno-stack-protector -fomit-frame-pointer
# -fno-var-tracking-assignments -fno-strict-overflow -fconserve-stack
# -fverbose-asm --param allow-store-data-races=0
# options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdevirtualize -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-profile -fipa-pure-const
# -fipa-reference -fipa-sra -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-register-move
# -foptimize-sibling-calls -fpartial-inlining -fpeephole -fpeephole2
# -fprefetch-loop-arrays -free -freg-struct-return -fregmove
# -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
# -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize
# -ftree-slsr -ftree-sra -ftree-switch-conversion -ftree-tail-merge
# -ftree-ter -ftree-vect-loop-version -ftree-vrp -funit-at-a-time
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64
# -maccumulate-outgoing-args -malign-stringops -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mno-fancy-math-387 -mno-red-zone -mno-sse4 -mpush-args
# -mtls-direct-seg-refs

	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
#APP
# 54 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_bx $40 offsetof(struct pt_regs, bx)	#
# 0 "" 2
# 55 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_cx $88 offsetof(struct pt_regs, cx)	#
# 0 "" 2
# 56 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_dx $96 offsetof(struct pt_regs, dx)	#
# 0 "" 2
# 57 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_sp $152 offsetof(struct pt_regs, sp)	#
# 0 "" 2
# 58 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_bp $32 offsetof(struct pt_regs, bp)	#
# 0 "" 2
# 59 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_si $104 offsetof(struct pt_regs, si)	#
# 0 "" 2
# 60 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_di $112 offsetof(struct pt_regs, di)	#
# 0 "" 2
# 61 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r8 $72 offsetof(struct pt_regs, r8)	#
# 0 "" 2
# 62 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r9 $64 offsetof(struct pt_regs, r9)	#
# 0 "" 2
# 63 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r10 $56 offsetof(struct pt_regs, r10)	#
# 0 "" 2
# 64 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r11 $48 offsetof(struct pt_regs, r11)	#
# 0 "" 2
# 65 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r12 $24 offsetof(struct pt_regs, r12)	#
# 0 "" 2
# 66 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r13 $16 offsetof(struct pt_regs, r13)	#
# 0 "" 2
# 67 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r14 $8 offsetof(struct pt_regs, r14)	#
# 0 "" 2
# 68 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_r15 $0 offsetof(struct pt_regs, r15)	#
# 0 "" 2
# 69 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->pt_regs_flags $144 offsetof(struct pt_regs, flags)	#
# 0 "" 2
# 70 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->
# 0 "" 2
# 74 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_cr0 $202 offsetof(struct saved_context, cr0)	#
# 0 "" 2
# 75 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_cr2 $210 offsetof(struct saved_context, cr2)	#
# 0 "" 2
# 76 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_cr3 $218 offsetof(struct saved_context, cr3)	#
# 0 "" 2
# 77 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_cr4 $226 offsetof(struct saved_context, cr4)	#
# 0 "" 2
# 78 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_cr8 $234 offsetof(struct saved_context, cr8)	#
# 0 "" 2
# 79 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->saved_context_gdt_desc $261 offsetof(struct saved_context, gdt_desc)	#
# 0 "" 2
# 80 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->
# 0 "" 2
# 83 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->TSS_ist $36 offsetof(struct tss_struct, x86_tss.ist)	#
# 0 "" 2
# 84 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->
# 0 "" 2
# 86 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->__NR_syscall_max $322 sizeof(syscalls_64) - 1	#
# 0 "" 2
# 87 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->NR_syscalls $323 sizeof(syscalls_64)	#
# 0 "" 2
# 89 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->__NR_ia32_syscall_max $358 sizeof(syscalls_ia32) - 1	#
# 0 "" 2
# 90 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets_64.c" 1
	
->IA32_NR_syscalls $359 sizeof(syscalls_ia32)	#
# 0 "" 2
#NO_APP
	xorl	%eax, %eax	#
	ret
	.size	main, .-main
	.text
	.globl	common
	.type	common, @function
common:
#APP
# 31 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->
# 0 "" 2
# 32 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->TI_flags $16 offsetof(struct thread_info, flags)	#
# 0 "" 2
# 33 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->TI_status $20 offsetof(struct thread_info, status)	#
# 0 "" 2
# 34 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->TI_addr_limit $32 offsetof(struct thread_info, addr_limit)	#
# 0 "" 2
# 36 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->
# 0 "" 2
# 37 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->crypto_tfm_ctx_offset $88 offsetof(struct crypto_tfm, __crt_ctx)	#
# 0 "" 2
# 39 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->
# 0 "" 2
# 40 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->pbe_address $0 offsetof(struct pbe, address)	#
# 0 "" 2
# 41 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->pbe_orig_address $8 offsetof(struct pbe, orig_address)	#
# 0 "" 2
# 42 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->pbe_next $16 offsetof(struct pbe, next)	#
# 0 "" 2
# 63 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->
# 0 "" 2
# 64 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_scratch $484 offsetof(struct boot_params, scratch)	#
# 0 "" 2
# 65 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_loadflags $529 offsetof(struct boot_params, hdr.loadflags)	#
# 0 "" 2
# 66 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_hardware_subarch $572 offsetof(struct boot_params, hdr.hardware_subarch)	#
# 0 "" 2
# 67 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_version $518 offsetof(struct boot_params, hdr.version)	#
# 0 "" 2
# 68 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_kernel_alignment $560 offsetof(struct boot_params, hdr.kernel_alignment)	#
# 0 "" 2
# 69 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_pref_address $600 offsetof(struct boot_params, hdr.pref_address)	#
# 0 "" 2
# 70 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->BP_code32_start $532 offsetof(struct boot_params, hdr.code32_start)	#
# 0 "" 2
# 72 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->
# 0 "" 2
# 73 "/home/child/my-linux/linux-4.0.4/arch/x86/kernel/asm-offsets.c" 1
	
->PTREGS_SIZE $168 sizeof(struct pt_regs)	#
# 0 "" 2
#NO_APP
	ret
	.size	common, .-common
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
