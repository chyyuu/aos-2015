cmd_arch/x86/vdso/vdso32/note.o := gcc -Wp,-MD,arch/x86/vdso/vdso32/.note.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__  -D__ASSEMBLY__ -m32 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1         -c -o arch/x86/vdso/vdso32/note.o arch/x86/vdso/vdso32/note.S

source_arch/x86/vdso/vdso32/note.o := arch/x86/vdso/vdso32/note.S

deps_arch/x86/vdso/vdso32/note.o := \
    $(wildcard include/config/xen.h) \
  include/generated/uapi/linux/version.h \
  include/linux/elfnote.h \

arch/x86/vdso/vdso32/note.o: $(deps_arch/x86/vdso/vdso32/note.o)

$(deps_arch/x86/vdso/vdso32/note.o):
