cmd_drivers/acpi/acpica/utdecode.o := gcc -Wp,-MD,drivers/acpi/acpica/.utdecode.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/home/child/my-linux/linux-patched/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/home/child/my-linux/linux-patched/include -Iinclude -I/home/child/my-linux/linux-patched/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/home/child/my-linux/linux-patched/include/uapi -Iinclude/generated/uapi -include /home/child/my-linux/linux-patched/include/linux/kconfig.h  -I/home/child/my-linux/linux-patched/drivers/acpi/acpica -Idrivers/acpi/acpica -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO -Os -DBUILDING_ACPICA    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(utdecode)"  -D"KBUILD_MODNAME=KBUILD_STR(acpi)" -c -o drivers/acpi/acpica/utdecode.o /home/child/my-linux/linux-patched/drivers/acpi/acpica/utdecode.c

source_drivers/acpi/acpica/utdecode.o := /home/child/my-linux/linux-patched/drivers/acpi/acpica/utdecode.c

deps_drivers/acpi/acpica/utdecode.o := \
  /home/child/my-linux/linux-patched/include/acpi/acpi.h \
  /home/child/my-linux/linux-patched/include/acpi/platform/acenv.h \
  /home/child/my-linux/linux-patched/include/acpi/platform/aclinux.h \
    $(wildcard include/config/acpi/reduced/hardware/only.h) \
    $(wildcard include/config/acpi.h) \
  /home/child/my-linux/linux-patched/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
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
    $(wildcard include/config/x86/32.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/posix_types_64.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/posix_types.h \
  /home/child/my-linux/linux-patched/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/string.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/string.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/kasan.h) \
  /home/child/my-linux/linux-patched/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/child/my-linux/linux-patched/include/linux/linkage.h \
  /home/child/my-linux/linux-patched/include/linux/stringify.h \
  /home/child/my-linux/linux-patched/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /home/child/my-linux/linux-patched/include/linux/bitops.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/paravirt.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/asm.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/x86/debugctlmsr.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/segment.h \
    $(wildcard include/config/kernel/mode/linux.h) \
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
  /home/child/my-linux/linux-patched/include/linux/typecheck.h \
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
  /home/child/my-linux/linux-patched/include/linux/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/errno.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/errno-base.h \
  /home/child/my-linux/linux-patched/include/linux/ctype.h \
  /home/child/my-linux/linux-patched/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/no/hz/common.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/irq/time/accounting.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/preempt.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/sched.h \
  /home/child/my-linux/linux-patched/include/linux/sched/prio.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/param.h \
  /home/child/my-linux/linux-patched/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/param.h \
  /home/child/my-linux/linux-patched/include/linux/capability.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/capability.h \
  /home/child/my-linux/linux-patched/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/child/my-linux/linux-patched/include/linux/timex.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/timex.h \
  /home/child/my-linux/linux-patched/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/child/my-linux/linux-patched/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/child/my-linux/linux-patched/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/child/my-linux/linux-patched/include/linux/preempt.h \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/context/tracking.h) \
  /home/child/my-linux/linux-patched/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/child/my-linux/linux-patched/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/preempt.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/child/my-linux/linux-patched/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/child/my-linux/linux-patched/include/linux/thread_info.h \
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
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/x86/vsyscall/emulation.h) \
  /home/child/my-linux/linux-patched/include/linux/range.h \
  /home/child/my-linux/linux-patched/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
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
    $(wildcard include/config/lock/stat.h) \
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
  /home/child/my-linux/linux-patched/include/linux/time64.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/time.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/param.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/timex.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/tsc.h \
    $(wildcard include/config/x86/tsc.h) \
  /home/child/my-linux/linux-patched/include/linux/jiffies.h \
  /home/child/my-linux/linux-patched/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/child/my-linux/linux-patched/include/linux/rbtree.h \
  /home/child/my-linux/linux-patched/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/movable/node.h) \
  /home/child/my-linux/linux-patched/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/child/my-linux/linux-patched/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/compaction.h) \
  /home/child/my-linux/linux-patched/include/linux/auxvec.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/auxvec.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/auxvec.h \
  /home/child/my-linux/linux-patched/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/child/my-linux/linux-patched/include/linux/osq_lock.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/rwsem.h \
  /home/child/my-linux/linux-patched/include/linux/completion.h \
  /home/child/my-linux/linux-patched/include/linux/wait.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/wait.h \
  /home/child/my-linux/linux-patched/include/linux/uprobes.h \
  /home/child/my-linux/linux-patched/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmu.h \
  /home/child/my-linux/linux-patched/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/child/my-linux/linux-patched/include/linux/cputime.h \
  arch/x86/include/generated/asm/cputime.h \
  /home/child/my-linux/linux-patched/include/asm-generic/cputime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/cputime_jiffies.h \
  /home/child/my-linux/linux-patched/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/child/my-linux/linux-patched/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
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
    $(wildcard include/config/memory/hotremove.h) \
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
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/child/my-linux/linux-patched/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
  /home/child/my-linux/linux-patched/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/child/my-linux/linux-patched/include/linux/ktime.h \
  /home/child/my-linux/linux-patched/include/linux/timekeeping.h \
  /home/child/my-linux/linux-patched/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/paravirt/clock.h) \
    $(wildcard include/config/provide/ohci1394/dma/init.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/x86/intel/mid.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/acpi.h \
    $(wildcard include/config/acpi/numa.h) \
  /home/child/my-linux/linux-patched/include/acpi/pdc_intel.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/numa.h \
    $(wildcard include/config/numa/emu.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/topology.h \
    $(wildcard include/config/x86/ht.h) \
  /home/child/my-linux/linux-patched/include/asm-generic/topology.h \
    $(wildcard include/config/have/memoryless/nodes.h) \
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
  /home/child/my-linux/linux-patched/include/linux/sem.h \
  /home/child/my-linux/linux-patched/include/linux/rcupdate.h \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/rcu/nocb/cpu/all.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /home/child/my-linux/linux-patched/include/linux/rcutree.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/sem.h \
  /home/child/my-linux/linux-patched/include/linux/ipc.h \
  /home/child/my-linux/linux-patched/include/linux/uidgid.h \
    $(wildcard include/config/user/ns.h) \
  /home/child/my-linux/linux-patched/include/linux/highuid.h \
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
  /home/child/my-linux/linux-patched/include/linux/pid.h \
  /home/child/my-linux/linux-patched/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/child/my-linux/linux-patched/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
  /home/child/my-linux/linux-patched/include/linux/pfn.h \
  /home/child/my-linux/linux-patched/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/child/my-linux/linux-patched/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/cma.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/child/my-linux/linux-patched/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/child/my-linux/linux-patched/include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/child/my-linux/linux-patched/include/linux/notifier.h \
  /home/child/my-linux/linux-patched/include/linux/srcu.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmzone.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/mmzone_64.h \
  /home/child/my-linux/linux-patched/include/linux/proportions.h \
  /home/child/my-linux/linux-patched/include/linux/percpu_counter.h \
  /home/child/my-linux/linux-patched/include/linux/gfp.h \
  /home/child/my-linux/linux-patched/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/seccomp.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/seccomp.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/seccomp_64.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/unistd.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/unistd.h \
    $(wildcard include/config/x86/x32/abi.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/unistd.h \
  arch/x86/include/generated/uapi/asm/unistd_64.h \
  arch/x86/include/generated/asm/unistd_64_x32.h \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/ia32_unistd.h \
  arch/x86/include/generated/asm/unistd_32_ia32.h \
  /home/child/my-linux/linux-patched/include/linux/rculist.h \
  /home/child/my-linux/linux-patched/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /home/child/my-linux/linux-patched/include/linux/resource.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/resource.h \
  /home/child/my-linux/linux-patched/arch/x86/include/uapi/asm/resource.h \
  /home/child/my-linux/linux-patched/include/asm-generic/resource.h \
  /home/child/my-linux/linux-patched/include/uapi/asm-generic/resource.h \
  /home/child/my-linux/linux-patched/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/timerfd.h) \
  /home/child/my-linux/linux-patched/include/linux/timerqueue.h \
  /home/child/my-linux/linux-patched/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/child/my-linux/linux-patched/include/linux/latencytop.h \
  /home/child/my-linux/linux-patched/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/security.h) \
  /home/child/my-linux/linux-patched/include/linux/key.h \
    $(wildcard include/config/sysctl.h) \
  /home/child/my-linux/linux-patched/include/linux/sysctl.h \
  /home/child/my-linux/linux-patched/include/uapi/linux/sysctl.h \
  /home/child/my-linux/linux-patched/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/child/my-linux/linux-patched/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/child/my-linux/linux-patched/include/uapi/linux/magic.h \
  /home/child/my-linux/linux-patched/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  /home/child/my-linux/linux-patched/include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /home/child/my-linux/linux-patched/include/linux/kasan.h \
    $(wildcard include/config/kasan/shadow/offset.h) \
  /home/child/my-linux/linux-patched/arch/x86/include/asm/acenv.h \
  /home/child/my-linux/linux-patched/include/acpi/platform/acgcc.h \
  /home/child/my-linux/linux-patched/include/acpi/acnames.h \
  /home/child/my-linux/linux-patched/include/acpi/actypes.h \
  /home/child/my-linux/linux-patched/include/acpi/acexcep.h \
  /home/child/my-linux/linux-patched/include/acpi/actbl.h \
  /home/child/my-linux/linux-patched/include/acpi/actbl1.h \
  /home/child/my-linux/linux-patched/include/acpi/actbl2.h \
  /home/child/my-linux/linux-patched/include/acpi/actbl3.h \
  /home/child/my-linux/linux-patched/include/acpi/acoutput.h \
  /home/child/my-linux/linux-patched/include/acpi/acrestyp.h \
    $(wildcard include/config/default.h) \
    $(wildcard include/config/pullup.h) \
    $(wildcard include/config/pulldown.h) \
    $(wildcard include/config/nopull.h) \
  /home/child/my-linux/linux-patched/include/acpi/acpiosxf.h \
  /home/child/my-linux/linux-patched/include/acpi/acpixf.h \
  /home/child/my-linux/linux-patched/include/acpi/acconfig.h \
    $(wildcard include/config/h.h) \
  /home/child/my-linux/linux-patched/include/acpi/acbuffer.h \
  /home/child/my-linux/linux-patched/include/acpi/platform/acenvex.h \
  /home/child/my-linux/linux-patched/include/acpi/platform/aclinuxex.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/accommon.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acmacros.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/aclocal.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acobject.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acstruct.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acglobal.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/achware.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acutils.h \
  /home/child/my-linux/linux-patched/drivers/acpi/acpica/acnamesp.h \

drivers/acpi/acpica/utdecode.o: $(deps_drivers/acpi/acpica/utdecode.o)

$(deps_drivers/acpi/acpica/utdecode.o):
