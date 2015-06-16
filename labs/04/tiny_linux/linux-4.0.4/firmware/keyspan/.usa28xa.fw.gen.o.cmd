cmd_firmware/keyspan/usa28xa.fw.gen.o := gcc -Wp,-MD,firmware/keyspan/.usa28xa.fw.gen.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__  -D__ASSEMBLY__ -m64 -DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1  -Wa,-gdwarf-2  -mfentry -DCC_USING_FENTRY         -c -o firmware/keyspan/usa28xa.fw.gen.o firmware/keyspan/usa28xa.fw.gen.S

source_firmware/keyspan/usa28xa.fw.gen.o := firmware/keyspan/usa28xa.fw.gen.S

deps_firmware/keyspan/usa28xa.fw.gen.o := \

firmware/keyspan/usa28xa.fw.gen.o: $(deps_firmware/keyspan/usa28xa.fw.gen.o)

$(deps_firmware/keyspan/usa28xa.fw.gen.o):
