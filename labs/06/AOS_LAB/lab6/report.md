# Lab6 erport

## [练习0]	填写已有实验

使用系统中到meld工具，针对lab1/lab2/lab3/lab4/lab5中更改过的文件，进行代码更改。


## [练习1]	使用Round Robin调度算法(不需要编码)


【完成练习0后,建议大家比较一下(可用kdiff3等文件比较软件)个人完成的lab5和练习0完成后的刚修改的lab6之间的区别,分析了解lab6采用RR调度算法后的执行过程。执行make grade,大部分测试用例应该通过。但执行priority.c应该过不去。】


一.课程问题：

1.请理解并分析sched_calss中各个函数指针的用法，并接合Round Robin 调度算法描ucore的调度执行过程。

```
   主要到指针如下：
    struct sched_class default_sched_class = {
    .name = "stride_scheduler",
    .init = stride_init,
    .enqueue = stride_enqueue,
    .dequeue = stride_dequeue,
    .pick_next = stride_pick_next,
    .proc_tick = stride_proc_tick,
     };

     其中各函数指针到功能和用法如下：
    .init = stride_init,             //init在程序开始执行，所有进程创建之前被调用
    .enqueue = stride_enqueue,       //enqueue在进程加入就绪队列时被调用。
    .dequeue = stride_dequeue,       //dequeue在进程被移出就绪队列时被调用。
    .pick_next = stride_pick_next,   //pick_next在进程切换时被调用，用它的返回值作为切换到的进程。
    .proc_tick = stride_proc_tick,   //proc_tick在产生时钟中断时被调用。
    
    当发生时钟事件时，调用run_timmer_list()，其中会调用到proc_tick()更新时间片，还会唤醒需要唤醒的进程,用enqueue()将它们加入队列，如果需要重新调度，则设置need_resched，这会导致schedule()的调用——将当前进程加入队列,并从队列中选出下一个进程，将其从队列中删除.

```

2.请在实验报告中简要说明如何设计实现”多级反馈队列调度算法“，给出概要设计，鼓励给出详细设计

```
   要实现”多级反馈队列调度算法“，需要以下几个部分：
   1.	总调度器：队列列表是队列的总调度器，由它决定从哪个队列里pick_next作为切换到的进程。
   2.	多个队列：它的功能可能就是实现一个“Round Robin调度算法”或“Stride Scheduling调度算法”。
   3.	进程绑定：队列列表把一个进程绑定在哪个队列上，那么对这个进程的`enqueue`、`dequeue`都由相应的队列执行。
   4.	进程切换机制：发生`proc_tick`时，应该调用上一次选出切换进程的队列的`proc_tick`。

```


## [练习2]	实现 Stride Scheduling 调度算法

【首先需要换掉RR调度器的实现,即用default_sched_stride_c覆盖default_sched.c。然后根据此文件和后续文档对Stride度器的相关描述,完成Stride调度算法的实现。】

一.请在实验报告中简要说明你的设计实现过程
```
   实验的主要过程如下：
   1.	初始化：
	#if USE_SKEW_HEAP
    	    rq->lab6_run_pool = 0;
	#else
    	    list_init(&rq->run_list);
	#endif
   	    rq->proc_num = 0;
        队列内进程数量为0，根据宏初始化堆或链表

   2.	入队:
	#if USE_SKEW_HEAP
    	   rq->lab6_run_pool = skew_heap_insert(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
        #else
           list_add(&rq->run_list, &proc->run_link);
        #endif
	   proc->time_slice = rq->max_time_slice;
	   proc->rq = rq;
	   if (proc->lab6_priority == 0) proc->lab6_priority = 1;
	   rq->proc_num++;
	加入堆或链表，为进程分配时间片，同时更新调度队列中进程的总数量。（如果优先级未被初始化过，在加入队列时初始化它）

   3.	出队:
	#if USE_SKEW_HEAP
    	    rq->lab6_run_pool = skew_heap_remove(rq->lab6_run_pool, &(proc->lab6_run_pool), proc_stride_comp_f);
        #else
            list_del(&proc->run_link);
        #endif
            rq->proc_num--;
	从堆中删除或从链表中删除,同时更新调度队列中进程的总数量。

   4.	选取进程：
	#if USE_SKEW_HEAP
	    if (!rq->lab6_run_pool) return NULL;
	    struct proc_struct *p = le2proc(rq->lab6_run_pool, lab6_run_pool);
	#else
	    list_entry_t *le;
	    struct proc_struct *p = 0;
	    for (le = list_next(&rq->run_list); le != &rq->run_list; le = list_next(le)) {
		struct proc_struct *q = le2proc(le, run_link);
		if (!p || proc_stride_comp_f(&p->lab6_run_pool, &q->lab6_run_pool) == 1) p = q;
	    }
	#endif
	    if (p) p->lab6_stride += BIG_STRIDE / p->lab6_priority;
	    return p;
	如果使用左式堆，选取堆顶元素即可；否则，遍历链表中的元素，找出lab6_stride最小的进程。

   5.	中断：
	if (--proc->time_slice <= 0) proc->need_resched = 1;
        时间片减1，如果为0，进行重新调度。

```


## [实验分析]
实验五完成了用户进程的管理,可在用户态运行多个进程。但到目前为止,采用的调度策略是很简单的FIFO调度策略。本次实验,主要是熟悉ucore的系统调度器框架,以及基于此框架的Round-Robin(RR)调度算法。然后参考RR调度算法的实现,完成Stride	Scheduling调度算法。

一. 主要学习之处：
1. 熟悉ucore的系统调度器框架。
2. 熟悉了基于此框架的Round-Robin(RR)调度算法。
3. RR调度算法的实现。
4. Stride Scheduling调度算法的实现。
5. 多级反馈队列调度算法。
6. 左式堆（斜堆）

二. 认为有可以改善到地方：
	对左式堆的算法效率可以继续改善，目前效率较低。


## [与参考答案到区别]

1. 宏USE_SKEW_HEAP为1时，使用斜堆来优化调度算法，没有用到run_list，故可以在stride_init函数里不调用list_init(&rq->run_list)。
2. 不用左式堆，使用链表，可以复用斜堆的比较函数proc_stride_comp_f的代码。
