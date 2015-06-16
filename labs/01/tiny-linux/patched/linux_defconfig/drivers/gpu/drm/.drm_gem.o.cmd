cmd_drivers/gpu/drm/drm_gem.o := gcc -Wp,-MD,drivers/gpu/drm/.drm_gem.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-patched/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-patched/include -Iinclude -I/home/child/my-linux/linux-patched/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-patched/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-patched/include/linux/kconfig.h  -I/home/child/my-linux/linux-patched/drivers/gpu/drm -Idrivers/gpu/drm -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO  -I/home/child/my-linux/linux-patched/include/drm -Iinclude/drm    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(drm_gem)"  -D"KBUILD_MODNAME=KBUILD_STR(drm)" -c -o drivers/gpu/drm/drm_gem.o /home/child/my-linux/linux-patched/drivers/gpu/drm/drm_gem.c

source_drivers/gpu/drm/drm_gem.o := /home/child/my-linux/linux-patched/drivers/gpu/drm/drm_gem.c

deps_drivers/gpu/drm/drm_gem.o := \
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
  /home/child/my-linux/linux-patched/include/uapi/linux/posix_types.h \
  /home/child/my-linux/linux-patched/include/linux/stddef.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/stddef.h \
  /home/child/my-linux/linux-patched/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/child/my-linux/linux-patched/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/child/my-linux/linux-patched/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/posix_types_64.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/posix_types.h \
  /home/child/my-linux/linux-patched/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/tracing.h) \
  /home/child/my-linux/linux-patched/include/linux/gfp.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/cma.h) \
  /home/child/my-linux/linux-patched/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/child/my-linux/linux-patched/include/linux/stringify.h \
  /home/child/my-linux/linux-patched/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/child/my-linux/linux-patched/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/child/my-linux/linux-patched/include/linux/typecheck.h \
  /home/child/my-linux/linux-patched/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/child/my-linux/linux-patched/include/linux/linkage.h \
  /home/child/my-linux/linux-patched/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-patched/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/child/my-linux/linux-patched/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/const.h \
  /home/child/my-linux/linux-patched/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /home/child/my-linux/linux-patched/include/linux/bitops.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/paravirt.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/asm.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/x86/debugctlmsr.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/segment.h \
    $(wildcard include/config/kernel/mode/linux.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/x86/32/lazy/gs.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/randomize/base.h) \
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
  /home/child/my-linux/linux-patched/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
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
  /home/child/my-linux/linux-patched/include/linux/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/errno.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno-base.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/preempt.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/child/my-linux/linux-patched/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/child/my-linux/linux-patched/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/child/my-linux/linux-patched/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/child/my-linux/linux-patched/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/ia32/emulation.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/x86/vsyscall/emulation.h) \
  /home/child/my-linux/linux-patched/include/linux/range.h \
  /home/child/my-linux/linux-patched/include/asm-generic/memory_model.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/getorder.h \
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
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/irqflags.h \
  /home/child/my-linux/linux-patched/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/atomic.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cmpxchg.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cmpxchg_64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/atomic64_64.h \
  /home/child/my-linux/linux-patched/include/asm-generic/atomic-long.h \
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
  /home/child/my-linux/linux-patched/include/linux/wait.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/wait.h \
  /home/child/my-linux/linux-patched/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/child/my-linux/linux-patched/include/linux/seqlock.h \
  /home/child/my-linux/linux-patched/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/child/my-linux/linux-patched/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/child/my-linux/linux-patched/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/child/my-linux/linux-patched/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/child/my-linux/linux-patched/include/linux/notifier.h \
  /home/child/my-linux/linux-patched/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/child/my-linux/linux-patched/include/linux/osq_lock.h \
  /home/child/my-linux/linux-patched/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/rwsem.h \
  /home/child/my-linux/linux-patched/include/linux/srcu.h \
  /home/child/my-linux/linux-patched/include/linux/rcupdate.h \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/rcu/nocb/cpu/all.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /home/child/my-linux/linux-patched/include/linux/completion.h \
  /home/child/my-linux/linux-patched/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  /home/child/my-linux/linux-patched/include/linux/rcutree.h \
  /home/child/my-linux/linux-patched/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
  /home/child/my-linux/linux-patched/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/child/my-linux/linux-patched/include/linux/ktime.h \
  /home/child/my-linux/linux-patched/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/child/my-linux/linux-patched/include/linux/time64.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/time.h \
  /home/child/my-linux/linux-patched/include/linux/jiffies.h \
  /home/child/my-linux/linux-patched/include/linux/timex.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/timex.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/param.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/param.h \
  /home/child/my-linux/linux-patched/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/param.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/timex.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/tsc.h \
    $(wildcard include/config/x86/tsc.h) \
  /home/child/my-linux/linux-patched/include/linux/timekeeping.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmzone.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmzone_64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/smp.h \
    $(wildcard include/config/x86/local/apic.h) \
    $(wildcard include/config/x86/io/apic.h) \
    $(wildcard include/config/x86/32/smp.h) \
    $(wildcard include/config/debug/nmi/selftest.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/eisa.h) \
    $(wildcard include/config/x86/mpparse.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mpspec_def.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/x86_init.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/bootparam.h \
  /home/child/my-linux/linux-patched/include/linux/screen_info.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/screen_info.h \
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
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ist.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ist.h \
  /home/child/my-linux/linux-patched/include/video/edid.h \
    $(wildcard include/config/x86.h) \
  /home/child/my-linux/linux-patched/include/uapi/video/edid.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/apicdef.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/apic.h \
    $(wildcard include/config/x86/x2apic.h) \
  /home/child/my-linux/linux-patched/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/paravirt/clock.h) \
    $(wildcard include/config/provide/ohci1394/dma/init.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/x86/intel/mid.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/acpi.h \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/acpi/numa.h) \
  /home/child/my-linux/linux-patched/include/acpi/pdc_intel.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/numa.h \
    $(wildcard include/config/numa/emu.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/topology.h \
    $(wildcard include/config/x86/ht.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/topology.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmu.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/realmode.h \
    $(wildcard include/config/acpi/sleep.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/io.h \
    $(wildcard include/config/mtrr.h) \
  arch/x86/include/generated/asm/early_ioremap.h \
  /home/child/my-linux/linux-patched/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/iomap.h \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/generic/iomap.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/child/my-linux/linux-patched/include/linux/vmalloc.h \
  /home/child/my-linux/linux-patched/include/linux/rbtree.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pvclock.h \
  /home/child/my-linux/linux-patched/include/linux/clocksource.h \
    $(wildcard include/config/arch/clocksource/data.h) \
    $(wildcard include/config/clocksource/watchdog.h) \
    $(wildcard include/config/clksrc/of.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/clocksource.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pvclock-abi.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/vsyscall.h \
  /home/child/my-linux/linux-patched/include/asm-generic/fixmap.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/idle.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/io_apic.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/irq_vectors.h \
    $(wildcard include/config/have/kvm.h) \
  /home/child/my-linux/linux-patched/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/child/my-linux/linux-patched/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/child/my-linux/linux-patched/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/child/my-linux/linux-patched/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/child/my-linux/linux-patched/include/linux/pfn.h \
  /home/child/my-linux/linux-patched/include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /home/child/my-linux/linux-patched/include/linux/kasan.h \
    $(wildcard include/config/kasan/shadow/offset.h) \
  /home/child/my-linux/linux-patched/include/linux/mm.h \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/child/my-linux/linux-patched/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/child/my-linux/linux-patched/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /home/child/my-linux/linux-patched/include/linux/auxvec.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/auxvec.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/auxvec.h \
  /home/child/my-linux/linux-patched/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/child/my-linux/linux-patched/include/linux/bit_spinlock.h \
  /home/child/my-linux/linux-patched/include/linux/shrinker.h \
  /home/child/my-linux/linux-patched/include/linux/resource.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/resource.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/resource.h \
  /home/child/my-linux/linux-patched/include/asm-generic/resource.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/resource.h \
  /home/child/my-linux/linux-patched/include/linux/page_ext.h \
    $(wildcard include/config/page/owner.h) \
  /home/child/my-linux/linux-patched/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/have/arch/soft/dirty.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pgtable_64.h \
  /home/child/my-linux/linux-patched/include/asm-generic/pgtable.h \
  /home/child/my-linux/linux-patched/include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
  /home/child/my-linux/linux-patched/include/linux/huge_mm.h \
  /home/child/my-linux/linux-patched/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/child/my-linux/linux-patched/include/linux/vm_event_item.h \
    $(wildcard include/config/migration.h) \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/child/my-linux/linux-patched/include/linux/uaccess.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/x86/intel/usercopy.h) \
    $(wildcard include/config/debug/strict/user/copy/checks.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/smap.h \
    $(wildcard include/config/x86/smap.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/uaccess_64.h \
  /home/child/my-linux/linux-patched/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/block.h) \
  /home/child/my-linux/linux-patched/include/linux/kdev_t.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/kdev_t.h \
  /home/child/my-linux/linux-patched/include/linux/dcache.h \
  /home/child/my-linux/linux-patched/include/linux/rculist.h \
  /home/child/my-linux/linux-patched/include/linux/rculist_bl.h \
  /home/child/my-linux/linux-patched/include/linux/list_bl.h \
  /home/child/my-linux/linux-patched/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/child/my-linux/linux-patched/include/linux/path.h \
  /home/child/my-linux/linux-patched/include/linux/stat.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/stat.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/stat.h \
  /home/child/my-linux/linux-patched/include/linux/uidgid.h \
    $(wildcard include/config/user/ns.h) \
  /home/child/my-linux/linux-patched/include/linux/highuid.h \
  /home/child/my-linux/linux-patched/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /home/child/my-linux/linux-patched/include/linux/radix-tree.h \
  /home/child/my-linux/linux-patched/include/linux/pid.h \
  /home/child/my-linux/linux-patched/include/linux/capability.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/capability.h \
  /home/child/my-linux/linux-patched/include/linux/semaphore.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/fiemap.h \
  /home/child/my-linux/linux-patched/include/linux/migrate_mode.h \
  /home/child/my-linux/linux-patched/include/linux/percpu-rwsem.h \
  /home/child/my-linux/linux-patched/include/linux/blk_types.h \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/fs.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/limits.h \
  /home/child/my-linux/linux-patched/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/child/my-linux/linux-patched/include/linux/percpu_counter.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/dqblk_xfs.h \
  /home/child/my-linux/linux-patched/include/linux/dqblk_v1.h \
  /home/child/my-linux/linux-patched/include/linux/dqblk_v2.h \
  /home/child/my-linux/linux-patched/include/linux/dqblk_qtree.h \
  /home/child/my-linux/linux-patched/include/linux/projid.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/quota.h \
  /home/child/my-linux/linux-patched/include/linux/nfs_fs_i.h \
  /home/child/my-linux/linux-patched/include/linux/fcntl.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/fcntl.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/fcntl.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/fcntl.h \
  /home/child/my-linux/linux-patched/include/linux/file.h \
  /home/child/my-linux/linux-patched/include/linux/module.h \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/child/my-linux/linux-patched/include/linux/kmod.h \
  /home/child/my-linux/linux-patched/include/linux/sysctl.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/sysctl.h \
  /home/child/my-linux/linux-patched/include/linux/elf.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/elf.h \
    $(wildcard include/config/x86/x32/abi.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/user.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/user_64.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/vdso.h \
    $(wildcard include/config/x86/x32.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/elf.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/elf-em.h \
  /home/child/my-linux/linux-patched/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/child/my-linux/linux-patched/include/linux/sysfs.h \
  /home/child/my-linux/linux-patched/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/child/my-linux/linux-patched/include/linux/idr.h \
  /home/child/my-linux/linux-patched/include/linux/kobject_ns.h \
  /home/child/my-linux/linux-patched/include/linux/kref.h \
  /home/child/my-linux/linux-patched/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ppc64.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/module.h \
    $(wildcard include/config/m586.h) \
    $(wildcard include/config/m586tsc.h) \
    $(wildcard include/config/m586mmx.h) \
    $(wildcard include/config/mcore2.h) \
    $(wildcard include/config/m686.h) \
    $(wildcard include/config/mpentiumii.h) \
    $(wildcard include/config/mpentiumiii.h) \
    $(wildcard include/config/mpentiumm.h) \
    $(wildcard include/config/mpentium4.h) \
    $(wildcard include/config/mk6.h) \
    $(wildcard include/config/mk8.h) \
    $(wildcard include/config/melan.h) \
    $(wildcard include/config/mcrusoe.h) \
    $(wildcard include/config/mefficeon.h) \
    $(wildcard include/config/mwinchipc6.h) \
    $(wildcard include/config/mwinchip3d.h) \
    $(wildcard include/config/mcyrixiii.h) \
    $(wildcard include/config/mviac3/2.h) \
    $(wildcard include/config/mviac7.h) \
    $(wildcard include/config/mgeodegx1.h) \
    $(wildcard include/config/mgeode/lx.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/child/my-linux/linux-patched/include/linux/mman.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/mman.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/mman.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/mman.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/mman-common.h \
    $(wildcard include/config/mmap/allow/uninitialized.h) \
  /home/child/my-linux/linux-patched/include/linux/pagemap.h \
  /home/child/my-linux/linux-patched/include/linux/highmem.h \
    $(wildcard include/config/debug/highmem.h) \
  /home/child/my-linux/linux-patched/include/linux/hardirq.h \
  /home/child/my-linux/linux-patched/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /home/child/my-linux/linux-patched/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/child/my-linux/linux-patched/include/linux/context_tracking_state.h \
  /home/child/my-linux/linux-patched/include/linux/static_key.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/hardirq.h \
    $(wildcard include/config/x86/thermal/vector.h) \
    $(wildcard include/config/x86/mce/threshold.h) \
    $(wildcard include/config/hyperv.h) \
  /home/child/my-linux/linux-patched/include/linux/irq.h \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
  /home/child/my-linux/linux-patched/include/linux/irqhandler.h \
  /home/child/my-linux/linux-patched/include/linux/irqreturn.h \
  /home/child/my-linux/linux-patched/include/linux/irqnr.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/irqnr.h \
  /home/child/my-linux/linux-patched/include/linux/io.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/irq.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/irq_regs.h \
  /home/child/my-linux/linux-patched/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/handle/domain/irq.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/hw_irq.h \
    $(wildcard include/config/irq/remap.h) \
  /home/child/my-linux/linux-patched/include/linux/profile.h \
    $(wildcard include/config/profiling.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/sections.h \
    $(wildcard include/config/debug/rodata.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/sections.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/cacheflush.h \
    $(wildcard include/config/debug/rodata/test.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/cacheflush.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/kmap_types.h \
  /home/child/my-linux/linux-patched/include/asm-generic/kmap_types.h \
  /home/child/my-linux/linux-patched/include/linux/hugetlb_inline.h \
  /home/child/my-linux/linux-patched/include/linux/shmem_fs.h \
    $(wildcard include/config/tmpfs.h) \
  /home/child/my-linux/linux-patched/include/linux/swap.h \
    $(wildcard include/config/frontswap.h) \
    $(wildcard include/config/memcg/swap.h) \
  /home/child/my-linux/linux-patched/include/linux/memcontrol.h \
    $(wildcard include/config/inet.h) \
  /home/child/my-linux/linux-patched/include/linux/cgroup.h \
    $(wildcard include/config/cgroups.h) \
  /home/child/my-linux/linux-patched/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/no/hz/common.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/no/hz/full.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/sched.h \
  /home/child/my-linux/linux-patched/include/linux/sched/prio.h \
  /home/child/my-linux/linux-patched/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/child/my-linux/linux-patched/include/linux/cputime.h \
  arch/x86/include/generated/asm/cputime.h \
  /home/child/my-linux/linux-patched/include/asm-generic/cputime.h \
  /home/child/my-linux/linux-patched/include/asm-generic/cputime_jiffies.h \
  /home/child/my-linux/linux-patched/include/linux/sem.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/sem.h \
  /home/child/my-linux/linux-patched/include/linux/ipc.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/ipc.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/ipcbuf.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/ipcbuf.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/sembuf.h \
  /home/child/my-linux/linux-patched/include/linux/shm.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/shm.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/shmbuf.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/shmbuf.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/shmparam.h \
  /home/child/my-linux/linux-patched/include/linux/signal.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/signal.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/signal.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/signal.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/signal-defs.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/siginfo.h \
  /home/child/my-linux/linux-patched/include/asm-generic/siginfo.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/siginfo.h \
  /home/child/my-linux/linux-patched/include/linux/proportions.h \
  /home/child/my-linux/linux-patched/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/seccomp.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/seccomp.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/seccomp_64.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/unistd.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/unistd.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/unistd.h \
  arch/x86/include/generated/uapi/asm/unistd_64.h \
  arch/x86/include/generated/asm/unistd_64_x32.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ia32_unistd.h \
  arch/x86/include/generated/asm/unistd_32_ia32.h \
  /home/child/my-linux/linux-patched/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /home/child/my-linux/linux-patched/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/timerfd.h) \
  /home/child/my-linux/linux-patched/include/linux/timerqueue.h \
  /home/child/my-linux/linux-patched/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/child/my-linux/linux-patched/include/linux/latencytop.h \
  /home/child/my-linux/linux-patched/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /home/child/my-linux/linux-patched/include/linux/key.h \
  /home/child/my-linux/linux-patched/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/child/my-linux/linux-patched/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/magic.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/cgroupstats.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/taskstats.h \
  /home/child/my-linux/linux-patched/include/linux/percpu-refcount.h \
  /home/child/my-linux/linux-patched/include/linux/seq_file.h \
  /home/child/my-linux/linux-patched/include/linux/cgroup_subsys.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/cgroup/device.h) \
    $(wildcard include/config/cgroup/freezer.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/cgroup/hugetlb.h) \
    $(wildcard include/config/cgroup/debug.h) \
  /home/child/my-linux/linux-patched/include/linux/node.h \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/child/my-linux/linux-patched/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/child/my-linux/linux-patched/include/linux/klist.h \
  /home/child/my-linux/linux-patched/include/linux/pinctrl/devinfo.h \
  /home/child/my-linux/linux-patched/include/linux/ratelimit.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/device.h \
    $(wildcard include/config/x86/dev/dma/ops.h) \
    $(wildcard include/config/intel/iommu.h) \
    $(wildcard include/config/amd/iommu.h) \
  /home/child/my-linux/linux-patched/include/linux/pm_wakeup.h \
  /home/child/my-linux/linux-patched/include/linux/mempolicy.h \
    $(wildcard include/config/arch/enable/hugepage/migration.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/mempolicy.h \
  /home/child/my-linux/linux-patched/include/linux/xattr.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/xattr.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/libc-compat.h \
  /home/child/my-linux/linux-patched/include/linux/dma-buf.h \
  /home/child/my-linux/linux-patched/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/arch/has/sg/chain.h) \
  arch/x86/include/generated/asm/scatterlist.h \
  /home/child/my-linux/linux-patched/include/asm-generic/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
  /home/child/my-linux/linux-patched/include/linux/dma-mapping.h \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/dma/set/coherent/mask.h) \
    $(wildcard include/config/have/dma/attrs.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  /home/child/my-linux/linux-patched/include/linux/dma-attrs.h \
  /home/child/my-linux/linux-patched/include/linux/dma-direction.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/dma-mapping.h \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/x86/dma/remap.h) \
  /home/child/my-linux/linux-patched/include/linux/kmemcheck.h \
  /home/child/my-linux/linux-patched/include/linux/dma-debug.h \
    $(wildcard include/config/dma/api/debug.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/swiotlb.h \
    $(wildcard include/config/swiotlb.h) \
  /home/child/my-linux/linux-patched/include/linux/swiotlb.h \
  /home/child/my-linux/linux-patched/include/asm-generic/dma-coherent.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
  /home/child/my-linux/linux-patched/include/linux/dma-contiguous.h \
  /home/child/my-linux/linux-patched/include/asm-generic/dma-mapping-common.h \
  /home/child/my-linux/linux-patched/include/linux/fence.h \
    $(wildcard include/config/fence/trace.h) \
  /home/child/my-linux/linux-patched/include/drm/drmP.h \
    $(wildcard include/config/debug/fs.h) \
  /home/child/my-linux/linux-patched/include/linux/agp_backend.h \
  /home/child/my-linux/linux-patched/include/linux/cdev.h \
  /home/child/my-linux/linux-patched/include/linux/miscdevice.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/major.h \
  /home/child/my-linux/linux-patched/include/linux/pci.h \
    $(wildcard include/config/pci/iov.h) \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci/ats.h) \
    $(wildcard include/config/pci/domains/generic.h) \
    $(wildcard include/config/pcieportbus.h) \
    $(wildcard include/config/pcieaer.h) \
    $(wildcard include/config/pcie/ecrc.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/pci/quirks.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
    $(wildcard include/config/hotplug/pci.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/eeh.h) \
  /home/child/my-linux/linux-patched/include/linux/mod_devicetable.h \
  /home/child/my-linux/linux-patched/include/linux/uuid.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/uuid.h \
  /home/child/my-linux/linux-patched/include/linux/resource_ext.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/pci.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/pci_regs.h \
  /home/child/my-linux/linux-patched/include/linux/pci_ids.h \
  /home/child/my-linux/linux-patched/include/linux/pci-dma.h \
  /home/child/my-linux/linux-patched/include/linux/dmapool.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pci.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pci_64.h \
    $(wildcard include/config/calgary/iommu.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/pci-dma-compat.h \
  /home/child/my-linux/linux-patched/include/asm-generic/pci.h \
  /home/child/my-linux/linux-patched/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
  /home/child/my-linux/linux-patched/include/linux/poll.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/poll.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/poll.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/poll.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/pgalloc.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm_mode.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm_mode.h \
  /home/child/my-linux/linux-patched/include/drm/drm_agpsupport.h \
    $(wildcard include/config/agp.h) \
  /home/child/my-linux/linux-patched/include/drm/drm_crtc.h \
  /home/child/my-linux/linux-patched/include/linux/i2c.h \
    $(wildcard include/config/i2c.h) \
    $(wildcard include/config/i2c/slave.h) \
    $(wildcard include/config/i2c/boardinfo.h) \
    $(wildcard include/config/i2c/mux.h) \
  /home/child/my-linux/linux-patched/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/no/change.h) \
    $(wildcard include/config/change/add.h) \
    $(wildcard include/config/change/remove.h) \
    $(wildcard include/config/of/resolve.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/child/my-linux/linux-patched/include/linux/property.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/i2c.h \
  /home/child/my-linux/linux-patched/include/linux/fb.h \
    $(wildcard include/config/fb/deferred/io.h) \
    $(wildcard include/config/fb/tileblitting.h) \
    $(wildcard include/config/fb/backlight.h) \
    $(wildcard include/config/fb/foreign/endian.h) \
    $(wildcard include/config/fb/both/endian.h) \
    $(wildcard include/config/fb/big/endian.h) \
    $(wildcard include/config/fb/little/endian.h) \
  /home/child/my-linux/linux-patched/include/linux/kgdb.h \
    $(wildcard include/config/have/arch/kgdb.h) \
    $(wildcard include/config/kgdb.h) \
    $(wildcard include/config/serial/kgdb/nmi.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/kgdb.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/fb.h \
  /home/child/my-linux/linux-patched/include/linux/backlight.h \
  /home/child/my-linux/linux-patched/include/linux/hdmi.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/media-bus-format.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm_fourcc.h \
  /home/child/my-linux/linux-patched/include/drm/drm_modeset_lock.h \
  /home/child/my-linux/linux-patched/include/linux/ww_mutex.h \
    $(wildcard include/config/debug/ww/mutex/slowpath.h) \
  /home/child/my-linux/linux-patched/include/drm/drm_modes.h \
  /home/child/my-linux/linux-patched/include/drm/drm_global.h \
  /home/child/my-linux/linux-patched/include/drm/drm_hashtab.h \
  /home/child/my-linux/linux-patched/include/drm/drm_mem_util.h \
  /home/child/my-linux/linux-patched/include/drm/drm_mm.h \
  /home/child/my-linux/linux-patched/include/drm/drm_os_linux.h \
  /home/child/my-linux/linux-patched/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
  /home/child/my-linux/linux-patched/include/linux/delay.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/delay.h \
  /home/child/my-linux/linux-patched/include/asm-generic/delay.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm_sarea.h \
  /home/child/my-linux/linux-patched/include/uapi/drm/drm.h \
  /home/child/my-linux/linux-patched/include/drm/drm_vma_manager.h \
  /home/child/my-linux/linux-patched/include/drm/drm_gem.h \
  /home/child/my-linux/linux-patched/drivers/gpu/drm/drm_internal.h \

drivers/gpu/drm/drm_gem.o: $(deps_drivers/gpu/drm/drm_gem.o)

$(deps_drivers/gpu/drm/drm_gem.o):
