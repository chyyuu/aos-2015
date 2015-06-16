/*
 * Copyright 2002 Toshiyuki Maeda
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
 * These are macros for making kml_call_table and direct_call_table.
 *
 * This file should be included only from the "kml_call_table_32.h" file.
 */

#ifdef CONFIG_KERNEL_MODE_LINUX

#include "kml_call_32.h"
#include "direct_call_32.h"

#define SYSCALL_TABLE_BEGIN \
.data 0; \
ENTRY(kml_call_table); \
.data 1; \
ENTRY(direct_call_table); \
.data 0;

/*
 * entry.S is compiled with the "-traditional" option.
 * So, we perform an old-style concatenation instead of '##'!
 */
#define SYSCALL_ENTRY(nr,name,argnum,entry,compat) \
.ifndef kml_ ## entry; \
MAKE_KMLCALL(entry,argnum,nr); \
.endif; \
.data 0; \
.long kml_ ## entry; \
.ifndef direct_ ## entry; \
MAKE_DIRECTCALL(entry,argnum,nr); \
.endif; \
.data 1; \
.long direct_ ## entry; \
.data 0;

#define SYSCALL_ENTRY_SPECIAL(nr,name,argnum,entry,compat) \
.ifndef kml_ ## entry; \
MAKE_KMLCALL_SPECIAL(entry,argnum,nr); \
.endif; \
.data 0; \
.long kml_ ## entry; \
.ifndef direct_ ## entry; \
MAKE_DIRECTCALL_SPECIAL(entry,argnum,nr); \
.endif; \
.data 1; \
.long direct_ ## entry; \
.data 0;

#endif
