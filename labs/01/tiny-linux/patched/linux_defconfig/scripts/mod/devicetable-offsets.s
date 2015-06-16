	.file	"devicetable-offsets.c"
# GNU C (Ubuntu 4.8.2-19ubuntu1) version 4.8.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.8.2, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -nostdinc
# -I /home/child/my-linux/linux-patched/arch/x86/include
# -I arch/x86/include/generated/uapi -I arch/x86/include/generated
# -I /home/child/my-linux/linux-patched/include -I include
# -I /home/child/my-linux/linux-patched/arch/x86/include/uapi
# -I arch/x86/include/generated/uapi
# -I /home/child/my-linux/linux-patched/include/uapi
# -I include/generated/uapi
# -I /home/child/my-linux/linux-patched/scripts/mod -I scripts/mod
# -imultiarch x86_64-linux-gnu -D __KERNEL__ -D CONFIG_AS_CFI=1
# -D CONFIG_AS_CFI_SIGNAL_FRAME=1 -D CONFIG_AS_CFI_SECTIONS=1
# -D CONFIG_AS_FXSAVEQ=1 -D CONFIG_AS_SSSE3=1 -D CONFIG_AS_CRC32=1
# -D CONFIG_AS_AVX=1 -D CONFIG_AS_AVX2=1 -D CC_HAVE_ASM_GOTO
# -D KBUILD_STR(s)=#s -D KBUILD_BASENAME=KBUILD_STR(devicetable_offsets)
# -D KBUILD_MODNAME=KBUILD_STR(devicetable_offsets)
# -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include
# -include /home/child/my-linux/linux-patched/include/linux/kconfig.h
# -MD scripts/mod/.devicetable-offsets.s.d
# /home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c -m64
# -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone
# -mcmodel=kernel -maccumulate-outgoing-args -mno-sse -mno-mmx -mno-sse2
# -mno-3dnow -mno-avx -march=x86-64
# -auxbase-strip scripts/mod/devicetable-offsets.s -O2 -Wall -Wundef
# -Wstrict-prototypes -Wno-trigraphs -Werror=implicit-function-declaration
# -Wno-format-security -Wno-sign-compare -Wframe-larger-than=2048
# -Wno-unused-but-set-variable -Wdeclaration-after-statement
# -Wno-pointer-sign -Werror=implicit-int -Werror=strict-prototypes
# -std=gnu90 -fno-strict-aliasing -fno-common -funit-at-a-time
# -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks
# -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls
# -fno-var-tracking-assignments -fno-strict-overflow -fconserve-stack
# -fverbose-asm --param allow-store-data-races=0
# options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdevirtualize -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fivopts -fkeep-static-consts -fleading-underscore -fmath-errno
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -foptimize-register-move -foptimize-strlen -fpartial-inlining -fpeephole
# -fpeephole2 -fprefetch-loop-arrays -free -freg-struct-return -fregmove
# -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
# -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize
# -ftree-slsr -ftree-sra -ftree-switch-conversion -ftree-tail-merge
# -ftree-ter -ftree-vect-loop-version -ftree-vrp -funit-at-a-time
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64
# -maccumulate-outgoing-args -malign-stringops -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mno-fancy-math-387 -mno-red-zone -mno-sse4 -mpush-args
# -mtls-direct-seg-refs

	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
#APP
# 10 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_usb_device_id $32 sizeof(struct usb_device_id)	#
# 0 "" 2
# 11 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_match_flags $0 offsetof(struct usb_device_id, match_flags)	#
# 0 "" 2
# 12 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_idVendor $2 offsetof(struct usb_device_id, idVendor)	#
# 0 "" 2
# 13 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_idProduct $4 offsetof(struct usb_device_id, idProduct)	#
# 0 "" 2
# 14 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bcdDevice_lo $6 offsetof(struct usb_device_id, bcdDevice_lo)	#
# 0 "" 2
# 15 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bcdDevice_hi $8 offsetof(struct usb_device_id, bcdDevice_hi)	#
# 0 "" 2
# 16 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bDeviceClass $10 offsetof(struct usb_device_id, bDeviceClass)	#
# 0 "" 2
# 17 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bDeviceSubClass $11 offsetof(struct usb_device_id, bDeviceSubClass)	#
# 0 "" 2
# 18 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bDeviceProtocol $12 offsetof(struct usb_device_id, bDeviceProtocol)	#
# 0 "" 2
# 19 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bInterfaceClass $13 offsetof(struct usb_device_id, bInterfaceClass)	#
# 0 "" 2
# 20 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bInterfaceSubClass $14 offsetof(struct usb_device_id, bInterfaceSubClass)	#
# 0 "" 2
# 21 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bInterfaceProtocol $15 offsetof(struct usb_device_id, bInterfaceProtocol)	#
# 0 "" 2
# 22 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_usb_device_id_bInterfaceNumber $16 offsetof(struct usb_device_id, bInterfaceNumber)	#
# 0 "" 2
# 24 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_hid_device_id $24 sizeof(struct hid_device_id)	#
# 0 "" 2
# 25 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_hid_device_id_bus $0 offsetof(struct hid_device_id, bus)	#
# 0 "" 2
# 26 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_hid_device_id_group $2 offsetof(struct hid_device_id, group)	#
# 0 "" 2
# 27 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_hid_device_id_vendor $4 offsetof(struct hid_device_id, vendor)	#
# 0 "" 2
# 28 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_hid_device_id_product $8 offsetof(struct hid_device_id, product)	#
# 0 "" 2
# 30 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_ieee1394_device_id $32 sizeof(struct ieee1394_device_id)	#
# 0 "" 2
# 31 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ieee1394_device_id_match_flags $0 offsetof(struct ieee1394_device_id, match_flags)	#
# 0 "" 2
# 32 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ieee1394_device_id_vendor_id $4 offsetof(struct ieee1394_device_id, vendor_id)	#
# 0 "" 2
# 33 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ieee1394_device_id_model_id $8 offsetof(struct ieee1394_device_id, model_id)	#
# 0 "" 2
# 34 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ieee1394_device_id_specifier_id $12 offsetof(struct ieee1394_device_id, specifier_id)	#
# 0 "" 2
# 35 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ieee1394_device_id_version $16 offsetof(struct ieee1394_device_id, version)	#
# 0 "" 2
# 37 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_pci_device_id $32 sizeof(struct pci_device_id)	#
# 0 "" 2
# 38 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_vendor $0 offsetof(struct pci_device_id, vendor)	#
# 0 "" 2
# 39 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_device $4 offsetof(struct pci_device_id, device)	#
# 0 "" 2
# 40 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_subvendor $8 offsetof(struct pci_device_id, subvendor)	#
# 0 "" 2
# 41 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_subdevice $12 offsetof(struct pci_device_id, subdevice)	#
# 0 "" 2
# 42 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_class $16 offsetof(struct pci_device_id, class)	#
# 0 "" 2
# 43 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pci_device_id_class_mask $20 offsetof(struct pci_device_id, class_mask)	#
# 0 "" 2
# 45 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_ccw_device_id $16 sizeof(struct ccw_device_id)	#
# 0 "" 2
# 46 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ccw_device_id_match_flags $0 offsetof(struct ccw_device_id, match_flags)	#
# 0 "" 2
# 47 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ccw_device_id_cu_type $2 offsetof(struct ccw_device_id, cu_type)	#
# 0 "" 2
# 48 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ccw_device_id_cu_model $6 offsetof(struct ccw_device_id, cu_model)	#
# 0 "" 2
# 49 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ccw_device_id_dev_type $4 offsetof(struct ccw_device_id, dev_type)	#
# 0 "" 2
# 50 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ccw_device_id_dev_model $7 offsetof(struct ccw_device_id, dev_model)	#
# 0 "" 2
# 52 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_ap_device_id $16 sizeof(struct ap_device_id)	#
# 0 "" 2
# 53 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ap_device_id_dev_type $2 offsetof(struct ap_device_id, dev_type)	#
# 0 "" 2
# 55 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_css_device_id $16 sizeof(struct css_device_id)	#
# 0 "" 2
# 56 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_css_device_id_type $1 offsetof(struct css_device_id, type)	#
# 0 "" 2
# 58 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_serio_device_id $4 sizeof(struct serio_device_id)	#
# 0 "" 2
# 59 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_serio_device_id_type $0 offsetof(struct serio_device_id, type)	#
# 0 "" 2
# 60 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_serio_device_id_proto $3 offsetof(struct serio_device_id, proto)	#
# 0 "" 2
# 61 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_serio_device_id_id $2 offsetof(struct serio_device_id, id)	#
# 0 "" 2
# 62 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_serio_device_id_extra $1 offsetof(struct serio_device_id, extra)	#
# 0 "" 2
# 64 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_acpi_device_id $24 sizeof(struct acpi_device_id)	#
# 0 "" 2
# 65 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_acpi_device_id_id $0 offsetof(struct acpi_device_id, id)	#
# 0 "" 2
# 67 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_pnp_device_id $16 sizeof(struct pnp_device_id)	#
# 0 "" 2
# 68 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pnp_device_id_id $0 offsetof(struct pnp_device_id, id)	#
# 0 "" 2
# 70 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_pnp_card_device_id $80 sizeof(struct pnp_card_device_id)	#
# 0 "" 2
# 71 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pnp_card_device_id_devs $16 offsetof(struct pnp_card_device_id, devs)	#
# 0 "" 2
# 73 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_pcmcia_device_id $80 sizeof(struct pcmcia_device_id)	#
# 0 "" 2
# 74 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_match_flags $0 offsetof(struct pcmcia_device_id, match_flags)	#
# 0 "" 2
# 75 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_manf_id $2 offsetof(struct pcmcia_device_id, manf_id)	#
# 0 "" 2
# 76 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_card_id $4 offsetof(struct pcmcia_device_id, card_id)	#
# 0 "" 2
# 77 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_func_id $6 offsetof(struct pcmcia_device_id, func_id)	#
# 0 "" 2
# 78 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_function $7 offsetof(struct pcmcia_device_id, function)	#
# 0 "" 2
# 79 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_device_no $8 offsetof(struct pcmcia_device_id, device_no)	#
# 0 "" 2
# 80 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_pcmcia_device_id_prod_id_hash $12 offsetof(struct pcmcia_device_id, prod_id_hash)	#
# 0 "" 2
# 82 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_of_device_id $200 sizeof(struct of_device_id)	#
# 0 "" 2
# 83 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_of_device_id_name $0 offsetof(struct of_device_id, name)	#
# 0 "" 2
# 84 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_of_device_id_type $32 offsetof(struct of_device_id, type)	#
# 0 "" 2
# 85 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_of_device_id_compatible $64 offsetof(struct of_device_id, compatible)	#
# 0 "" 2
# 87 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_vio_device_id $64 sizeof(struct vio_device_id)	#
# 0 "" 2
# 88 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_vio_device_id_type $0 offsetof(struct vio_device_id, type)	#
# 0 "" 2
# 89 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_vio_device_id_compat $32 offsetof(struct vio_device_id, compat)	#
# 0 "" 2
# 91 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_input_device_id $192 sizeof(struct input_device_id)	#
# 0 "" 2
# 92 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_flags $0 offsetof(struct input_device_id, flags)	#
# 0 "" 2
# 93 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_bustype $8 offsetof(struct input_device_id, bustype)	#
# 0 "" 2
# 94 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_vendor $10 offsetof(struct input_device_id, vendor)	#
# 0 "" 2
# 95 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_product $12 offsetof(struct input_device_id, product)	#
# 0 "" 2
# 96 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_version $14 offsetof(struct input_device_id, version)	#
# 0 "" 2
# 97 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_evbit $16 offsetof(struct input_device_id, evbit)	#
# 0 "" 2
# 98 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_keybit $24 offsetof(struct input_device_id, keybit)	#
# 0 "" 2
# 99 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_relbit $120 offsetof(struct input_device_id, relbit)	#
# 0 "" 2
# 100 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_absbit $128 offsetof(struct input_device_id, absbit)	#
# 0 "" 2
# 101 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_mscbit $136 offsetof(struct input_device_id, mscbit)	#
# 0 "" 2
# 102 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_ledbit $144 offsetof(struct input_device_id, ledbit)	#
# 0 "" 2
# 103 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_sndbit $152 offsetof(struct input_device_id, sndbit)	#
# 0 "" 2
# 104 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_ffbit $160 offsetof(struct input_device_id, ffbit)	#
# 0 "" 2
# 105 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_input_device_id_swbit $176 offsetof(struct input_device_id, swbit)	#
# 0 "" 2
# 107 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_eisa_device_id $16 sizeof(struct eisa_device_id)	#
# 0 "" 2
# 108 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_eisa_device_id_sig $0 offsetof(struct eisa_device_id, sig)	#
# 0 "" 2
# 110 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_parisc_device_id $8 sizeof(struct parisc_device_id)	#
# 0 "" 2
# 111 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_parisc_device_id_hw_type $0 offsetof(struct parisc_device_id, hw_type)	#
# 0 "" 2
# 112 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_parisc_device_id_hversion $2 offsetof(struct parisc_device_id, hversion)	#
# 0 "" 2
# 113 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_parisc_device_id_hversion_rev $1 offsetof(struct parisc_device_id, hversion_rev)	#
# 0 "" 2
# 114 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_parisc_device_id_sversion $4 offsetof(struct parisc_device_id, sversion)	#
# 0 "" 2
# 116 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_sdio_device_id $16 sizeof(struct sdio_device_id)	#
# 0 "" 2
# 117 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_sdio_device_id_class $0 offsetof(struct sdio_device_id, class)	#
# 0 "" 2
# 118 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_sdio_device_id_vendor $2 offsetof(struct sdio_device_id, vendor)	#
# 0 "" 2
# 119 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_sdio_device_id_device $4 offsetof(struct sdio_device_id, device)	#
# 0 "" 2
# 121 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_ssb_device_id $6 sizeof(struct ssb_device_id)	#
# 0 "" 2
# 122 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ssb_device_id_vendor $0 offsetof(struct ssb_device_id, vendor)	#
# 0 "" 2
# 123 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ssb_device_id_coreid $2 offsetof(struct ssb_device_id, coreid)	#
# 0 "" 2
# 124 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ssb_device_id_revision $4 offsetof(struct ssb_device_id, revision)	#
# 0 "" 2
# 126 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_bcma_device_id $6 sizeof(struct bcma_device_id)	#
# 0 "" 2
# 127 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_bcma_device_id_manuf $0 offsetof(struct bcma_device_id, manuf)	#
# 0 "" 2
# 128 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_bcma_device_id_id $2 offsetof(struct bcma_device_id, id)	#
# 0 "" 2
# 129 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_bcma_device_id_rev $4 offsetof(struct bcma_device_id, rev)	#
# 0 "" 2
# 130 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_bcma_device_id_class $5 offsetof(struct bcma_device_id, class)	#
# 0 "" 2
# 132 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_virtio_device_id $8 sizeof(struct virtio_device_id)	#
# 0 "" 2
# 133 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_virtio_device_id_device $0 offsetof(struct virtio_device_id, device)	#
# 0 "" 2
# 134 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_virtio_device_id_vendor $4 offsetof(struct virtio_device_id, vendor)	#
# 0 "" 2
# 136 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_hv_vmbus_device_id $24 sizeof(struct hv_vmbus_device_id)	#
# 0 "" 2
# 137 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_hv_vmbus_device_id_guid $0 offsetof(struct hv_vmbus_device_id, guid)	#
# 0 "" 2
# 139 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_i2c_device_id $32 sizeof(struct i2c_device_id)	#
# 0 "" 2
# 140 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_i2c_device_id_name $0 offsetof(struct i2c_device_id, name)	#
# 0 "" 2
# 142 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_spi_device_id $40 sizeof(struct spi_device_id)	#
# 0 "" 2
# 143 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_spi_device_id_name $0 offsetof(struct spi_device_id, name)	#
# 0 "" 2
# 145 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_dmi_system_id $344 sizeof(struct dmi_system_id)	#
# 0 "" 2
# 146 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_dmi_system_id_matches $16 offsetof(struct dmi_system_id, matches)	#
# 0 "" 2
# 148 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_platform_device_id $32 sizeof(struct platform_device_id)	#
# 0 "" 2
# 149 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_platform_device_id_name $0 offsetof(struct platform_device_id, name)	#
# 0 "" 2
# 151 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_mdio_device_id $8 sizeof(struct mdio_device_id)	#
# 0 "" 2
# 152 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_mdio_device_id_phy_id $0 offsetof(struct mdio_device_id, phy_id)	#
# 0 "" 2
# 153 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_mdio_device_id_phy_id_mask $4 offsetof(struct mdio_device_id, phy_id_mask)	#
# 0 "" 2
# 155 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_zorro_device_id $16 sizeof(struct zorro_device_id)	#
# 0 "" 2
# 156 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_zorro_device_id_id $0 offsetof(struct zorro_device_id, id)	#
# 0 "" 2
# 158 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_isapnp_device_id $16 sizeof(struct isapnp_device_id)	#
# 0 "" 2
# 159 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_isapnp_device_id_vendor $4 offsetof(struct isapnp_device_id, vendor)	#
# 0 "" 2
# 160 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_isapnp_device_id_function $6 offsetof(struct isapnp_device_id, function)	#
# 0 "" 2
# 162 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_ipack_device_id $12 sizeof(struct ipack_device_id)	#
# 0 "" 2
# 163 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ipack_device_id_format $0 offsetof(struct ipack_device_id, format)	#
# 0 "" 2
# 164 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ipack_device_id_vendor $4 offsetof(struct ipack_device_id, vendor)	#
# 0 "" 2
# 165 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_ipack_device_id_device $8 offsetof(struct ipack_device_id, device)	#
# 0 "" 2
# 167 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_amba_id $16 sizeof(struct amba_id)	#
# 0 "" 2
# 168 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_amba_id_id $0 offsetof(struct amba_id, id)	#
# 0 "" 2
# 169 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_amba_id_mask $4 offsetof(struct amba_id, mask)	#
# 0 "" 2
# 171 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_x86_cpu_id $16 sizeof(struct x86_cpu_id)	#
# 0 "" 2
# 172 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_x86_cpu_id_feature $6 offsetof(struct x86_cpu_id, feature)	#
# 0 "" 2
# 173 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_x86_cpu_id_family $2 offsetof(struct x86_cpu_id, family)	#
# 0 "" 2
# 174 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_x86_cpu_id_model $4 offsetof(struct x86_cpu_id, model)	#
# 0 "" 2
# 175 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_x86_cpu_id_vendor $0 offsetof(struct x86_cpu_id, vendor)	#
# 0 "" 2
# 177 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_cpu_feature $2 sizeof(struct cpu_feature)	#
# 0 "" 2
# 178 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_cpu_feature_feature $0 offsetof(struct cpu_feature, feature)	#
# 0 "" 2
# 180 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_mei_cl_device_id $40 sizeof(struct mei_cl_device_id)	#
# 0 "" 2
# 181 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_mei_cl_device_id_name $0 offsetof(struct mei_cl_device_id, name)	#
# 0 "" 2
# 183 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->SIZE_rio_device_id $8 sizeof(struct rio_device_id)	#
# 0 "" 2
# 184 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_rio_device_id_did $0 offsetof(struct rio_device_id, did)	#
# 0 "" 2
# 185 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_rio_device_id_vid $2 offsetof(struct rio_device_id, vid)	#
# 0 "" 2
# 186 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_rio_device_id_asm_did $4 offsetof(struct rio_device_id, asm_did)	#
# 0 "" 2
# 187 "/home/child/my-linux/linux-patched/scripts/mod/devicetable-offsets.c" 1
	
->OFF_rio_device_id_asm_vid $6 offsetof(struct rio_device_id, asm_vid)	#
# 0 "" 2
#NO_APP
	xorl	%eax, %eax	#
	popq	%rbp	#
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
