#Linux4.0.4 配置文件解析
###P14206035 刘学
 * [1.配置解析](#1)
 * [2.linux中断机制](#2)
 * [3.linux RCU机制](#3)
 * [4.镜像文件进一步压缩](#4)
 * [5.实验中遇到的问题及解决办法](#5)
 
这篇文档介绍的是编译[Linux4.0.4][6]源码时的部分配置文件的说明文档,参考的配置文件[myconfig2][1]的1-232行，该配置条件下可保证完成内核的上网功能。主要包含编译的基本配置，General setup（常规配置），IRQ Subsystem(中断请求子系统)，Timers subsystem(软件定时器)，CPU/Task time and stats accounting（CPU/进程的时间及状态统计），RCU Subsystem和Kernel Performance Events And Counters的配置。涉及的核心是中断和锁机制的配置。

   在完成配置分析的基础上，又分析了Linux的中断机制，然后根据配置的含义修改了部分的配置，使形成的内核从890KB减小到814KB。

<h1 id="1">配置解析</h1>


##6-41行中比较重要的配置

    CONFIG_X86_32=y
    CONFIG_X86=y
    #以上说明编译的内核是32位的

    CONFIG_LOCKDEP_SUPPORT=y
    #调试/检测模块，其对提前发现死锁起到效果，初始化时锁定大内核。

    CONFIG_STACKTRACE_SUPPORT=y
	#堆栈跟踪。

    CONFIG_HAVE_LATENCYTOP_SUPPORT=y
	#Latencytop通过在内核上下文切换的时候，记录被切换的进程的内核栈，然后通过匹配内核栈的
	#函数来判断是什么原因导致上下文切换，同时他把几十种容易引起切换的场景的函数都记录起来，
	#这样在判断系统问题的时候能容易定位到问题。latencytop分成2个部分，内核部分和应用部分。
	#内核部分负责调用栈的收集并且通过/proc来暴露， 应用部分负责显示
	
    CONFIG_MMU=y
	#MMU（Memory Management Unit）是内存管理单元，它是中央处理器（CPU）中用来管理虚拟存储
	#器、物理存储器的控制线路，同时也负责虚拟地址映射为物理地址	

    CONFIG_NEED_SG_DMA_LENGTH=y
	#sg DMA length:用一个链表描述物理不连续的存储器
    CONFIG_GENERIC_ISA_DMA=y
    CONFIG_GENERIC_HWEIGHT=y
	#支持 generic_hweight函数，函数作用：字串中非0符号的个数

    CONFIG_ARCH_MAY_HAVE_PC_FDC=y
    CONFIG_RWSEM_XCHGADD_ALGORITHM=y
	#优化CPU效率。函数可以计算出cpu在一秒钟内执行了多少次一个极短的循环
    CONFIG_GENERIC_CALIBRATE_DELAY=y
	#calibrate_delay（）函数可以计算出cpu在一秒钟内执行了多少次一个极短的循环，这个函数
	#实质是linux内核中一个cpu性能测试函数

    CONFIG_ARCH_HAS_CPU_RELAX=y
	#cpu_relax():不做事，只是在用时间。延时函数。锁机制会使用
    CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
	#CPU从内存load数据是一次一个cache line；往内存里面写也是一次一个cache line，读写必
	须。

    .....
    CONFIG_ARCH_HIBERNATION_POSSIBLE=y
	#支持休眠机制。

    CONFIG_ARCH_SUSPEND_POSSIBLE=y
    CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
    CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
	#大页面机制。
    CONFIG_ZONE_DMA32 is not set
	#ZONE_DMA32常量来枚举系统中的所有内存域，在64位机器上才有区别，32位，不用指派。

    CONFIG_AUDIT_ARCH is not set
	#审计功能，记录日志，不是必须。

    CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
    CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
	#内核调试，不使用该选项时，释放的内存页将从内核地址空间中移出。使用该选项后，内核推迟移 
	#出内存页的过程，因此能够发现内存泄漏的错误

    CONFIG_X86_32_LAZY_GS=y
    CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-ecx -fcall-saved-edx"
	#预定义变量，HWEIGHT32（）函数需要。
    CONFIG_ARCH_SUPPORTS_UPROBES=y
	#Uprobes与Kprobes类似,但主要用于用户空间的调试

    CONFIG_FIX_EARLYCON_MEM=y
    CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
    CONFIG_IRQ_WORK=y
    CONFIG_BUILDTIME_EXTABLE_SORT=y
	#该函数对异常调用表进行重新排序。

##43-71General setup分析
    CONFIG_BROKEN_ON_SMP=y
	#支持在多处理器上的终端

    CONFIG_INIT_ENV_ARG_LIMIT=32
    CONFIG_CROSS_COMPILE=""
	#支持在多处理器上的终端

    # CONFIG_COMPILE_TEST is not set
    CONFIG_LOCALVERSION=""
    # CONFIG_LOCALVERSION_AUTO is not set
    CONFIG_HAVE_KERNEL_GZIP=y
    ....
    CONFIG_HAVE_KERNEL_LZ4=y
    # CONFIG_KERNEL_GZIP is not set
    # CONFIG_KERNEL_BZIP2 is not set
    # CONFIG_KERNEL_LZMA is not set
    CONFIG_KERNEL_XZ=y
	#内核镜像要用的压缩模式 添加gz支持，与形成的镜像文件一致。故其它文件可格式可不用定义
    # CONFIG_KERNEL_LZO is not set
    # CONFIG_KERNEL_LZ4 is not set
    CONFIG_DEFAULT_HOSTNAME="(none)"
    # CONFIG_SYSVIPC is not set
    # CONFIG_POSIX_MQUEUE is not set
    # CONFIG_CROSS_MEMORY_ATTACH is not set
	#交叉内存支持,也就是process_vm_readv()和process_vm_writev()系统调用支持.从而允许有权
	#限的进程直接读取/写入另外一个进程的地址空间.现在它们只用于openMPI快速进程通信,也可以用于
	#调试程序.

    ....
    CONFIG_HAVE_ARCH_AUDITSYSCALL=y
	#对系统调用进行审计.

##73-87行IRQ subsystem
    CONFIG_GENERIC_IRQ_PROBE=y
	#probe：探测，获取设备号
    CONFIG_GENERIC_IRQ_SHOW=y
	#共享IRQ的硬件支持
    CONFIG_IRQ_FORCED_THREADING=y
	#支持线程强制中断
    CONFIG_SPARSE_IRQ=y
	#支持稀有终端编号
    CONFIG_CLOCKSOURCE_WATCHDOG=y
	#时钟源挂载在WATCHDOG链表上
    CONFIG_ARCH_CLOCKSOURCE_DATA=y
	#WATCHDOG链表
	
    CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
    CONFIG_GENERIC_TIME_VSYSCALL=y
    CONFIG_GENERIC_CLOCKEVENTS=y
    CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
    CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
	#定时器支持
    CONFIG_GENERIC_CMOS_UPDATE=y

##89-95行Timers subsystem
    CONFIG_HZ_PERIODIC=y
	#无论CPU是否需要,都强制按照固定频率不断触发时钟中断.这是最耗电的方式,不推荐使用
    # CONFIG_NO_HZ_IDLE is not set
	#CPU在空闲状态时不产生不必要的时钟中断,以使处理器能够在较低能耗状态下运行以节约
	电力,适合于大多数场合
    # CONFIG_NO_HZ is not set
    # CONFIG_HIGH_RES_TIMERS is not set

##97-103行CPU/Task time and stats accounting
    CONFIG_TICK_CPU_ACCOUNTING=y
    #简单的基于滴答的统计,适用于大多数场合
    # CONFIG_IRQ_TIME_ACCOUNTING is not set
    #通过读取TSC时间戳进行统计,这是统计进程IRQ时间的更细粒度的统计方式,但对性能有些
	不良影响(特别是在RDTSC指令速度较慢的CPU上).
    # CONFIG_BSD_PROCESS_ACCT is not set
    #用户空间程序可以要求内核将进程的统计信息写入一个指定的文件,主要包括进程的创建时
	间/创建者/内存占用等信息.
    # CONFIG_TASKSTATS is not set
    #通过netlink接口向用户空间导出进程的统计信息

##105-160行RCU Subsystem
    CONFIG_TINY_RCU=y
    # 最简单的实现,能够大幅降低RCU系统的内存占用.最适用于单CPU的非实时系统
    CONFIG_SRCU=y
    # 支持RCU
    ...
    CONFIG_LOG_BUF_SHIFT=17
    # 设置内核日志缓冲区的大小: 12(最小值)=4KB,...,16=64KB,17=128KB,
	# 18=256KB,...,21(最大值)=2048KB
    CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
    #sched_clock()函数来获取当前的CPU时间
    ...
    CONFIG_BLK_DEV_INITRD=y
    #初始内存文件系
    CONFIG_INITRAMFS_SOURCE=""
    #指明用来制作initramfs镜像的原料
    CONFIG_RD_GZIP=y
    #支持经过gzip压缩的ramdisk或cpio镜像
    ...
    CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    #编译时优化内核尺寸(使用GCC的"-Os"而不是"-O2"参数编译),
    CONFIG_SYSCTL=y
    #二进制sysctl接口支持.，,建议关闭它以减小内核尺寸.
    CONFIG_ANON_INODES=y
    CONFIG_HAVE_UID16=y
    CONFIG_SYSCTL_EXCEPTION_TRACE=y
    #异常追踪
    CONFIG_HAVE_PCSPKR_PLATFORM=y
    #主板上的蜂鸣器支持.主板上的蜂鸣器只能发出或长或短的"滴"或"嘟嘟"声,
	#一般用于系统报警.不要和能够播放音乐的扬声器混淆.
    CONFIG_BPF=y
    #包匹配模块,用于匹配那些让过滤器返回非零值的包.
    CONFIG_EXPERT=y
    # 开启会导致CONFIG_DEBUG_KERNEL强制开启
    ....
    CONFIG_PRINTK=y
    #允许内核向终端打印字符信息.如果关闭,内核在初始化过程中将不会输出字符
	#信息,这会导致很难诊断系统故障.仅在你确实不想看到任何内核信息时选"N".
	#否则请选"Y".
	....
    CONFIG_PCI_QUIRKS=y
    #开启针对多种PCI芯片组的错误规避功能,仅在确定你的PCI芯片组确实没有任何
	#bug时才关闭此功能.
    CONFIG_EMBEDDED=y
    CONFIG_HAVE_PERF_EVENTS=y

##162-215行RCU Subsystem
    CONFIG_PERF_EVENTS=y
    #子系统进行了抽象,提供了针对每个进程和每个CPU的计数器
    # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
    #调试vmalloc代码
    # CONFIG_VM_EVENT_COUNTERS is not set
    #虚拟内存的各种统计信息
    # CONFIG_SLUB_DEBUG is not set
    #SLUB调试支持,禁用后可显著降低内核大小
    # CONFIG_COMPAT_BRK is not set
    # 禁用堆随机化(heap randomization)功能.堆随机化可以让针对堆溢出的攻击变得困难
    # CONFIG_SLAB is not set
    CONFIG_SLUB=y
    #slab内存分配器,在大多数情况下都具有良好的适应性
    # CONFIG_SLOB is not set
    #SLOB针对小型系统设计,做了非常激进的简化,以适用于内存非常有限(小于64M)的嵌入式环境.
    # CONFIG_PROFILING is not set
    #添加扩展的性能分析支持,可以被OProfile之类的工具使用.仅用于调试目的
    CONFIG_HAVE_OPROFILE=y
    CONFIG_OPROFILE_NMI_TIMER=y
    #OPROFILE：支持Linux内核支持的一种性能分析机制
    # CONFIG_JUMP_LABEL is not set
    # 针对内核中某些"几乎总是为真"或者"几乎总是为假"的条件分支判断使用"asm goto"进行优化
    # CONFIG_UPROBES is not set
    # Uprobes与Kprobes类似,但主要用于用户空间的调试.
    # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
    CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
    # 条件编译宏，控制异或操作，enable且32位机：两次异或，一次移位，一次或运算，一次比较
    CONFIG_ARCH_USE_BUILTIN_BSWAP=y
    # 支持swap必选
    CONFIG_HAVE_IOREMAP_PROT=y
    # ioremap 函数。其功能是将给定的物理地址映射为虚拟地址。
    CONFIG_HAVE_KPROBES=y
    # 调试内核
    CONFIG_HAVE_KRETPROBES=y
    # 内核Kprobes调试
    CONFIG_HAVE_OPTPROBES=y
    CONFIG_HAVE_KPROBES_ON_FTRACE=y
    # Kprobes是一个轻量级的内核调试工具,能在内核运行的几乎任意时间点进行暂停/读取/修改
	# 等操作的调试工具.仅供调试使用
    CONFIG_HAVE_ARCH_TRACEHOOK=y
    CONFIG_HAVE_DMA_ATTRS=y
    # DMA中用到的一个结构体，储存内存的物理地址
    CONFIG_HAVE_DMA_CONTIGUOUS=y
    # 声明连续内存
    CONFIG_GENERIC_SMP_IDLE_THREAD=y
    # idle进程控制CPU进入省电模式
    CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
    CONFIG_HAVE_DMA_API_DEBUG=y
    # 调试驱动是否错误
    CONFIG_HAVE_HW_BREAKPOINT=y
    # 支持断点
    CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
    # 支持断点混合方式显示,
    CONFIG_HAVE_USER_RETURN_NOTIFIER=y
    支持用户线程通知链
    CONFIG_HAVE_PERF_EVENTS_NMI=y
    # 支持不可屏蔽的中断
    CONFIG_HAVE_PERF_REGS=y
    CONFIG_HAVE_PERF_USER_STACK_DUMP=y
    # 堆栈转储)作用:主要用于内核调试,打印内核堆栈段信息。
	...
    # CONFIG_CC_STACKPROTECTOR_STRONG is not set
    CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
    CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
    支持透明巨页机制
    CONFIG_MODULES_USE_ELF_REL=y
    链表头部存放在modules变量
    CONFIG_CLONE_BACKWARDS=y
    CONFIG_OLD_SIGSUSPEND3=y
    CONFIG_OLD_SIGACTION=y

#217-232行GCOV-based kernel profiling
    #基于GCC的gcov(代码覆盖率测试工具)的代码分析支持,仅用于调试
    CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
    # 支持对整个内核进行分析.内核体积将会显著增大,并且运行速度显著减慢.
    CONFIG_HAVE_GENERIC_DMA_COHERENT=y
    # dma_alloc_coherent()函数得到内存的物理地址和虚拟地址的映射
    CONFIG_BASE_SMALL=1
    #CONFIG_BASE_SMALL配置为0的情况下，PID的取值范围是0到32767，即系统中的进程数最大为32768个,配置为1，进程数减少
    在内存较小的系统中可以设置CONFIG_BASE_SMALL选项为1来减少内存的使用
    # CONFIG_MODULES is not set
    不打开可加载模块支持
    # CONFIG_BLOCK is not set
    块设备支持，不用块设备
    CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
    不用自旋锁
    CONFIG_INLINE_READ_UNLOCK=y
    CONFIG_INLINE_READ_UNLOCK_IRQ=y
    CONFIG_INLINE_WRITE_UNLOCK=y
    CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
    #读写机制控制，保持一个读写者的RCU临界区.
    CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
    #支持原子性操作
    CONFIG_ARCH_USE_QUEUE_RWLOCK=y
    RWLock 包为线程中的读写操作提供了锁机制的支持
    # CONFIG_FREEZER is not set
    不启用休眠。
<h1 id="2">linux中断机制</h1>

#####整个通用中断子系统几乎都是围绕着*irq_desc*  **结构进行，它叫做中断描述符，系统中每一个中断都对应着一个 *irq_desc* 结构，它记录了，中断请求的处理函数发出中断请求的硬件定义在*，/include/linux/irqdesc.h，start_kernel*发出*early_irq_init*调用时被初始化
![](https://github.com/moye2015/linux_conf_analysis/blob/master/lock.jpg?raw=true)
######设备：发起中断，具体来说是设备的驱动程序调用中断子系统提供的int request_threaded_irq()函数，完成对中断的申请。 申请的中断处理函数，包含中断编号，和中断服务函数等参数。
######中断控制层：对中断进行处理，优先级排序，决定哪个中断会被处理，交往哪一个CPU进行处理。struct irq_chip 对中断控制器的接口抽象，包含中断控制器的名字，/include/linux/irq.h
######CPU：处理中断。
<h1 id="3">linux RCU机制</h1>
#####RCU（Read-Copy Update）是数据同步的一种方式，在当前的Linux内核中发挥着重要的作用。RCU适用于需要频繁的读取数据，而相应修改数据并不多的情景，例如在文件系统中，经常需要查找定位目录，而对目录的修改相对来说并不多，这就是RCU发挥作用的最佳场景。RCU的思路如下：
![](https://github.com/moye2015/linux_conf_analysis/blob/master/RCU.jpg?raw=true)
######1、对于读操作，可以直接对共享资源进行访问，但是前提是需要CPU支持访存操作的原子化，现代CPU对这一点都做了保证。但是RCU的读操作上下文是不可抢占的（这一点在下面解释），所以读访问共享资源时可以采用read_rcu_lock()，该函数的工作是停止抢占。

######2、对于写操作，其需要将原来的老数据作一次备份（copy），然后对备份数据进行修改，修改完毕之后再用新数据更新老数据，更新老数据时采用了rcu_assign_pointer（）宏，在该函      数中首先屏障一下memory， 然后修改老数据。这个操作完成之后，需要进行老数据资源的回收。操作线程向系统注册回收方法，等待回收。采用数据备份的方法可以实现读者与写者之间的并发 操作，但是不能解决多个写着之间的同步，所以当存在多个写者时，需要通过锁机制对其进行互斥，也就是在同一时刻只能存在一个写者。

######3、在RCU机制中存在一个垃圾回收的daemon，当共享资源被update之后，可以采用该daemon实现老数据资源的回收。回收时间点就是在update之前的所有的读者全部退出。由此可见写者在update之后是需要睡眠等待的，需要等待读者完成操作，如果在这个时刻读者被抢占或者睡眠，那么很可能会导致系统死锁。因为此时写者在等待读者，读者被抢占或者睡眠，如果正在运行的线程需要访问读者和写者已经占用的资源，那么死锁的条件就很有可能形成了。

<h1 id="4">镜像文件进一步压缩</h1>
通过对上述配置文件的改善，改变下列几项的配置。可在不影响功能条件下进一步压缩文件。

    CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
    这句配置支持对整个内核进行分析.用于调试。
    改为#CONFIG_ARCH_HAS_GCOV_PROFILE_ALL is not set
    CONFIG_HAVE_PCSPKR_PLATFORM=y
    这句配置开机时响蜂鸣声
    改为#CONFIG_HAVE_PCSPKR_PLATFORM is not set
    CONFIG_HZ_PERIODIC=y
    这句配置是强制固定时钟中断，耗电，可不用
    改为#CONFIG_HZ_PERIODIC is not set

经过配置之后，原镜像文件由890KB减小到814KB，并且能完成上网的任务。


<h1 id="5">实验中遇到的问题及解决办法</h1>
###问题一：make menuconfig curses.h：No such file or directory
#####解决方案：安装ncurses，sudo apt-get install libncurses5-dev

###问题二：github在windows下git commit命令
#####描述：github的windows版本git commit后弹出文本文件提交注释，有时会产生Aborting commit due to empty commit message.
#####解决办法：可使用命令行的方式添加提交说明，git commit -m "str"

###问题三：VirturalBox里虚拟机存储不足
#####描述：使用的是老师给的虚拟机的vdi文件，但初始设置只有8G存储空间，由于预装软件多，且有些是必须的，下载linux源码之后解压编译会导致内存不足
#####解决办法：首先在windows DOS下给Vdi文件扩容，然后进入虚拟机中新建分区，挂载，保存，重启即可，具体操作命令参考[http://blog.csdn.net/casilin/article/details/9035973][5]



#引用：
1，[http://www.cnblogs.com/kulin/archive/2013/01/04/linux-core.html][2]

2，[http://www.wowotech.net/linux_kenrel/11.html][3] 

3，[http://blog.csdn.net/droidphone/article/category/1118447][4]

4，[http://blog.chinaunix.net/uid-20737871-id-3028195.html][7]




[1]:https://github.com/ir193/tiny_linux/blob/master/myconfig2
[2]:http://www.cnblogs.com/kulin/archive/2013/01/04/linux-core.html
[3]:http://www.wowotech.net/linux_kenrel/11.html
[4]:http://blog.csdn.net/droidphone/article/category/1118447
[5]:http://blog.csdn.net/casilin/article/details/9035973
[6]:https://www.kernel.org/
[7]:http://blog.chinaunix.net/uid-20737871-id-3028195.html
