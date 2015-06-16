# OS Lab5 实验报告   曹立_P14106024
### 练习0
---
1. 	<b>添加lab1~lab4原有代码，并进行适当更新。</b>
 	
	> * alloc_proc() in proc.c
	```
	proc->wait_state = 0;
	proc->cptr = proc->optr = proc->yptr = NULL;	
	```

	> * do_fork() in proc.c
	```
	bool intr_flag;
   	 local_intr_save(intr_flag);
    	{
       	proc->pid = get_pid();
        hash_proc(proc);
        set_links(proc);
    	}
    	local_intr_restore(intr_flag);
	```
	> * idt_init() in trap.c
	```
	 extern uintptr_t __vectors[];
   	 int i;
    	for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
        	SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    	}
    	SETGATE(idt[T_SYSCALL], 1, GD_KTEXT, __vectors[T_SYSCALL], DPL_USER);
    	lidt(&idt_pd);
	```
	> * trap_dispatch() in trap.c
	```
	ticks ++;
        if (ticks % TICK_NUM == 0) {
            assert(current != NULL);
            current->need_resched = 1;
        }
	```

### 练习1
---
1.	<b>加载应用程序并执行。</b>

	> * 根据提示填写代码
	```
	tf->tf_cs = USER_CS;
    	tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
    	tf->tf_esp = USTACKTOP;
    	tf->tf_eip = elf->e_entry;
    	tf->tf_eflags = FL_IF;
	```
	
2.	<b>描述当创建一个用户态进程并加载了应用程序后，CPU是如何让这个应用程序最终在用户态执行起来的。即这个用户态进程被ucore选择占用CPU执行（RUNNING态）到具体执行应用程序第一条指令的整个经过。</b>
	> * 当一个用户态进程被创建并加载了应用程序后，它会调用kernel_execve产生一个SYS_exec的系统调用。在trap中处理了这个系统调用，调用了sys_exec，进一步调用了do_execve。在do_execve中完成了对旧内存空间、旧页表等的释放，并调用load_icode来加载ELF格式的程序X。load_icode中，完成了对ELF文件的读取、页表的建立、堆栈的建立等初始化，此时用户态进程属于就绪状态。
	> * 等到该用户进程被调度到时，在进程切换switch中context中的eip指向了forkret，在forkret中调用了trapentry.S中的__trapret，其中调用了iret。然而在load_icode中trap_frame的参数已经被设置成了用户态的相关值，则调用iret后系统进入了用户态。 在load_icode中trap_frame的指令指针eip已经对应了新的程序X的第一条指令，这时程序就会从X的第一条指令开始执行，直到被调度

### 练习2
---
1.	<b>补充copy_range的实现，确保能够正确执行。</b>

	> * 根据提示补全代码
	```
	void *src_kvaddr = page2kva(page);
	void *dst_kvaddr = page2kva(npage);
	memcpy(dst_kvaddr, src_kvaddr, PGSIZE);
	ret = page_insert(to, npage, start, perm);
	```
	
2.	<b>简要说明如何设计实现"Copy on Write机制"</b>
	> * 对于一个操作看究竟是否改变了内存的当中的内容，如果改变了是内存的当中的操作，使用一个结构体，首先是建立一个新的内存空间和页表，这个结构体存储的是对应的关系，一个用户对应一个存储的页表的首地址，这样可以保证一个使用者只能找到它对应的资源并进行使用，而其他的使用者并不能看到这一段资源。

### 练习3
---
1.	<b>请分析fork/exec/wait/exit在实现中是如何影响进程的执行状态的</b>

	> * fork:fork函数实现的是进程的创建过程，它从父进程进行赋值生成了一个子进程
	> * exec:exe函数实现的是函数是把进程进行运行的函数，它通过load_icode等可以进行把进程设置为运行的过程
	> * wait:wait函数可以把进程设置为等待状态
	> * exit:进程退出或者被杀死
	
2.	<b>请给出ucore中的一个用户进程的执行状态生命周期图</b>
```
-----------------------------
process state changing:
                                            
  alloc_proc                                 RUNNING
      +                                   +--<----<--+
      +                                   + proc_run +
      V                                   +-->---->--+ 
PROC_UNINIT -- proc_init/wakeup_proc --> PROC_RUNNABLE -- try_free_pages/do_wait/do_sleep --> PROC_SLEEPING --
                                           A      +                                                           +
                                           |      +--- do_exit --> PROC_ZOMBIE                                +
                                           +                                                                  + 
                                           -----------------------wakeup_proc----------------------------------
-----------------------------
```

