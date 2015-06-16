cmd_arch/x86/boot/compressed/misc.o := gcc -Wp,-MD,arch/x86/boot/compressed/.misc.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-patched/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-patched/include -Iinclude -I/home/child/my-linux/linux-patched/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-patched/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-patched/include/linux/kconfig.h  -I/home/child/my-linux/linux-patched/arch/x86/boot/compressed -Iarch/x86/boot/compressed -D__KERNEL__ -m64 -D__KERNEL__ -O2 -fno-strict-aliasing -fPIC -DDISABLE_BRANCH_PROFILING -mcmodel=small -mno-mmx -mno-sse -ffreestanding -fno-stack-protector    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(misc)"  -D"KBUILD_MODNAME=KBUILD_STR(misc)" -c -o arch/x86/boot/compressed/misc.o /home/child/my-linux/linux-patched/arch/x86/boot/compressed/misc.c

source_arch/x86/boot/compressed/misc.o := /home/child/my-linux/linux-patched/arch/x86/boot/compressed/misc.c

deps_arch/x86/boot/compressed/misc.o := \
    $(wildcard include/config/kernel/gzip.h) \
    $(wildcard include/config/kernel/bzip2.h) \
    $(wildcard include/config/kernel/lzma.h) \
    $(wildcard include/config/kernel/xz.h) \
    $(wildcard include/config/kernel/lzo.h) \
    $(wildcard include/config/kernel/lz4.h) \
    $(wildcard include/config/x86/need/relocs.h) \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/relocatable.h) \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/misc.h \
    $(wildcard include/config/paravirt.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/x86/verbose/bootup.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/randomize/base.h) \
  /home/child/my-linux/linux-patched/include/linux/linkage.h \
  /home/child/my-linux/linux-patched/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/64bit.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/child/my-linux/linux-patched/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/child/my-linux/linux-patched/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/types.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/types.h \
  /home/child/my-linux/linux-patched/include/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/int-ll64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/child/my-linux/linux-patched/include/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/bitsperlong.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/posix_types.h \
  /home/child/my-linux/linux-patched/include/linux/stddef.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/stddef.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/posix_types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/posix_types_64.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/posix_types.h \
  /home/child/my-linux/linux-patched/include/linux/stringify.h \
  /home/child/my-linux/linux-patched/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-patched/include/linux/screen_info.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/screen_info.h \
  /home/child/my-linux/linux-patched/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/child/my-linux/linux-patched/include/linux/elf.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/elf.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/x86/x32/abi.h) \
    $(wildcard include/config/kernel/mode/linux.h) \
    $(wildcard include/config/ia32/emulation.h) \
  /home/child/my-linux/linux-patched/include/linux/thread_info.h \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/child/my-linux/linux-patched/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/smp.h) \
  /home/child/my-linux/linux-patched/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /home/child/my-linux/linux-patched/include/linux/bitops.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/alternative.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/asm.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/x86/debugctlmsr.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/segment.h \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/x86/32/lazy/gs.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/const.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/randomize/base/max/offset.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ptrace.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ptrace-abi.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/processor-flags.h \
  /home/child/my-linux/linux-patched/include/asm-generic/ptrace.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/x86/feature/names.h) \
    $(wildcard include/config/x86/debug/static/cpu/has.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
    $(wildcard include/config/matom.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/rmwcc.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/barrier.h \
    $(wildcard include/config/x86/ppro/fence.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/bitops/sched.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/arch_hweight.h \
  /home/child/my-linux/linux-patched/include/asm-generic/bitops/const_hweight.h \
  /home/child/my-linux/linux-patched/include/asm-generic/bitops/le.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/byteorder.h \
  /home/child/my-linux/linux-patched/include/linux/byteorder/little_endian.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/byteorder/little_endian.h \
  /home/child/my-linux/linux-patched/include/linux/swab.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/swab.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/swab.h \
  /home/child/my-linux/linux-patched/include/linux/byteorder/generic.h \
  /home/child/my-linux/linux-patched/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/child/my-linux/linux-patched/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/child/my-linux/linux-patched/include/linux/typecheck.h \
  /home/child/my-linux/linux-patched/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/child/my-linux/linux-patched/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
  /home/child/my-linux/linux-patched/include/linux/kern_levels.h \
  /home/child/my-linux/linux-patched/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/kernel.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/sysinfo.h \
  /home/child/my-linux/linux-patched/include/linux/dynamic_debug.h \
  /home/child/my-linux/linux-patched/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/string.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/string.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/kmemcheck.h) \
  /home/child/my-linux/linux-patched/include/linux/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/errno.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno-base.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/thread_info.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/x86/vsyscall/emulation.h) \
  /home/child/my-linux/linux-patched/include/linux/range.h \
  /home/child/my-linux/linux-patched/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/getorder.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/percpu.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/child/my-linux/linux-patched/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/child/my-linux/linux-patched/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/processor.h \
    $(wildcard include/config/m486.h) \
    $(wildcard include/config/xen.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/vm86.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/vm86.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/math_emu.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/sigcontext.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/sigcontext.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/current.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/proc/fs.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pgtable_64_types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/sparsemem.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/msr.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/msr.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/msr-index.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/ioctl.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ioctl.h \
  /home/child/my-linux/linux-patched/include/asm-generic/ioctl.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/ioctl.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cpumask.h \
  /home/child/my-linux/linux-patched/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/child/my-linux/linux-patched/include/linux/bitmap.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/desc_defs.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/special_insns.h \
  /home/child/my-linux/linux-patched/include/linux/personality.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/personality.h \
  /home/child/my-linux/linux-patched/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/div64.h \
  /home/child/my-linux/linux-patched/include/asm-generic/div64.h \
  /home/child/my-linux/linux-patched/include/linux/err.h \
  /home/child/my-linux/linux-patched/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/child/my-linux/linux-patched/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/atomic.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cmpxchg.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cmpxchg_64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/atomic64_64.h \
  /home/child/my-linux/linux-patched/include/asm-generic/atomic-long.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/user.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/user_64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/auxvec.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/vdso.h \
    $(wildcard include/config/x86/x32.h) \
  /home/child/my-linux/linux-patched/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/compaction.h) \
  /home/child/my-linux/linux-patched/include/linux/auxvec.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/auxvec.h \
  /home/child/my-linux/linux-patched/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/child/my-linux/linux-patched/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/child/my-linux/linux-patched/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
  /home/child/my-linux/linux-patched/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/preempt.h \
  /home/child/my-linux/linux-patched/include/linux/bottom_half.h \
  /home/child/my-linux/linux-patched/include/linux/preempt_mask.h \
  /home/child/my-linux/linux-patched/include/linux/spinlock_types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/spinlock_types.h \
    $(wildcard include/config/paravirt/spinlocks.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/qrwlock_types.h \
  /home/child/my-linux/linux-patched/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/child/my-linux/linux-patched/include/linux/rwlock_types.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/spinlock.h \
  /home/child/my-linux/linux-patched/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/paravirt.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/qrwlock.h \
  /home/child/my-linux/linux-patched/include/asm-generic/qrwlock.h \
  /home/child/my-linux/linux-patched/include/linux/rwlock.h \
  /home/child/my-linux/linux-patched/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /home/child/my-linux/linux-patched/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/child/my-linux/linux-patched/include/linux/rbtree.h \
  /home/child/my-linux/linux-patched/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/child/my-linux/linux-patched/include/linux/osq_lock.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/rwsem.h \
  /home/child/my-linux/linux-patched/include/linux/completion.h \
  /home/child/my-linux/linux-patched/include/linux/wait.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/wait.h \
  /home/child/my-linux/linux-patched/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/child/my-linux/linux-patched/include/linux/page-flags-layout.h \
  /home/child/my-linux/linux-patched/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/generated/bounds.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmu.h \
  /home/child/my-linux/linux-patched/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/elf.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/elf-em.h \
  /home/child/my-linux/linux-patched/include/linux/io.h \
    $(wildcard include/config/has/ioport/map.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/io.h \
    $(wildcard include/config/mtrr.h) \
  arch/x86/include/generated/asm/early_ioremap.h \
  /home/child/my-linux/linux-patched/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/iomap.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/generic/iomap.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/child/my-linux/linux-patched/include/linux/vmalloc.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/boot.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/boot.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/bootparam.h \
  /home/child/my-linux/linux-patched/include/linux/apm_bios.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/apm_bios.h \
  /home/child/my-linux/linux-patched/include/linux/edd.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/edd.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/e820.h \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memtest.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/e820.h \
    $(wildcard include/config/intel/txt.h) \
  /home/child/my-linux/linux-patched/include/linux/ioport.h \
    $(wildcard include/config/memory/hotremove.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ist.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ist.h \
  /home/child/my-linux/linux-patched/include/video/edid.h \
    $(wildcard include/config/x86.h) \
  /home/child/my-linux/linux-patched/include/uapi/video/edid.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bootparam_utils.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../ctype.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../string.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/decompress_inflate.c \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inftrees.c \
  /home/child/my-linux/linux-patched/include/linux/zutil.h \
  /home/child/my-linux/linux-patched/include/linux/zlib.h \
  /home/child/my-linux/linux-patched/include/linux/zconf.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inftrees.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inffast.c \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inflate.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inffast.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inflate.c \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/infutil.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/compressed/../../../../lib/zlib_inflate/inffixed.h \
  /home/child/my-linux/linux-patched/include/linux/decompress/mm.h \

arch/x86/boot/compressed/misc.o: $(deps_arch/x86/boot/compressed/misc.o)

$(deps_arch/x86/boot/compressed/misc.o):
