cmd_arch/x86/vdso/vdso.lds := gcc -E -Wp,-MD,arch/x86/vdso/.vdso.lds.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-patched/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-patched/include -Iinclude -I/home/child/my-linux/linux-patched/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-patched/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-patched/include/linux/kconfig.h -D__KERNEL__ -P -C -P -C -Ux86 -D__ASSEMBLY__ -DLINKER_SCRIPT -o arch/x86/vdso/vdso.lds /home/child/my-linux/linux-patched/arch/x86/vdso/vdso.lds.S

source_arch/x86/vdso/vdso.lds := /home/child/my-linux/linux-patched/arch/x86/vdso/vdso.lds.S

deps_arch/x86/vdso/vdso.lds := \
  /home/child/my-linux/linux-patched/arch/x86/vdso/vdso-layout.lds.S \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/vdso.h \
    $(wildcard include/config/kernel/mode/linux.h) \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/x32.h) \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/compat.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/const.h \
  /home/child/my-linux/linux-patched/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/types.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/types.h \
  /home/child/my-linux/linux-patched/include/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/child/my-linux/linux-patched/include/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/randomize/base.h) \
    $(wildcard include/config/randomize/base/max/offset.h) \
  /home/child/my-linux/linux-patched/include/linux/linkage.h \
  /home/child/my-linux/linux-patched/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/child/my-linux/linux-patched/include/linux/stringify.h \
  /home/child/my-linux/linux-patched/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-patched/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/vvar.h \

arch/x86/vdso/vdso.lds: $(deps_arch/x86/vdso/vdso.lds)

$(deps_arch/x86/vdso/vdso.lds):
