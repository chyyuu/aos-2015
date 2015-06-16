cmd_firmware/e100/d101m_ucode.bin.gen.o := gcc -Wp,-MD,firmware/e100/.d101m_ucode.bin.gen.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__  -D__ASSEMBLY__ -m32 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1  -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1          -c -o firmware/e100/d101m_ucode.bin.gen.o firmware/e100/d101m_ucode.bin.gen.S

source_firmware/e100/d101m_ucode.bin.gen.o := firmware/e100/d101m_ucode.bin.gen.S

deps_firmware/e100/d101m_ucode.bin.gen.o := \

firmware/e100/d101m_ucode.bin.gen.o: $(deps_firmware/e100/d101m_ucode.bin.gen.o)

$(deps_firmware/e100/d101m_ucode.bin.gen.o):
