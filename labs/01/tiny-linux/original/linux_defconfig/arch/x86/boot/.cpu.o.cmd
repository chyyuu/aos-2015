cmd_arch/x86/boot/cpu.o := gcc -Wp,-MD,arch/x86/boot/.cpu.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-4.0.4/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-4.0.4/include -Iinclude -I/home/child/my-linux/linux-4.0.4/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-4.0.4/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-4.0.4/include/linux/kconfig.h  -I/home/child/my-linux/linux-4.0.4/arch/x86/boot -Iarch/x86/boot -D__KERNEL__ -m32 -Wa,/home/child/my-linux/linux-4.0.4/arch/x86/boot/code16gcc.h -g -Os -D__KERNEL__ -DDISABLE_BRANCH_PROFILING -Wall -Wstrict-prototypes -march=i386 -mregparm=3 -fno-strict-aliasing -fomit-frame-pointer -fno-pic -mno-mmx -mno-sse -ffreestanding -fno-stack-protector -D_SETUP    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(cpu)"  -D"KBUILD_MODNAME=KBUILD_STR(cpu)" -c -o arch/x86/boot/cpu.o /home/child/my-linux/linux-4.0.4/arch/x86/boot/cpu.c

source_arch/x86/boot/cpu.o := /home/child/my-linux/linux-4.0.4/arch/x86/boot/cpu.c

deps_arch/x86/boot/cpu.o := \
    $(wildcard include/config/x86/feature/names.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/boot/boot.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
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
  /home/child/my-linux/linux-4.0.4/include/linux/edd.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/edd.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/boot.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/kernel/bzip2.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/proc/fs.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/const.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page_types.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/randomize/base.h) \
    $(wildcard include/config/randomize/base/max/offset.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/pgtable_64_types.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/sparsemem.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/boot.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/setup.h \
    $(wildcard include/config/x86/intel/mid.h) \
    $(wildcard include/config/x86/intel/ce.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/setup.h \
  /home/child/my-linux/linux-4.0.4/include/linux/linkage.h \
  /home/child/my-linux/linux-4.0.4/include/linux/stringify.h \
  /home/child/my-linux/linux-4.0.4/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/pfn.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/bootparam.h \
  /home/child/my-linux/linux-4.0.4/include/linux/screen_info.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/screen_info.h \
  /home/child/my-linux/linux-4.0.4/include/linux/apm_bios.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/apm_bios.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/linux/ioctl.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/ioctl.h \
  /home/child/my-linux/linux-4.0.4/include/asm-generic/ioctl.h \
  /home/child/my-linux/linux-4.0.4/include/uapi/asm-generic/ioctl.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/e820.h \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memtest.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/e820.h \
    $(wildcard include/config/intel/txt.h) \
  /home/child/my-linux/linux-4.0.4/include/linux/ioport.h \
    $(wildcard include/config/memory/hotremove.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/ist.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/ist.h \
  /home/child/my-linux/linux-4.0.4/include/video/edid.h \
    $(wildcard include/config/x86.h) \
  /home/child/my-linux/linux-4.0.4/include/uapi/video/edid.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/x86_init.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/boot/bitops.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/boot/ctype.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/boot/cpuflags.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/x86/debug/static/cpu/has.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/cmov.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
    $(wildcard include/config/matom.h) \
    $(wildcard include/config/paravirt.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/asm.h \
  /home/child/my-linux/linux-4.0.4/include/linux/bitops.h \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /home/child/my-linux/linux-4.0.4/arch/x86/include/uapi/asm/processor-flags.h \
  arch/x86/boot/cpustr.h \

arch/x86/boot/cpu.o: $(deps_arch/x86/boot/cpu.o)

$(deps_arch/x86/boot/cpu.o):
