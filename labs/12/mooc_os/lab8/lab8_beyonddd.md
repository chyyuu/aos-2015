# OS Lab8 实验报告
#曹立P14206024
### 练习1
1.	<b>完成读文件操作的实现</b>

	> * (1) If offset isn't aligned with the first block, Rd/Wr some content from offset to the end of the first block<br/>
	NOTICE: useful function: sfs_bmap_load_nolock, sfs_buf_op<br/>
	Rd/Wr size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset)
	```
	if ((blkoff = offset % SFS_BLKSIZE) != 0) {
        size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) {
            goto out;
        }
        alen += size;
        if (nblks == 0) {
            goto out;
        }
        buf += size, blkno ++, nblks --;
    }
	```
	> * (2) Rd/Wr aligned blocks<br/>
	NOTICE: useful function: sfs_bmap_load_nolock, sfs_block_op
	```
	size = SFS_BLKSIZE;
    while (nblks != 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        if ((ret = sfs_block_op(sfs, buf, ino, 1)) != 0) {
            goto out;
        }
        alen += size, buf += size, blkno ++, nblks --;
    }
	```
	> * (3) If end position isn't aligned with the last block, Rd/Wr some content from begin to the (endpos % SFS_BLKSIZE) of the last block<br/>
	NOTICE: useful function: sfs_bmap_load_nolock, sfs_buf_op
	```
	if ((size = endpos % SFS_BLKSIZE) != 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) {
            goto out;
        }
        alen += size;
    }
	```

2.	<b>设计实现”UNIX的PIPE机制“的概要设方案</b>

	> * 可以基于信号量实现PIPE机制
	> * 建立管道的时候，给发送和接收的进程绑定同一个描述符，并在OS内核中记录这个描述符
	> * 新建与这个描述符对应的信号量
	> * 每次发送的进程发送信息到管道，OS内核会在内存中缓冲这部分内容
	> * 每次接收的进程从管道接收信息，OS内核会从缓冲中给予内容，否则进程进入阻塞

### 练习2
---
1.	<b>完成基于文件系统的执行程序机制的实现</b>
	
	> * (1) create a new mm for current process
	```
    struct mm_struct *mm;
    if ((mm = mm_create()) == NULL) {
        goto bad_mm;
    }
	```
	> * (2) create a new PDT, and mm->pgdir= kernel virtual addr of PDT
	```
	if (setup_pgdir(mm) != 0) {
        goto bad_pgdir_cleanup_mm;
    }
	```
	> * (3) copy TEXT/DATA/BSS parts in binary to memory space of process<br/>
	(3.1) read raw data content in file and resolve elfhdr<br/>
	(3.2) read raw data content in file and resolve proghdr based on info in elfhdr<br/>
	(3.3) call mm_map to build vma related to TEXT/DATA<br/>
	(3.4) callpgdir_alloc_page to allocate page for TEXT/DATA, read contents in file and copy them into the new allocated pages<br/>
	(3.5) callpgdir_alloc_page to allocate pages for BSS, memset zero in these pages
	```
	struct elfhdr __elf, *elf = &__elf;
    if ((ret = load_icode_read(fd, elf, sizeof(struct elfhdr), 0)) != 0) {
        goto bad_elf_cleanup_pgdir;
    }
    if (elf->e_magic != ELF_MAGIC) {
        ret = -E_INVAL_ELF;
        goto bad_elf_cleanup_pgdir;
    }
    struct proghdr __ph, *ph = &__ph;
    uint32_t vm_flags, perm, phnum;
    for (phnum = 0; phnum < elf->e_phnum; phnum ++) {
        off_t phoff = elf->e_phoff + sizeof(struct proghdr) * phnum;
        if ((ret = load_icode_read(fd, ph, sizeof(struct proghdr), phoff)) != 0) {
            goto bad_cleanup_mmap;
        }
        if (ph->p_type != ELF_PT_LOAD) {
            continue ;
        }
        if (ph->p_filesz > ph->p_memsz) {
            ret = -E_INVAL_ELF;
            goto bad_cleanup_mmap;
        }
        if (ph->p_filesz == 0) {
            continue ;
        }
        vm_flags = 0, perm = PTE_U;
        if (ph->p_flags & ELF_PF_X) vm_flags |= VM_EXEC;
        if (ph->p_flags & ELF_PF_W) vm_flags |= VM_WRITE;
        if (ph->p_flags & ELF_PF_R) vm_flags |= VM_READ;
        if (vm_flags & VM_WRITE) perm |= PTE_W;
        if ((ret = mm_map(mm, ph->p_va, ph->p_memsz, vm_flags, NULL)) != 0) {
            goto bad_cleanup_mmap;
        }
        off_t offset = ph->p_offset;
        size_t off, size;
        uintptr_t start = ph->p_va, end, la = ROUNDDOWN(start, PGSIZE);
        ret = -E_NO_MEM;
        end = ph->p_va + ph->p_filesz;
        while (start < end) {
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL) {
                ret = -E_NO_MEM;
                goto bad_cleanup_mmap;
            }
            off = start - la, size = PGSIZE - off, la += PGSIZE;
            if (end < la) {
                size -= la - end;
            }
            if ((ret = load_icode_read(fd, page2kva(page) + off, size, offset)) != 0) {
                goto bad_cleanup_mmap;
            }
            start += size, offset += size;
        }
        end = ph->p_va + ph->p_memsz;
        if (start < la) {
            /* ph->p_memsz == ph->p_filesz */
            if (start == end) {
                continue ;
            }
            off = start + PGSIZE - la, size = PGSIZE - off;
            if (end < la) {
                size -= la - end;
            }
            memset(page2kva(page) + off, 0, size);
            start += size;
            assert((end < la && start == end) || (end >= la && start == la));
        }
        while (start < end) {
            if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL) {
                ret = -E_NO_MEM;
                goto bad_cleanup_mmap;
            }
            off = start - la, size = PGSIZE - off, la += PGSIZE;
            if (end < la) {
                size -= la - end;
            }
            memset(page2kva(page) + off, 0, size);
            start += size;
        }
    }
    sysfile_close(fd);
	```
	> * (4) call mm_map to setup user stack, and put parameters into user stack
	```
	vm_flags = VM_READ | VM_WRITE | VM_STACK;
    if ((ret = mm_map(mm, USTACKTOP - USTACKSIZE, USTACKSIZE, vm_flags, NULL)) != 0) {
        goto bad_cleanup_mmap;
    }
    ```
    > * (5) setup current process's mm, cr3, reset pgidr (using lcr3 MARCO)
    ```
    mm_count_inc(mm);
    current->mm = mm;
    current->cr3 = PADDR(mm->pgdir);
    lcr3(PADDR(mm->pgdir));
    ```
    > * (6) setup uargc and uargv in user stacks
    ```
    uint32_t argv_size=0, i;
    for (i = 0; i < argc; i ++) {
        argv_size += strnlen(kargv[i],EXEC_MAX_ARG_LEN + 1)+1;
    }
    uintptr_t stacktop = USTACKTOP - (argv_size/sizeof(long)+1)*sizeof(long);
    char** uargv=(char **)(stacktop  - argc * sizeof(char *));
    argv_size = 0;
    for (i = 0; i < argc; i ++) {
        uargv[i] = strcpy((char *)(stacktop + argv_size ), kargv[i]);
        argv_size +=  strnlen(kargv[i],EXEC_MAX_ARG_LEN + 1)+1;
    }
    stacktop = (uintptr_t)uargv - sizeof(int);
    *(int *)stacktop = argc;
    ```
    > * (7) setup trapframe for user environment
    ```
    struct trapframe *tf = current->tf;
    memset(tf, 0, sizeof(struct trapframe));
    tf->tf_cs = USER_CS;
    tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
    tf->tf_esp = stacktop;
    tf->tf_eip = elf->e_entry;
    tf->tf_eflags = FL_IF;
    ret = 0;
    ```
    > * (8) if up steps failed, you should cleanup the env.
    ```
    out:
		return ret;
	bad_cleanup_mmap:
		exit_mmap(mm);
	bad_elf_cleanup_pgdir:
		put_pgdir(mm);
	bad_pgdir_cleanup_mm:
		mm_destroy(mm);
	bad_mm:
		goto out;
    ```

2.	<b>设计实现基于”UNIX的硬链接和软链接机制“的概要设方案</b>

	> * 硬链接：在文件的描述符中加入一个指针位和一个指针。当一个文件是硬链接时，指针位置为1，指针指向该硬链接链接的文件
	> * 软链接：拷贝文件对应的inode，复制一份相同的文件

