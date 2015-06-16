cmd_lib/decompress.o := gcc -Wp,-MD,lib/.decompress.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-4.0.4/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-4.0.4/include -Iinclude -I/home/child/my-linux/linux-4.0.4/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-4.0.4/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-4.0.4/include/linux/kconfig.h  -I/home/child/my-linux/linux-4.0.4/lib -Ilib -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(decompress)"  -D"KBUILD_MODNAME=KBUILD_STR(decompress)" -c -o lib/decompress.o /home/child/my-linux/linux-4.0.4/lib/decompress.c

source_lib/decompress.o := /home/child/my-linux/linux-4.0.4/lib/decompress.c

deps_lib/decompress.o := \
    $(wildcard include/config/decompress/gzip.h) \
    $(wildcard include/config/decompress/bzip2.h) \
    $(wildcard include/config/decompress/lzma.h) \
    $(wildcard include/config/decompress/xz.h) \
    $(wildcard include/config/decompress/lzo.h) \
    $(wildcard include/config/decompress/lz4.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/generic.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/bunzip2.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/unlzma.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/unxz.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/inflate.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/unlzo.h \
  /home/child/my-linux/linux-4.0.4/include/linux/decompress/unlz4.h \
  /home/child/my-linux/linux-4.0.4/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/types.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/types.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/types.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/posix_types.h \
  /home/child/my-linux/linux-4.0.4/include/linux/stddef.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/stddef.h \
  /home/child/my-linux/linux-4.0.4/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/posix_types_64.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/posix_types.h \
  /home/child/my-linux/linux-4.0.4/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/string.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/string.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/kasan.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
    $(wildcard include/config/modules.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/kern_levels.h \
  /home/child/my-linux/linux-4.0.4/include/linux/linkage.h \
  /home/child/my-linux/linux-4.0.4/include/linux/stringify.h \
  /home/child/my-linux/linux-4.0.4/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/cache.h \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/kernel.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/sysinfo.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/dynamic_debug.h \
  /home/child/my-linux/linux-4.0.4/include/linux/errno.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/errno.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/errno.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/errno.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/errno-base.h \

lib/decompress.o: $(deps_lib/decompress.o)

$(deps_lib/decompress.o):
