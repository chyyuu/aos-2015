/*
 * Copyright 2003 Toshiyuki Maeda
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

/*
 * These are macros for making kml_call_table.
 *
 * This file should be included only from the "sys_call_table_maker.h" file.
 */

#ifdef CONFIG_KERNEL_MODE_LINUX

.macro kml_push_args argnum
.ifeq \argnum
addl $-4, %esp
.endif
.ifeq \argnum - 1
pushl %ebx
.endif
.ifeq \argnum - 2
pushl %ecx
kml_push_args 1
.endif
.ifeq \argnum - 3
pushl %edx
kml_push_args 2
.endif
.ifeq \argnum - 4
pushl %esi
kml_push_args 3
.endif
.ifeq \argnum - 5
pushl %edi
kml_push_args 4
.endif
.ifeq \argnum - 6
pushl (%ebp)
kml_push_args 5
.endif
.endm

#define MAKE_KMLCALL(entry, argnum, syscall_num) \
.ifndef kml_ ## argnum; \
.text; \
ENTRY(kml_ ## argnum); \
	pushl %eax; \
	pushl %edx; \
	pushl %ecx; \
	pushl %ebp; \
	movl %esp, %ebp; \
	movl PER_CPU_VAR(esp0), %esp; \
\
	kml_push_args argnum; \
\
	leal sys_call_table(,%eax,4), %ecx; \
	call *(%ecx); \
\
	GET_THREAD_INFO(%edx); \
	leave; \
\
	movl TI_flags(%edx), %ecx; \
	testl $_TIF_ALLWORK_MASK, %ecx; \
	popl %ecx; \
	popl %edx; \
	jne 0f; \
	addl $4, %esp; \
	ret; \
0:; \
	pushl %ecx; \
	movl 4(%esp), %ecx; \
	movl %eax, 4(%esp); \
	movl %ecx, %eax; \
	popl %ecx; \
	pushfl; \
	pushl %cs; \
	pushl $kml_wrapper_int_post; \
	jmp kml_exit_work; \
.endif; \
kml_ ## entry = kml_ ## argnum

#define MAKE_KMLCALL_SPECIAL(entry, argnum, syscall_num) \
kml_ ## entry = kml_special

ENTRY(kml_special)
	add $-4, %esp
	pushfl
	pushl %cs
	pushl $kml_wrapper_int_post
	jmp system_call

/* generic routines for kml call's exit */
ENTRY(kml_exit_work)
	RING0_INT_FRAME
	SWITCH_STACK_TO_KK_EXCEPTION

	pushl %eax
	CFI_ADJUST_CFA_OFFSET 4
	SAVE_ALL

	movl PT_OLDESP(%esp), %eax
	movl (%eax), %eax
	movl %eax,PT_EAX(%esp)             # store the return value

	GET_THREAD_INFO(%ebp)
	jmp syscall_exit
	CFI_ENDPROC

kml_wrapper_int_pre:
	int $0x80
kml_wrapper_int_post:
	addl $4, %esp
	ret

ENTRY(kml_sigreturn_shortcut)
	popl %eax
	movl $119, %eax		# 119 == __NR_sigreturn
	jmp return_wrapper

ENTRY(kml_rt_sigreturn_shortcut)
	movl $173, %eax		# 173 == __NR_rt_sigreturn
return_wrapper:
	movl %fs, %edx
	movl $__KERNEL_PERCPU, %ecx
	movl %ecx, %fs
	movl %esp, %ecx
	movl PER_CPU_VAR(esp0), %esp
	movl %edx, %fs

	addl $-4, %esp			# XSS
	pushl %ecx			# ESP
	pushfl				# EFLAGS
	pushl $(__KU_CS_EXCEPTION)	# XCS
	addl $-4, %esp			# EIP

	pushl %eax			# orig_eax
	addl $-44, %esp			# SAVE_ALL

	GET_THREAD_INFO(%ebp)
	jmp syscall_call

#endif
