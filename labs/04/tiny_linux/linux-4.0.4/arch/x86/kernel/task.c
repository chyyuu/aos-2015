/*
 * Copyright 2004 Toshiyuki Maeda
 *
 * This file is part of Kernel Mode Linux.
 *
 * Kernel Mode Linux is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * Kernel Mode Linux is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#ifdef CONFIG_X86_32

#include <linux/init.h>
#include <linux/percpu.h>
#include <asm/desc.h>
#include <asm/processor.h>

extern void nmi_task(void);
extern void double_fault_task(void);

#define INIT_DFT {						\
	.x86_tss = {						\
		.ss0		= __KERNEL_DS,			\
		.ldt		= 0,				\
		.fs		= __KERNEL_PERCPU,		\
		.gs		= 0,				\
		.io_bitmap_base	= INVALID_IO_BITMAP_OFFSET,	\
		.ip		= (unsigned long) double_fault_task,	\
		.flags		= X86_EFLAGS_SF | 0x2,		\
		.es		= __USER_DS,			\
		.cs		= __KERNEL_CS,			\
		.ss		= __KERNEL_DS,			\
		.ds		= __USER_DS			\
	}							\
}

#define INIT_NMIT {						\
	.x86_tss = {						\
		.ss0		= __KERNEL_DS,			\
		.ldt		= 0,				\
		.fs		= __KERNEL_PERCPU,		\
		.gs		= 0,				\
		.io_bitmap_base	= INVALID_IO_BITMAP_OFFSET,	\
		.ip		= (unsigned long) nmi_task,	\
		.flags		= X86_EFLAGS_SF | 0x2,		\
		.es		= __USER_DS,			\
		.cs		= __KERNEL_CS,			\
		.ss		= __KERNEL_DS,			\
		.ds		= __USER_DS			\
	}							\
}

DEFINE_PER_CPU(struct tss_struct, nmi_tsses) = INIT_NMIT;
DEFINE_PER_CPU(struct tss_struct, doublefault_tsses) = INIT_DFT;

DEFINE_PER_CPU(struct nmi_stack_struct, nmi_stacks);
DEFINE_PER_CPU(struct dft_stack_struct, dft_stacks);

DEFINE_PER_CPU(unsigned long, esp0);
DEFINE_PER_CPU(unsigned long, unused);

struct df_stk {
	unsigned long ip;
	unsigned long cs;
	unsigned long flags;
};

struct nmi_stk {
	unsigned long gs;
	unsigned long fs;
	struct df_stk stk;
};

asmlinkage void prepare_fault_handler(unsigned long target_ip,
				      struct tss_struct* cur, struct tss_struct* pre, struct df_stk* stk)
{
	unsigned int cpu = smp_processor_id();

	clear_busy_flag_in_tss_descriptor(cpu);

	stk->cs &= 0x0000ffff;

	if (pre->x86_tss.cs == __KERNEL_CS && pre->x86_tss.sp <= TASK_SIZE) {
		stk->cs = __KU_CS_EXCEPTION;
	}

	pre->x86_tss.ip = target_ip;
	pre->x86_tss.cs = __KERNEL_CS;
	pre->x86_tss.flags &= (~(X86_EFLAGS_TF | X86_EFLAGS_IF));

	pre->x86_tss.sp = (unsigned long)stk;
	pre->x86_tss.ss = __KERNEL_DS;

	return;
}

extern void ia32_sysenter_target(void);
extern void sysenter_past_esp(void);

asmlinkage void prepare_nmi_handler(unsigned long target_ip,
				    struct tss_struct* cur, struct tss_struct* pre, struct nmi_stk* stk)
{
	prepare_fault_handler(target_ip, cur, pre, &stk->stk);

	/*
	 * NOTE: it is unnecessary to set cs to __KU_CS_INTERRUPT
	 * because the layout of the prepared kernel stack (in entry.S) is
	 * for exceptions, not interrupts.
	 */

	stk->fs = pre->x86_tss.fs;
	stk->gs = pre->x86_tss.gs;

	pre->x86_tss.fs = 0;
	pre->x86_tss.gs = 0;
	pre->x86_tss.ldt = 0;

	pre->x86_tss.sp = (unsigned long)stk;

	/*
	 * Skip the first instruction of ia32_sysenter_target because
	 * it assumes that %esp points to tss->esp1
	 * and just loads the correct kernel stack to %esp.
	 */
	if (stk->stk.ip == (unsigned long)ia32_sysenter_target) {
		stk->stk.ip = (unsigned long)sysenter_past_esp;
	}

	return;
}

void __cpuinit init_doublefault_tss(int cpu)
{
	struct tss_struct* tss = &per_cpu(init_tss, cpu);
	struct tss_struct* doublefault_tss = &per_cpu(doublefault_tsses, cpu);
	struct dft_stack_struct* dft_stack = &per_cpu(dft_stacks, cpu);

	doublefault_tss->x86_tss.sp = (unsigned long)(&(dft_stack->error_code) + 1);
	doublefault_tss->x86_tss.sp0 = doublefault_tss->x86_tss.sp;

	dft_stack->this_tss = doublefault_tss;
	dft_stack->normal_tss = tss;

}

void __cpuinit init_nmi_tss(int cpu)
{
	struct tss_struct* tss = &per_cpu(init_tss, cpu);
	struct tss_struct* nmi_tss = &per_cpu(nmi_tsses, cpu);
	struct nmi_stack_struct* nmi_stack = &per_cpu(nmi_stacks, cpu);

	nmi_tss->x86_tss.sp = (unsigned long)(&(nmi_stack->__pad[0]) + 1);
	nmi_tss->x86_tss.sp0 = nmi_tss->x86_tss.sp;

	nmi_stack->this_tss = nmi_tss;
	nmi_stack->normal_tss = tss;
	nmi_stack->dft_tss_desc = &get_cpu_gdt_table(cpu)[GDT_ENTRY_DOUBLEFAULT_TSS].b;
	nmi_stack->need_nmi = 0;

}

static int NMI_is_set(void) {
	unsigned int cpu = smp_processor_id();

	if (per_cpu(nmi_stacks, cpu).need_nmi) {
		per_cpu(nmi_stacks, cpu).need_nmi = 0;
		return 1;
	}

	return 0;
}

void (*test_ISR_and_handle_interrupt)(void);

asmlinkage void do_interrupt_handling(void)
{
	if (NMI_is_set()) {
		__asm__ __volatile__ (
		"pushfl\n\t"
		"pushl %0\n\t"
		"pushl $0f\n\t"
		"jmp nmi\n\t"
		"0:\n\t"
		: : "i" (__KERNEL_CS)
		);
	}

	test_ISR_and_handle_interrupt();
}

#endif
