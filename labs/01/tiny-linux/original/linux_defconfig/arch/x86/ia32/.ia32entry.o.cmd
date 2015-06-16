cmd_arch/x86/ia32/ia32entry.o := gcc -Wp,-MD,arch/x86/ia32/.ia32entry.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-4.0.4/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-4.0.4/include -Iinclude -I/home/child/my-linux/linux-4.0.4/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-4.0.4/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-4.0.4/include/linux/kconfig.h -D__KERNEL__ -D__ASSEMBLY__ -m64 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1   -c -o arch/x86/ia32/ia32entry.o /home/child/my-linux/linux-4.0.4/arch/x86/ia32/ia32entry.S

source_arch/x86/ia32/ia32entry.o := /home/child/my-linux/linux-4.0.4/arch/x86/ia32/ia32entry.S

deps_arch/x86/ia32/ia32entry.o := \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/paravirt.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/dwarf2.h \
    $(wildcard include/config/as/cfi.h) \
    $(wildcard include/config/as/cfi/signal/frame.h) \
    $(wildcard include/config/as/cfi/sections.h) \
    $(wildcard include/config/x86/64.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/calling.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/current.h \
  /home/child/my-linux/linux-4.0.4/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/64bit.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/x86/64/smp.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/errno.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/errno.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/errno-base.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/ia32_unistd.h \
  arch/x86/include/generated/asm/unistd_32_ia32.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/ia32/emulation.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page.h \
  /home/child/my-linux/linux-4.0.4/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/types.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/types.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/types.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/const.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/randomize/base.h) \
    $(wildcard include/config/randomize/base/max/offset.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/x86/vsyscall/emulation.h) \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/getorder.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/segment.h \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/x86/32/lazy/gs.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/linkage.h \
  /home/child/my-linux/linux-4.0.4/include/linux/stringify.h \
  /home/child/my-linux/linux-4.0.4/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/processor-flags.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/asm.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/smap.h \
    $(wildcard include/config/x86/smap.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
    $(wildcard include/config/x86/p6/nop.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/x86/feature/names.h) \
    $(wildcard include/config/x86/debug/static/cpu/has.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/x86/cmov.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/matom.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/alternative-asm.h \
  /home/child/my-linux/linux-4.0.4/include/linux/err.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/elf-em.h \

arch/x86/ia32/ia32entry.o: $(deps_arch/x86/ia32/ia32entry.o)

$(deps_arch/x86/ia32/ia32entry.o):
