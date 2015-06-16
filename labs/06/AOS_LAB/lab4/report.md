# Lab4 erport

## [练习0]	填写已有实验

使用系统中到meld工具，针对lab1/lab2/lab3中更改过的文件，进行代码更改。


## [练习1]	分配并初始化一个进程块

【完alloc_proc函数(位于kern/process/proc.c中)负责分配并返回一个新的struct	proc_struct结构,用于存储新建立的内核线程的管理信息。ucore需要对这个结构进行最基本的初始化,你需要完成这个初始化过程。】

一.实现过程：
```
   根据提示，对新的线程分配一个TCB(struct proc_struct)，做初始化工作如下：
	proc->state = PROC_UNINIT;
        proc->pid = -1;
        proc->runs = 0;
        proc->kstack = 0;
        proc->need_resched = 0;
        proc->parent = NULL;
        proc->mm = NULL;
        memset(&(proc->context), 0, sizeof(struct context));
        proc->tf = NULL;
        proc->cr3 = boot_cr3;
        proc->flags = 0;
        memset(proc->name, 0, PROC_NAME_LEN);
   至此，即完成了对于TCB到的初始化工作。

```

二.课程问题：

1.请说明proc_struct中struct context context和struct trapframe *tf成员变量含义和在本实验中的作用是啥?(提示通过看代码和编程调试可以判断出来)


```
   1.	struct context context：
    表示进程的上下文，用于进程切换。在ucore中，进程在内核中相对独立，独立到内核堆栈和上下文。使用 context保存寄存器的目的就在于在内核态中能够进行上下文之间的切换。
    在kern/process/switch.S中switch_to就是对context函数进行上下文切换的。

   2.	struct trapframe *tf：
    中断帧的指针，指向内核栈的某个位置，当进程由用户跳到内核时，中断帧记录了进程在被中断前的状态。当内核需要跳回用户时，需要调整中断帧以恢复让进程继续执行的各寄存器值。除此之外，ucore内核允许嵌套中断。因此为了保证嵌套中断发生时tf 总是能够指向当前的trapframe，ucore 在内核栈上维护了tf的链。

```

三.与答案区别：

```
   在初始化过程中和答案基本一致，同时在完成过程中，查相关资料，发现也有在实现过程中，memset(&(proc->name),0,PROC_NAME_LEN);
   对于这个数组name而言，加不加&其实都是首地址。

```

## [练习2]	为新创建的内核线程分配资源

【创建一个内核线程需要分配和设置好很多资源。kernel_thread函数通过调用do_fork函数完成具体内核线程的创建工作。do_kernel函数会调用alloc_proc函数来分配并初始化一个进程控制块,但alloc_proc只是找到了一小块内存用以记录进程的必要信息,并没有实际分配这些资源。ucore一般通过do_fork实际创建新的内核线程。do_fork的作用是,创建当前内核线程的一个副本,它们的执行上下文、代码、数据都一样,但是存储位置不同。在这个过程中,需要给新内核线程分配资源,并且复制原进程的状态。你需要完成在kern/process/proc.c中的do_fork函数中的处理过程。它的大致执行步骤包括:
	调用alloc_proc,首先获得一块用户信息块。
	为进程分配一个内核栈。
	复制原进程的内存管理信息到新进程(但内核线程不必做此事)
	复制原进程上下文到新进程
	将新进程添加到进程列表
	唤醒新进程
	返回新进程号
】

一.实现过程：
```
   该问题即为补充好do_fork函数，//后为补全代码的含义，补全如下：
	    if ((proc = alloc_proc()) == NULL) {    //使用alloc_proc函数分配一个TCB，如果失败则跳到fork_out返回错误码E_NO_MEM
		goto fork_out;
	    }
	    proc->parent = current;                 //将子进程的parent设为当前进程current
	    if (setup_kstack(proc) != 0) {          //使用setup_kstack函数为线程分配内核堆栈，如果失败则跳到bad_fork_cleanup_proc释放TCB
		goto bad_fork_cleanup_proc;
	    }
	    if (copy_mm(clone_flags, proc) != 0) {  //使用copy_mm函数为线程分配存储空间，如果失败则跳到bad_fork_cleanup_kstack释放内核堆栈与TCB
		goto bad_fork_cleanup_kstack;
	    }
	    copy_thread(proc, stack, tf);           //使用copy_thread函数设置线程的trapframe、context和线程入口，这里使能中断并将子进程的fork返回值设为0(eax)
	    bool intr_flag;
	    local_intr_save(intr_flag);             //中断
	    {
		proc->pid = get_pid();
		hash_proc(proc);
		list_add(&proc_list, &(proc->list_link));  
		nr_process ++;
	    }
	    local_intr_restore(intr_flag);          //先关中断，然后get_pid为线程分配一个唯一的id、将该线程加入相应的hash链表与线程链表、nr_process+1(总的线程数量+1)，最后开中断
	    wakeup_proc(proc);                    //使用wakeup_proc函数将该线程设为就绪状态
	    ret = proc->pid;                      //将线程的pid作为返回值
    至此即完成了do_fork函数到补全。

```

二.课程问题：
   
请说明ucore是否做到给每个新fork的线程一个唯一的id?请说明你的分析和理由。

```
   该函数到注释：get_pid - alloc a unique pid for process，可以看出ucore给每个新的fork的线程一个唯一到id。
   对每一个fork的线程进行id的分配的时候，是利用get_pid()函数来进行分配的，该函数对链表进行遍历来确定要分配给线程的id，确保了是唯一的。
	
```

三.与答案区别：

```
   在实验中为了看出总进程数，在nr_process++之后添加里打印操作，方便调试分析：
	cprintf("nr_process: %d",nr_process);

```

## [练习3]	阅读代码,理解proc_run函数和它调用的函数如何完成进程切换的。

【请在实验报告中简要说明你对proc_run函数的分析。并回答如下问题:】

一.对proc_run函数的分析：
```
   我们可以在proc.c文件中找到proc_run函数：
	    proc_run(struct proc_struct *proc) {
	    if (proc != current) {
		bool intr_flag;
		struct proc_struct *prev = current, *next = proc;
		local_intr_save(intr_flag);
		{
		    current = proc;
		    load_esp0(next->kstack + KSTACKSIZE);
		    lcr3(next->cr3);
		    switch_to(&(prev->context), &(next->context));
		}
		local_intr_restore(intr_flag);
	    }
	}
   当进行线程切换时，先进行中断的关闭，然后切换，最后开启中断。具体过程如下：
   	a. 让current指向next；
	b. 设置任务状态段ts中特权态0下的栈顶指针esp0为next内核线程的内核栈的栈顶，即切换内核堆栈；
	c. 设置CR3寄存器的值为next内核线程的页目录表起始地址next->cr3，完成进程间的页表切换；
	d. 由switch_to函数完成具体的两个线程的执行现场切换，即切换各个寄存器，当switch_to函数执行完“ret”指令后，就切换到next执行了。当执行switch_to函数并返回后，current将执行其实际上的执行入口地址forkret。而forkret会调用位于kern/trap/trapentry.S中的forkrets函数执行。forkrets函数首先把esp指向当前进程的中断帧，从_trapret开始执行到iret前，esp指向了current->tf.tf_eip。


```

二.课程问题：
   
请在实验报告中简要说明你对proc_run函数的分析。并回答如下问题:

```
   1.	在本实验的执行过程中,创建且运行了几个内核线程?
     2个,线程0是idleproc，线程1是initproc。同时，在do_fork函数中添加的cprintf函数输出总到线程数也是2个。


   2.	语句local_intr_save(intr_flag);....local_intr_restore(intr_flag);在这里有何作用?请说明理由。
     a.作用：进行中断的关闭与开启。
     b.理由：由于中断处理程序运行期间是不能发生进程切换的，同时中断的内核控制路径在恢复时需要的所有数据都存放在被中断进程的内核栈中，如果发生了进程切换，那么在恢复时就找不到之前的那个进程，所以也就不能够获得那个进程的内核栈中的数据，使得中断能够正确的退出。
	
```


## [实验分析]
本次实验将首先接触的是内核线程的管理。内核线程是一种特殊的进程,内核线程与用户进程的区别有两个:内核线程只运行在内核态而用户进程会在在用户态和内核态交替运行;所有内核线程直接使用共同的ucore内核内存空间,不需为每个内核线程维护单独的内存空间而用户进程需要维护各自的用户内存空间。


一. 主要学习之处：
1. PCB/TCB的分配及其各个属性的设置。
2. 进程的状态：创建、可运行、等待、僵尸。
3. 进程创建、加载、切换。
4. fork时对TCB进行分配、初始化、各个属性设置。
5. 中断在进程切换时操作。

二. 未涉及知识：
进程的挂起与激活、线程到就绪和等待队列、进程到运行和等待队列等。

