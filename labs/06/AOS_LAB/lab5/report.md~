# Lab5 erport

## [练习0]	填写已有实验

使用系统中到meld工具，针对lab1/lab2/lab3/lab4中更改过的文件，进行代码更改。


## [练习1]	加载应用程序并执行

【do_execv函数调用load_icode(位于kern/process/proc.c中)来加载并解析一个处于内存中的ELF执行文件格式的应用程序,建立相应的用户内存空间来放置应用程序的代码段、数据段等,且要设置好proc_struct结构中的成员变量trapframe中的内容,确保在执行此进程后,能够从应用程序设定的起始执行地址开始执行。需设置正确的trapframe内容。】

一.实现过程：
```
   加载应用程序需要正确地设置栈帧，具体需要注意一下：
     *		If we set trapframe correctly, then the user level process can return to USER MODE from kernel. So
     *          tf_cs should be USER_CS segment (see memlayout.h)
     *          tf_ds=tf_es=tf_ss should be USER_DS segment
     *          tf_esp should be the top addr of user stack (USTACKTOP)
     *          tf_eip should be the entry point of this binary program (elf->e_entry)
     *          tf_eflags should be set to enable computer to produce Interrupt
   至此，即完成了程序加载并执行。

```

二.课程问题：

1.请在实验报告中描述当创建一个用户态进程并加载了应用程序后,CPU是如何让这个应用程序最终在用户态执行起来的。即这个用户态进程被ucore选择占用CPU执行(RUNNING态)到具体执行应用程序第一条指令的整个经过。

```
   1.	执行switch_to切换进程之后，返回到fortret函数
   2.	调用fortrets，传递参数tf，执行iret的时候，返回到tf指向的位置，tf已经在load_icode中设置为用户态的段
   3.	返回到用户态，并开始执行用户态程序

```


## [练习2]	父进程复制自己的内存空间给子进程

【创建子进程的函数do_fork在执行中将拷贝当前进程(即父进程)的用户内存地址空间中的合法内容到新进程中(子进程),完成内存资源的复制。具体是通过copy_range函数(位于kern/mm/pmm.c中)实现的,请补充copy_range的实现,确保能够正确执行。】

一.请补充copy_range的实现，确保能够正确执行
```
   补充一下：
	void * kva_src = page2kva(page);
        void * kva_dst = page2kva(npage);
    
        memcpy(kva_dst, kva_src, PGSIZE);

        ret = page_insert(to, npage, start, perm);
   运行发现，结果正确。

```

二.请在实验报告中简要说明如何设计实现”Copy on Write 机制“，给出概要设计，鼓励给出详细设计。

```
   dup_mmap中复制mm_struct时，直接复制vma的指针，并将对应页的引用计数加一，把页设为只读。
   两个mm_struct共享同一份vma列表，不用真正到内存复制。
   发生缺页的时候，如果引用计数大于1，说明有多个进程共享同一个只读页。此时复制物理页（新构建的物理页引用计数为1，可写），让当前进程的页表指向新的页。
   原来的页的引用计数减一，如果减到了1，那么将那一页设为可写。
	
```


## [练习3]	阅读分析源代码，理解进程执行 fork/exec/wait/exit 的实现，以及系统调用的实现。


一.请分析fork/exec/wait/exit在实现中是如何影响进程的执行状态的？：
```
  主要有一下几个部分：
   1.	fork：创建一个新进程，复制父进程的当前状态，之后令新的进程状态为RUNNABLE；
   2.	exec：将进程的mm置为NULL，然后调用load_icode，将用户进程拷贝进来，为用户进程建立处于用户态的新的内存空间以及用户栈，然后转到用户态执行。 如果load_icode失败，则会调用do_exit退出；
   3.	wait：如果找到了符合条件的子进程，则回收子进程的资源并正常返回；否则如果子进程正在运行，则通过schedule让自己变为SLEEPING，等到下次被唤醒的时候再去寻找子进程；
   4.	exit：首先回收大部分资源，并将当前进程设成ZOMBIE状态，然后查看父进程，如果在等待状态，则唤醒父进程； 接着遍历自己的子进程，把他们的父进程均设置为initproc，如果子进程有ZOMBIE状态且initproc为等待状态则唤醒initproc。

```

二.请给出ucore中一个用户态进程的执行状态生命周期图（包执行状态，执行状态之间的变换关系，以及产生变换的事件或函数调用）。（字符方式画即可）：

```
                              do_fork                       schedule                         do_exit
            PROC_UNINIT(创建) -------->PROC_RUNNABLE(就绪)----------------->PROC_RUNNING(运行)-------->PROC_ZOMBIE(结束)
					       ^				   |
                                   	       |wakeup	                           |do_wait
                                               ----------PROC_SLEEPING(等待)<-------
	
```


## [实验分析]
实验4完成了内核线程,但到目前为止,所有的运行都在内核态执行。实验5将创建用户进程,让用户进程在用户态执行,且在需要ucore支持时,可通过系统调用来让ucore提供服务。为此需要构造出第一个用户进程,并通过系统调用sys_fork/sys_exec/sys_exit/sys_wait来支持运行不同的应用程序,完成对用户进程的执行过程的基本管理。


一. 主要学习之处：
1. 创建用户进程。
2. 用户进程在用户态执行。
3. 用户态虚拟内存的管理。
4. 进程控制块中与内存管理。

二. 与原理课区别：
	原理课主要讲fork等的行为以及结果，实验中是fork的具体实现等。

