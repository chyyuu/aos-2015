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
 * These are macros for making direct_call_table.
 *
 * This file should be included only from the "sys_call_table_maker.h" file.
 */

#ifdef CONFIG_KERNEL_MODE_LINUX

.macro direct_prepare_stack argnum
.if \argnum
addl $-(4 * \argnum), %esp
.else
addl $-4, %esp
.endif
.endm

.macro direct_push_args argnum
.if \argnum
direct_push_args "(\argnum - 1)"
movl (12 + (\argnum - 1) * 4)(%ebp), %eax
movl %eax, ((\argnum - 1) * 4)(%esp)
.endif
.endm

#define MAKE_DIRECTCALL(entry, argnum, syscall_num) \
.text; \
ENTRY(direct_ ## entry); \
	pushl %ebp; \
	movl %esp, %ebp; \
	movl PER_CPU_VAR(esp0), %esp; \
\
	direct_prepare_stack argnum; \
	direct_push_args argnum; \
\
	call entry; \
\
	GET_THREAD_INFO(%edx); \
	leave; \
\
	movl TI_flags(%edx), %ecx; \
	testl $_TIF_ALLWORK_MASK, %ecx; \
	jne 0f; \
	ret; \
0:; \
	pushl %eax; \
	pushl %ebx; \
	pushl %edi; \
	pushl %esi; \
	pushl %ebp; \
	movl $(syscall_num), %eax; \
	jmp direct_exit_work_ ## argnum;

#define MAKE_DIRECTCALL_SPECIAL(entry, argnum, syscall_num) \
.text; \
ENTRY(direct_ ## entry); \
	pushl %ebx; \
	pushl %edi; \
	pushl %esi; \
	pushl %ebp; \
	add $-4, %esp; \
\
	movl $(syscall_num), %eax; \
\
	call direct_special_work_ ## argnum; \
\
	pushfl; \
	pushl %cs; \
	pushl $direct_wrapper_int_post; \
	jmp system_call;

direct_wrapper_int_pre:
	int $0x80
direct_wrapper_int_post:
	addl $4, %esp
	popl %ebp
	popl %esi
	popl %edi
	popl %ebx
	ret

direct_exit_work_6:
	movl 48(%esp), %ebp
direct_exit_work_5:
	movl 44(%esp), %edi
direct_exit_work_4:
	movl 40(%esp), %esi
direct_exit_work_3:
	movl 36(%esp), %edx
direct_exit_work_2:
	movl 32(%esp), %ecx
direct_exit_work_1:
	movl 28(%esp), %ebx
direct_exit_work_0:
	pushfl
	pushl %cs
	pushl $direct_wrapper_int_post
	jmp kml_exit_work

direct_special_work_6:
	movl 52(%esp), %ebp
direct_special_work_5:
	movl 48(%esp), %edi
direct_special_work_4:
	movl 44(%esp), %esi
direct_special_work_3:
	movl 40(%esp), %edx
direct_special_work_2:
	movl 36(%esp), %ecx
direct_special_work_1:
	movl 32(%esp), %ebx
direct_special_work_0:
	ret

#endif
