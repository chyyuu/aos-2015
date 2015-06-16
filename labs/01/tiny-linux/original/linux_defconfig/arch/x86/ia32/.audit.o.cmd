cmd_arch/x86/ia32/audit.o := gcc -Wp,-MD,arch/x86/ia32/.audit.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-4.0.4/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-4.0.4/include -Iinclude -I/home/child/my-linux/linux-4.0.4/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-4.0.4/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-4.0.4/include/linux/kconfig.h  -I/home/child/my-linux/linux-4.0.4/arch/x86/ia32 -Iarch/x86/ia32 -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(audit)"  -D"KBUILD_MODNAME=KBUILD_STR(audit)" -c -o arch/x86/ia32/audit.o /home/child/my-linux/linux-4.0.4/arch/x86/ia32/audit.c

source_arch/x86/ia32/audit.o := /home/child/my-linux/linux-4.0.4/arch/x86/ia32/audit.c

deps_arch/x86/ia32/audit.o := \
  arch/x86/include/generated/uapi/asm/unistd_32.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/audit_dir_write.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/audit_change_attr.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/audit_write.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/audit_read.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/audit_signal.h \

arch/x86/ia32/audit.o: $(deps_arch/x86/ia32/audit.o)

$(deps_arch/x86/ia32/audit.o):
