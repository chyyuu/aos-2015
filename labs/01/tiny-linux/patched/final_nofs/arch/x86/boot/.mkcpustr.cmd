cmd_arch/x86/boot/mkcpustr := gcc -Wp,-MD,arch/x86/boot/.mkcpustr.d -Iarch/x86/boot -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -I/home/child/my-linux/linux-patched/tools/include -include include/generated/autoconf.h -D__EXPORTED_HEADERS__ -o arch/x86/boot/mkcpustr /home/child/my-linux/linux-patched/arch/x86/boot/mkcpustr.c  

source_arch/x86/boot/mkcpustr := /home/child/my-linux/linux-patched/arch/x86/boot/mkcpustr.c

deps_arch/x86/boot/mkcpustr := \
  /usr/include/stdc-predef.h \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/x86_64-linux-gnu/sys/cdefs.h \
  /usr/include/x86_64-linux-gnu/bits/wordsize.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
  /usr/include/x86_64-linux-gnu/bits/types.h \
  /usr/include/x86_64-linux-gnu/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/sys_errlist.h \
  /usr/include/x86_64-linux-gnu/bits/stdio.h \
  /usr/include/x86_64-linux-gnu/bits/stdio2.h \
  /home/child/my-linux/linux-patched/arch/x86/boot/../include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/cmov.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
    $(wildcard include/config/matom.h) \
    $(wildcard include/config/paravirt.h) \
  /home/child/my-linux/linux-patched/arch/x86/boot/../include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  /home/child/my-linux/linux-patched/arch/x86/boot/../include/asm/cpufeature.h \
    $(wildcard include/config/x86/feature/names.h) \
    $(wildcard include/config/kernel/mode/linux.h) \
    $(wildcard include/config/x86/debug/static/cpu/has.h) \
  arch/x86/boot/../kernel/cpu/capflags.c \

arch/x86/boot/mkcpustr: $(deps_arch/x86/boot/mkcpustr)

$(deps_arch/x86/boot/mkcpustr):
