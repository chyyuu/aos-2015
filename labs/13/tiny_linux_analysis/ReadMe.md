#Linux4.0.4 配置文件解析
###P14206021 刘相

#配置解析  
##处理器类型及特点的配置
    # Processor type and features （处理器类型及特点） 
    #
    # CONFIG_ZONE_DMA is not set
    该选项允许小于32位地址的设备使用前16MB的地址空间，如果不缺定的话，选Y 
    
    # CONFIG_SMP is not set
    对称多处理器支持,如果你有多个CPU或者使用的是多核CPU就选上.此时"Enhanced Real Time Clock Support"选项必须开启,"Advanced Power Management"选项必须关闭如果你选N，内核将会在单个或者多个CPU的机器上运行，但是只会使用一个CPU。如果你选Y，内核可以在很多（但不是所有）单CPU的机器上运行，在这样的机器，你选N会使内核运行得更快。注意如果你选Y，然后在Processor family选项中选择“586〃 or “Pentium” ，内核将不能运行在486构架的机器上。同样的，多CPU的运行于PPro构架上的内核也无法在 Pentium 系列的板上运行。 
    CONFIG_X86_FEATURE_NAMES=y
    # CONFIG_X86_EXTENDED_PLATFORM is not set
    支持非标准的PC平台: Numascale NumaChip, ScaleMP vSMP, SGI Ultraviolet. 绝大多数人都遇不见这些平台.
    # CONFIG_IOSF_MBI is not set
    # CONFIG_X86_32_IRIS is not set
    # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
    使用简化的 /proc/<PID>/wchan 值,禁用此选项会使用更加精确的wchan值(可以在"ps -l"结果的WCHAN域看到),但会轻微增加调度器消耗.
    # CONFIG_HYPERVISOR_GUEST is not set
    如果这个内核将在虚拟机里面运行就开启,否则就关闭.
    CONFIG_NO_BOOTMEM=y
    处理器类型。针对自己的CPU类型，选取相应的选项。 
    这里是处理器的类型。这里的信息主要目的是用来优化。为了让内核能够在所有X86构架的CPU上运行（虽然不是最佳速度），在这你可以选386。 
    内核不会运行在比你选的构架还要老的机器上。比如，你选了Pentium构架来优化内核，它将不能在486构架上运行。 
    如果你不清楚，选386。 
    # CONFIG_MEMTEST is not set
    内存测试选择空
    # CONFIG_M486 is not set
    "486"系列
    # CONFIG_M586 is not set
    "586"系列
    # CONFIG_M586TSC is not set
    "Pentium-Classic"系列
    # CONFIG_M586MMX is not set
    "Pentium-MMX"系列
    CONFIG_M686=y
    "Pentium-Pro"系列
    # CONFIG_MPENTIUMII is not set
    "Pentium-II" 系列
    # CONFIG_MPENTIUMIII is not set
    "Pentium-III" 系列
    # CONFIG_MPENTIUMM is not set
    # CONFIG_MPENTIUM4 is not set
    "Pentium-4" 系列
    # CONFIG_MK6 is not set
    # CONFIG_MK7 is not set
    # CONFIG_MK8 is not set
    K6, K6-II and K6-III 系列
    # CONFIG_MCRUSOE is not set
    "Crusoe" 系列
    # CONFIG_MEFFICEON is not set
    "Efficeon"系列
    # CONFIG_MWINCHIPC6 is not set
    "Winchip-C6"  "Winchip-2" "Winchip-2A" 系列
    # CONFIG_MWINCHIP3D is not set 
    "Winchip-3D"系列
    # CONFIG_MELAN is not set
    # CONFIG_MGEODEGX1 is not set
    "GeodeGX1"系列
    # CONFIG_MGEODE_LX is not set
    "Geode GX/LX" 系列
    # CONFIG_MCYRIXIII is not set
    "CyrixIII/VIA C3" 系列
    # CONFIG_MVIAC3_2 is not set
    # CONFIG_MVIAC7 is not set
    # CONFIG_MCORE2 is not set
    # CONFIG_MATOM is not set
     VIA C3-2 "Nehemiah".系列
    # CONFIG_X86_GENERIC is not set
    通用X86支持。 
    除了对上面你选择的X86 CPU进行优化，它还对更多类型X86 CPU的进行优化。这将会使内核在其他的X86 CPU上运行得更好。 
    对于供应商来说，他们非常需要这些功能，因为他们需要更通用的优化支持。 
    这个选项提供了对X86系列CPU最大的兼容性，用来支持一些少见的x86构架的CPU。如果你的CPU能够在上面的列表中找到，就里就不用选了。
    
    CONFIG_X86_INTERNODE_CACHE_SHIFT=5
    CONFIG_X86_L1_CACHE_SHIFT=5
    # CONFIG_X86_PPRO_FENCE is not set
    CONFIG_X86_USE_PPRO_CHECKSUM=y
    CONFIG_X86_TSC=y
    CONFIG_X86_CMPXCHG64=y
    CONFIG_X86_CMOV=y
    CONFIG_X86_MINIMUM_CPU_FAMILY=5
    CONFIG_X86_DEBUGCTLMSR=y
    
    
    # CONFIG_PROCESSOR_SELECT is not set
    支持的CPU厂商,按实际情况选择.
    CONFIG_CPU_SUP_INTEL=y
    支持INTEL
    CONFIG_CPU_SUP_CYRIX_32=y
    32位
    CONFIG_CPU_SUP_AMD=y
    检测AMD Athlon/Duron / Intel Pentium 4的非致命错误 
    允许这项特性，系统将会启动一个计时器，每5秒进行检测。非致命问题会自动修正（但仍然会记录下来），如果你不想看到这些信息，选N。这些信息可以让你发现要损坏的硬件，或者是非标准规格硬件（比如：超频的）。 
    这个功能只会在特定的CPU上起作用。 
    
    CONFIG_CPU_SUP_CENTAUR=y
    CONFIG_CPU_SUP_TRANSMETA_32=y
    
    
    CONFIG_CPU_SUP_UMC_32=y
    # CONFIG_HPET_TIMER is not set
    高精度定时器(hrtimer)是从2.6.16开始引入,用于取代传统timer wheel(基于jiffies定时器)的时钟子系统.可以降低与内核其他模块的耦合性,还可以提供比1毫秒更高的精度(因为它可以读取HPET/TSC等新型硬件时钟源),可以更好的支持音视频等对时间精度要求较高的应用.建议选"Y".[提示]这里说的"定时器"是指"软件定时器",而不是主板或CPU上集成的硬件时钟发生器(ACPI PM Timer/HPET Timer/TSC Timer).
    # CONFIG_DMI is not set
    允许扫描DMI(Desktop Management Interface)/SMBIOS(System Management BIOS)以获得机器的硬件配置,从而对已知的bug bios进行规避.具体涉及到哪些机器可参见"drivers/acpi/blacklist.c"文件.除非确定你的机器没有bug,否则请开启此项.
    CONFIG_NR_CPUS=1
    支持的最大CPU数量,每个CPU要占8KB的内核镜像,最小有效值是"2",最大有效值是"512".注意:对于多核CPU而言,每个核算一个.
    CONFIG_PREEMPT_NONE=y
    禁止内核抢占,这是Linux的传统模式,可以得到最大的吞吐量,适合服务器和科学计算环境
    # CONFIG_PREEMPT_VOLUNTARY is not set
    自愿内核抢占,通过在内核中设置明确的抢占点以允许明确的内核抢占,可以提高响应速度,但是对吞吐量有不利影响.适合普通桌面环境的
    # CONFIG_PREEMPT is not set
    主动内核抢占,允许抢占所有内核代码,对吞吐量有更大影响,适合需要运行实时程序的场合或者追求最快响应速度的桌面环境.
    # CONFIG_X86_UP_APIC is not set
    CONFIG_X86_UP_APIC_MSI=y
    # CONFIG_X86_MCE is not set
    MCE(Machine Check Exception)支持.让CPU检测到硬件故障(过热/数据错误)时通知内核,以便内核采取相应的措施(如显示一条提示信息或关机等).更多信息可以"man mcelog"看看.可以通过"grep mce /proc/cpuinfo"检查CPU是否支持此特性,若支持建议选中,否则请关闭.当然,如果你对自己的硬件质量很放心,又是桌面系统的话,不选也无所谓.
    # CONFIG_VM86 is not set
    虚拟X86支持,在DOSEMU下运行16-bit程序或XFree86通过BIOS初始化某些显卡的时候才需要。
    # CONFIG_X86_16BIT is not set
    如果你需要使用Wine运行那些古董级的16位保护模式程序,就选"Y",否则选"N
    # CONFIG_TOSHIBA is not set
    支持东芝系统管理器的基本驱动。不用选择
    # CONFIG_I8K is not set
    Dell Inspiron 8000 笔记本的 System Management Mode 驱动(i8k).该驱动可以读取CPU温度和风扇转速,进而帮助上层工具控制风扇转速.该驱动仅针对 Dell Inspiron 8000 笔记本进行过测试,所以不保证一定能适用于其他型号的Dell笔记本.
    # CONFIG_X86_REBOOTFIXUPS is not set
    修正某些旧x86主板的重起bug,这种主板基本绝种了
    # CONFIG_MICROCODE is not set
    CPU的微代码更新支持,建议选中.CPU的微代码更新就像是给CPU打补丁,用于纠正CPU的行为.更新微代码的常规方法是升级BIOS,但是也可以在Linux启动后更新.比如在Gentoo下,可以使用"emerge microcode-ctl"安装microcode-ctl服务,再把这个服务加入boot运行级即可在每次开机时自动更新CPU微代码.其他Linux系统可以参考这个帖子.
    # CONFIG_MICROCODE_INTEL_EARLY is not set
    支持从initrd镜像首部加载微代码,以便尽可能早的更新CPU微代码.即使在initrd首部并未嵌入微代码也不会造成问题,所以"Y"是安全的.不过你真的需要吗?笔者认为你一般并不需要:)
    # CONFIG_MICROCODE_AMD_EARLY is not set
    AMD代码二进制文件,对AMD早期CPU有效
    # CONFIG_X86_MSR is not set
    在多cpu系统中让特权CPU访问x86的MSR寄存器
    # CONFIG_X86_CPUID is not set
    能从/dev/cpu/x/cpuid获得CPU的唯一标识符(CPUID)
    # CONFIG_NOHIGHMEM is not set
    最高内存支持,总内存小于等于1G的选"off",大于4G的选"64G"，不支持高内存
    CONFIG_HIGHMEM4G=y
    4GB 选这项如果你用的是32位的处理器，内存在1-4GB之间。 
    # CONFIG_HIGHMEM64G is not set
    64GB 选这项如果你用的是32位的处理器，内存大于4GB。 选N
    CONFIG_VMSPLIT_3G=y
    内核可寻址的范围为3G
    # CONFIG_VMSPLIT_3G_OPT is not set
    用户态最大可寻址的范围为3G
    # CONFIG_VMSPLIT_2G is not set
    内核可寻址的范围为2G
    # CONFIG_VMSPLIT_2G_OPT is not set
    用户态最大可寻址的范围为2G
    # CONFIG_VMSPLIT_1G is not set
    内核可寻址的范围为1G
    CONFIG_PAGE_OFFSET=0xC0000000
    内核虚拟地址开始地址
    CONFIG_HIGHMEM=y
    允许为寻址宽度不足32位的设备(也就是ISA和LPC总线设备)在物理内存的前16MB范围内(也就是传统上x86_32架构的ZONE_DMA区域)分配内存.不确定的选"N",内核中若有其它驱动(主要是某些老旧的声卡)需要它会自动选中此项.[提示]LPC总线通常和主板上的南桥物理相连,通常连接了一系列的传统设备:BIOS,PS/2键盘,PS/2鼠标,软盘,并口设备,串口设备,某些集成声卡,TPM(可信平台模块),等等
    
    CONFIG_ARCH_FLATMEM_ENABLE=y
    支持平面内存模式
    CONFIG_ARCH_SPARSEMEM_ENABLE=y
    支持Sparse Memory"主要用来支持内存热插拔
    CONFIG_ARCH_SELECT_MEMORY_MODEL=y
    手动选择内存模式
    CONFIG_ILLEGAL_POINTER_VALUE=0
    非法指针值为0
    CONFIG_SELECT_MEMORY_MODEL=y
    手动选择内存模式
    CONFIG_FLATMEM_MANUAL=y
    仅供调试使用
    # CONFIG_SPARSEMEM_MANUAL is not set
    对于64位CPU而言,开启此选项可以简化pfn_to_page/page_to_pfn的操作,从而提高内核的运行效率.但是在32位平台则建议关闭.更多细节可以参考这个帖子.
    CONFIG_FLATMEM=y
    平面内存模式 (flat memory model)
    是一种组织 内存 寻址空间的方式。一个用本地32位Windows格式写成的程序是由所谓“平坦内存模型”创建的，它只有一个包含代码和数据的段。这个程序必须在386或更高的处理器上运行。早期的16位代码，由段和偏移地址混合达到寻址64k（段的限制）。与此不同的是，平坦内存模型只需要偏移量却有4G的寻址范围。这使得汇编更容易书写，而代码总得来说也将快一点。
    在这种模式下，一个电脑的应用程序最多使用两个内存区段，一个是给程序码使用，另外一个是资料。此外，同样的区段也可以用量同时给程序码或是资料使用，但这是不必要的，因为只有对于自我更改程序码 的程序才有用处，但这种程序设计风格 现今被视为一种很不好的方法。
    CONFIG_FLAT_NODE_MEM_MAP=y
    CONFIG_SPARSEMEM_STATIC=y
    CONFIG_HAVE_MEMBLOCK=y
    CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
    CONFIG_ARCH_DISCARD_MEMBLOCK=y
    # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
    CONFIG_PAGEFLAGS_EXTENDED=y
    CONFIG_SPLIT_PTLOCK_CPUS=4
    
    # CONFIG_COMPACTION is not set
    允许对大内存页(huge pages)进行压缩.主要是为了解决大内存页的碎片问题.建议在使用大内存页的情况下开启此项,否则建议关闭.
    # CONFIG_PHYS_ADDR_T_64BIT is not set
    物理地址64位
    CONFIG_ZONE_DMA_FLAG=0
    Intel VT技术支持.也就是cpu-flags中有"vmx"标记.
    CONFIG_VIRT_TO_BUS=y
    
    # CONFIG_KSM is not set
    KSM(Kernel Samepage Merging)支持:周期性的扫描那些被应用程序标记为"可合并"的地址空间,一旦发现有内容完全相同的页面,就将它们合并为同一个页面,这样就可以节约内存的使用,但对性能有不利影响.推荐和内核虚拟机KVM(Documentation/vm/ksm.txt)或者其他支持"MADV_MERGEABLE"特性的应用程序一起使用.KSM并不默认开启,仅在应用程序设置了"MADV_MERGEABLE"标记,并且 /sys/kernel/mm/ksm/run 被设为"1"的情况下才会生效.
    CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
    4GB 选这项如果你用的是32位的处理器，内存在1-4GB之间。 LINUX能够在X86系统中使用64GB的物理内存。但是，32位地址的X86处理器只能支持到4GB大小的内存。这意味着，如果你有大于4GB的物理内存，并非都能被内核“永久映射”。这些非永久映射内存就称为“高阶内存”。如果你编译的内核永远都不会运行在高于1G内存的机器上，选OFF（默认选项，适合大多数人）。这将会产生一个“3GB/1GB”的内存空间划分，3GB 虚拟内存被内核映射以便每个处理器能够“看到”3GB的虚拟内存空间，这样仍然能够保持4GB的虚拟内存空间被内核使用，更多的物理内存能够被永久映射。如果你有1GB－4GB之间的物理内存，选4GB选项。如果超过4GB，那么选择64GB。这将打开 Intel 的物理地址延伸模式（PAE）。PAE将在IA32处理器上执行3个层次的内存页面。PAE是被LINUX完全支持的，现在的Intel处理器 (Pentium Pro 和更高级的)都能运行PAE模式。注意：如果你选64GB，那么在不支持PAE的CPU上内核将无法启动。 你机器上的内存能够被自动探测到，或者你可以用类似于“mem=256M”的参数强制给内核指定内存大小。  4GB 选这项如果你用的是32位的处理器，内存在1-4GB之间。64GB 选这项如果你用的是32位的处理器，内存大于4GB。  
    # CONFIG_TRANSPARENT_HUGEPAGE is not set
    大多数现代计算机体系结构都支持多种不同的内存页面大小(比如x86_64支持4K和2M以及1G[需要cpu-flags中含有"pdpe1gb"]).大于4K的内存页被称为"大页"(Hugepage).TLB(页表缓存)是位于CPU内部的分页表(虚拟地址到物理地址的映射表)缓冲区,既高速又很宝贵(尺寸很小).如果系统内存很大(大于4G)又使用4K的内存页,那么分页表将会变得很大而难以在CPU内缓存,从而导致较高的TLB不命中概率,进而降低系统的运行效率.开启大内存页支持之后,就可以使用大页(2M或1G),从而大大缩小分页表的尺寸以大幅提高TLB的命中率,进而优化系统性能.传统上使用大内存页的方法是通过Hugetlbfs虚拟文件系统(CONFIG_HUGETLBFS),但是hugetlbfs需要专门进行配置以及应用程序的特别支持.所以从2.6.38版本开始引入了THP(Transparent Hugepages),目标是替代先前的Hugetlbfs虚拟文件系统(CONFIG_HUGETLBFS).THP允许内核在可能的条件下,透明的(对应用程序来说)使用大页(huge pages)与HugeTLB,THP不像hugetlbfs那样需要专门进行配置以及应用程序的特别支持.THP将这一切都交给操作系统来完成,也不再需要额外的配置,对于应用程序完全透明,因而可用于更广泛的应用程序.这对于数据库/KVM等需要使用大量内存的应用来说,可以提升其效能,但对于内存较小(4G或更少)的个人PC来说就没啥必要了.详见"Documentation/vm/transhuge.txt"文档.
    CONFIG_NEED_PER_CPU_KM=y
    # CONFIG_CLEANCACHE is not set
    Cleancache可以被看作是内存页的"Victim Cache"(受害者缓存),当回收内存页时,先不把它清空,而是把其加入到内核不能直接访问的"transcendent memory"中,这样支持Cleancache的文件系统再次访问这个页时可以直接从"transcendent memory"加载它,从而减少磁盘IO的损耗.目前只有zcache和XEN支持"transcendent memory",不过将来会有越来越多的应用支持.开启此项后即使此特性不能得到利用,也仅对性能有微小的影响,所以建议开启.更多细节请参考"Documentation/vm/cleancache.txt"文件.
    # CONFIG_CMA is not set
    Broadcom特有的AMBA(Advanced Microcontroller Bus Architecture)总线支持.仅用于嵌入式环境
    # CONFIG_ZPOOL is not set
    ZFS文件系统的英文名称为Zettabyte File System,也叫动态文件系统（Dynamic File System）,是第一个128位文件系统。最初是由Sun公司为Solaris 10操作系统开发的文件系统。作为OpenSolaris开源计划的一部分，ZFS于2005年11月发布，被Sun称为是终极文件系统。ZFS是基于存储池的，与典型的映射物理存储设备的传统文件系ZFS统不同，ZFS所有在存储池中的文件系统都可以使用存储池的资源。
    
  
    # CONFIG_ZBUD is not set
    
    # CONFIG_ZSMALLOC is not set
    zsmalloc压缩内存分配器主要用于给zram提供支持,建议与CONFIG_ZRAM同开关
    CONFIG_GENERIC_EARLY_IOREMAP=y
    # CONFIG_HIGHPTE is not set
    在内存很多 ( 大于 4G) 的机器上将用户空间的页表放到高位内存区 , 以节约宝贵的低端内存 。 
    # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
     低位内存脏数据检查，默认是每60 秒检查一次。一般这种脏数据 是因某些Bios 处理不当引起的。 
    CONFIG_X86_RESERVE_LOW=64
    64字节的低内量，为BIOS保护
    # CONFIG_MATH_EMULATION is not set
    数学仿真 
    LINUX可以仿真一个数学协处理器（用来进行浮点运算），如果你没有的话。486DX 和 Pentium 处理器内建有数学协处理器。486SX和386的没有，除非你专门加过487DX 或者387协处理器。所有人都需要协处理器或者这个仿真。 
    如果你没有数学协处理器，你需要在这选Y。如果你有了协处理器还在这选Y，你的协处理器仍然被用到。这意味着如果你打算把编译的内核用在不同的机器上，选Y是明智的选择。 
    如果不清楚，选Y，这将使内核增加66KB，无伤大雅。 
    # CONFIG_MTRR is not set
    内存类型区域寄存器 
    在 Intel P6 系列处理器(Pentium Pro, Pentium II 和更新的)上，MTRR将会用来规定和控制处理器访问某段内存区域的策略。 
    如果你在PCI或者AGP总线上有VGA卡，这将非常有用。例如可将MTTR设为在显存的地址范围上使用“write-combining”策略，这样 CPU可以在PCI/AGP总线爆裂之前将多次数据传输集合成一个大的数据传输，这样可以提升图像的传送速度2.5倍以上。选Y，会生成文件 /proc/mtrr，它可以用来操纵你的处理器的MTRR。典型地，X server 会用到。 
    这段代码有着通用的接口，其他CPU的寄存器同样能够使用该功能。Cyrix 6x86, 6x86MX和 M II处理器有ARR ，它和 MTRR有着类似的功能。AMD K6-2/ K6-3有两个MTRR， Centaur C6有8个MCR允许复合写入。所有这些处理器都支持这段代码，你可以选Y如果你有以上处理器。 
    选Y同样可以修正SMP BIOS的问题，它仅为第一个CPU提供MTRR，而不为其他的提供。这会导致各种各样的问题，所以选Y是明智的。 
    你可以安全地选Y，即使你的机器没有MTRR。这会给内核增加9KB。 减少内核大小的话就不选
    # CONFIG_ARCH_RANDOM is not set
    Intel 从 Ivy Bridge 微架构开始(对于Atom来说是从Silvermont开始),在CPU中集成了一个高效的硬件随机数生成器(称为"Bull Mountain"技术),并引入了一个新的x86指令"RDRAND",可以非常高效的产生随机数.此选项就是对此特性的支持.
    # CONFIG_X86_SMAP is not set
    SMAP(Supervisor Mode Access Prevention)是Intel从Haswell微架构开始引入的一种新特征,它在CR4寄存器上引入一个新标志位SMAP,如果这个标志为1,内核访问用户进程的地址空间时就会触发一个页错误,目的是为了防止内核因为自身错误意外访问用户空间,这样就可以避免一些内核漏洞所导致的安全问题.但是由于内核在有些时候仍然需要访问用户空间,因此intel提供了两条指令STAC和CLAC用于临时打开/关闭这个功能,反复使用STAC和CLAC会带来一些轻微的性能损失,但考虑到增加的安全性,还是建议开启.
    # CONFIG_X86_INTEL_MPX is not set
    MPX系列设备是基于最先进的NetScaler平台架构而设计的，具有成熟的多处理系统架构，可配备多达8个CPU内核、32GB内存、先进的高速串行互连，
    # CONFIG_SECCOMP is not set
    允许SECCOMP（快速计算）安全地运算非信任代码。 
    这个内核特性在程序出现数码错误，需要重新对非信任的代码进行运算时非常有效。它使用管道或者其他传输方式，使文件描述进程支持读/写的系统调用，这样可以利用SECCOMP隔离那些程序本身的空间。 
    一旦 seccomp 通过/proc/<pid>/seccomp运行，它将不能停止，任务也只能进行一些安全的被seccomp认证的系统调用。 
    # CONFIG_HZ_100 is not set
    100 HZ是传统的对服务器、SMP 和 NUMA的系统选项。这些系统有比较多的处理器，可以在中断较集中的时候分担中断 
    CONFIG_HZ_250=y
    250 HZ对服务器是一个好的折衷的选项，它同样在SMP 和 NUMA 系统上体现出良好的反应速度。 
    # CONFIG_HZ_300 is not set
     300 HZ(X) 1000 HZ1000 HZ对于桌面和其他需要快速事件反应的系统是非常棒的。 
    # CONFIG_HZ_1000 is not set
    1000 HZ对于桌面和其他需要快速事件反应的系统是非常棒的。 
    CONFIG_HZ=250
    250 HZ对服务器是一个好的折衷的选项，它同样在SMP 和 NUMA 系统上体现出良好的反应速度。 
    # CONFIG_SCHED_HRTICK is not set
    Intel超线程技术(HyperThreading)支持.
    # CONFIG_KEXEC is not set
     快速重启调用。 
    kexec 系统调用 
    kexec是一个用来关闭你当前内核，然后开启另一个内核的系统调用。它和重启很像，但是它不访问系统固件。由于和重启很像，你可以启动任何内核，不仅仅是LINUX。 
    kexec这个名字是从 exec 系统调用来的。它只是一个进程，可以确定硬件是否正确关闭，所以如果这段代码没能正确为你进行初始化工作，请不要奇怪。它对设备的热拔插会有点帮助。由于它对硬件接口会乱写点东西，所以我没什么好的建议给你。 
    Linus本人都没话说，估计是受害不浅。我们当然不能上当，选N！ 
    # CONFIG_CRASH_DUMP is not set
    内核崩溃时，dump 运行时信息。就算 crash 了，我也不会去调试内核的core dump，选N
    CONFIG_PHYSICAL_START=0x1000000
    设置物理起始位置，这个用默认值就可以Physical address where the kernel is loaded 
    # CONFIG_RELOCATABLE is not set
    官方说明 （建立一个移动的内核，并增加10% 的内核尺寸，运行时会被丢弃），我认为没实质性的作用 
    CONFIG_PHYSICAL_ALIGN=0x200000
    物理增加值
    # CONFIG_COMPAT_VDSO is not set
    Compat VDSO 支持 
    如果你运行的是最新的glibc（GNU C函数库）版本（ 2.3.3 或更新），选N，这样可以移除高阶的VDSO 映射，使用随机的 VDSO。 
    如果不清楚，选N。
    # CONFIG_CMDLINE_BOOL is not set
    CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
    对热插拔CPU 提供支持
    #
    
    
    
    
    
##电源管理的配置    
    # Power management and ACPI options
    #电源管理没什么好说的，不想浪费电就选上。如果不选你可以跳过这部份。
    # CONFIG_SUSPEND is not set
    休眠到硬盘。也就是将内存写入交换分区中，下次启动可以通过参数resume=/dev/swappartition（例如：resume=/dev/hda6）来恢复上次机器运行的状态。这项功能对于系统引导时启动许多服务的机器来说很有用，可以节约启动时间。这项功能根据自己的需要选择吧，如果你选择这项功能，记得恢复休眠后重做交换分区。 
    # CONFIG_PM is not set
    启动时支持电源管理，选上这个选项能让系统自动的进行电源管理，除非在启动时死机，才不要选这项。
    # CONFIG_ACPI is not set
    这是一种电源管理方式，你可以看看你的BIOS 是否支持。如果支持的话建议你选上这项。
    # CONFIG_SFI is not set
    Simple Firmware Interface) Support
    #
    # CPU Frequency scaling
    这一选项允许改变CPU的主频，使CPU 在低负荷或使用电池时降低主频，达到省电的目的。
    #
    # CONFIG_CPU_FREQ is not set
    是否允许调试CPU 改变主频的功能，如果要调试，还需要在启动时加上参数。cpufreq.debug=
    1：变频技术的内核调试
    2：变频技术的驱动调试
    4：变频技术的调节器调试
    
    #
    # CPU Idle 
    CPU空闲进程
    #
    CONFIG_CPU_IDLE=y
    CPU idle PM support
    CONFIG_CPU_IDLE_GOV_LADDER=y
    默认用 performance 高性能的CPU 调频方式  
    CONFIG_CPU_IDLE_GOV_MENU=y
    周期性的考察CPU 负载并自动的动态调整cpu 频率" ，我只用 performance  
    # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
    内核不需要设置CPU进程控制管理
    # CONFIG_INTEL_IDLE is not set
    网络空闲进程不需要设置
    #
    
    
    
    
    
##总线类型的配置
   
    # Bus options (PCI etc.)
    总线类型
    #
    CONFIG_PCI=y 
    PCI 支持,如果使用了 PCI 或 PCI Express 设备就必选
    PCI(Peripheral Component Interconnect)是 一种由英特尔（Intel）公司1991年推出的用于定义局部总线的标准。此标准允许在计算机内安装多达10个遵从PCI标准的扩展卡。
    # CONFIG_PCI_GOBIOS is not set
    # CONFIG_PCI_GOMMCONFIG is not set
    # CONFIG_PCI_GODIRECT is not set
    CONFIG_PCI_GOANY=y
    在PCI系统中，BIOS可以检测PCI设备和确定它们的设置。但是，一些老的PCI主板有BIOS问题，如果这里选上会让系统当机。同时，一些嵌入式的基于PCI系统没有任何BIOS。LINUX可以在不使用BIOS的情况下尝试直接检测PCI硬件。
    CONFIG_PCI_BIOS=y
    CONFIG_PCI_DIRECT=y
    CONFIG_PCI_DOMAINS=y
    选上这个以后，你可以设定LINUX如果检测PCI设备。如果你选择"BIOS"，BIOS会用到。你选 "Direct"， BIOS不会用到。如果你选"MMConfig"，PCI加速的 MMCONFIG 会用到。如果你选"Any" ，内核先用 MMCONFIG ，然后 "Direct"，最后才是"BIOS"如果前面的都无法工作。如果不清楚，选"Any"。 
    # CONFIG_PCI_CNB20LE_QUIRK is not set
    CNB20LE芯片组PCI热插拔支持.除非你非常明确的知道你需要它,否则请关闭此项.
    # CONFIG_PCIEPORTBUS is not set
    是PCI的升级版并在软件层与PCI兼容,其目标是统一电脑内部总线.基本上只要不是古董机,都早已支持PCI-E了.选"N".
    # CONFIG_PCI_MSI is not set
    建议你不要选择这项，设备将使用默认的IRQ 中断。如果选择这项，充许设备通过PCI 总线写入内存堆
    栈产生一个中断。
    # CONFIG_PCI_DEBUG is not set
    PCI将PCI调试信息输出到系统日志里 调试,不选
    # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
    让内核自动检测"是否需要重新分配PCI资源".即使此项已开启,你依然可以用"pci=realloc=[on|off]"来覆盖它
    # CONFIG_PCI_STUB is not set
    作用是将PCI设备跟目前绑定的驱动分离,暂时由其接管,最后再交给虚拟机自己去驱动这个PCI设备.
    # CONFIG_PCI_IOV is not set
    PCI I/O Virtualization支持.这需要硬件支持IOMMU技术(AMD-Vi,Intel VT-d).
    # CONFIG_PCI_PRI is not set
    PCI Page Request Interface 支持.它允许IOMMU之后的设备能够从页错误中恢复过来.这需要硬件支持IOMMU技术(AMD-Vi,Intel VT-d).
    # CONFIG_PCI_PASID is not set
    PASID(Process Address Space Identifiers)可以被PCI设备用来同时访问多个IO地址空间.这需要硬件支持IOMMU技术(AMD-Vi,Intel VT-d).

##PCI host controller drivers的配置  
    #
    # PCI host controller drivers
    #
    CONFIG_ISA_DMA_API=y
    # CONFIG_ISA is not set
    现在基本上没有 ISA 的设备了,如果你有就选吧
    # CONFIG_SCx200 is not set
    在使用 AMD Geode 处理器的机器上才可能有
    
    # CONFIG_OLPC is not set
    # CONFIG_ALIX is not set
    # CONFIG_NET5501 is not set
    
    CONFIG_AMD_NB=y
    # CONFIG_PCCARD is not set
    老式的PCMCIA 设备只持。现在很少有这样的设备了，除非你买这样的设备时带了张Linux 的驱动光盘才需要选上。而且估计你也只能在二手市场上买到这样的设备。
    # CONFIG_HOTPLUG_PCI is not set
    PCI 热插拔支持,如果你有这样的设备就到子项中去选吧
    
    # CONFIG_RAPIDIO is not set
    # CONFIG_X86_SYSFB is not set
    
    
    
##可执行文件格式的配置
   
    #
    # Executable file formats / Emulations
    可执行文件格式
    #
    CONFIG_BINFMT_ELF=y
    ELF 是开放平台下最常用的二进制文件，它支持不同的硬件平台。
    CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
    CONFIG_BINFMT_SCRIPT=y
    支持以"#!/path/to/interpreter"行开头的脚本.务必"Y",不要"M"或"N",除非你知道自己在做什么.
    CONFIG_HAVE_AOUT=y
    # CONFIG_BINFMT_AOUT is not set
    这是早期UNIX 系统的可执行文件格式，目前已经被ELF 格式取代。
    # CONFIG_BINFMT_MISC is not set
    此选项允许插入二进制的封装层到内核中，当使用Java、.NET、Python、Lisp 等语言编写的程序时非常有用。
    # CONFIG_COREDUMP is not set
    核心转储(core dump)支持.如果你打算在此Linux上开发应用程序或者帮助别人调试bug,那么就选"Y",否则选"N".注意这里的调试和开发不是指内核调试和开发,是应用程序的调试和开发.
    
    CONFIG_HAVE_ATOMIC_IOMAP=y
    CONFIG_PMC_ATOM=y
    CONFIG_NET=y
    支持net语言
    #
    
    
    
    
    
##网络选项的配置   
    # Networking options
    网络选项
    #
    # CONFIG_PACKET is not set
    在调试不合格的包时加上额外的附加信息,但在遇到Dos攻击时你可能会被日志淹没 
    这种 Socket 可以让应用程序(比如 tcpdump,iptables)直接与网络设备通讯,而不通过内核中的其它中介协议
    # CONFIG_UNIX is not set
    一种仅运行于本机上的效率高于TCP/IP 的Socket,简称Unix socket.许多程序都使用它在操作系统内部进行进程
    间通信(IPC),比如 X Window 和 syslog
    # CONFIG_XFRM_USER is not set
    IPsec(可在 ip 层加密)之类的工具提供 XFRM 用户配置接口支持
    # CONFIG_NET_KEY is not set
    用于可信任的密钥管理程序和操作系统内核内部的密钥管理进行通信,IPsec 依赖于它
    CONFIG_INET=y
    socket 监视接口,一些 Linux 本地工具(如:包含 ss 的 iproute2)需要使用它
    # CONFIG_IP_MULTICAST is not set
    群组广播,似乎与网格计算有关,仅在使用 MBONE 的时候才需要
    # CONFIG_IP_ADVANCED_ROUTER is not set
    高级路由,如果想做一个路由器就选吧
    # CONFIG_IP_PNP is not set
     PnP是即插即用的意思,可以不用配置
    # CONFIG_NET_IPIP is not set
    IP隧道,主要目的是为了在TCP/IP网络中传输其他协议的数据包,当然也包括IP数据包(例如用于实现VPN).
    # CONFIG_NET_IPGRE_DEMUX is not set
    GRE demultiplexer 支持.被CONFIG_NET_IPGRE和CONFIG_PPTP所依赖.
    # CONFIG_NET_IP_TUNNEL is not set
    基于IP的通用路由封装(Generic Routing Encapsulation)隧道支持.该驱动主要用于对端是Cisco路由器的场合,因为Cisco的路由器特别偏好GRE隧道(而不是CONFIG_NET_IPIP),并且GRE还允许通过隧道对组播进行再分发.
    # CONFIG_SYN_COOKIES is not set
    TCP syncookie 支持,这是抵抗SYN flood攻击的好东西.此特性的开关可以通过"/proc/sys/net/ipv4/tcp_syncookies"文件控制,写入"1"表示开启,写入"0"表示关闭.建议服务器环境开启此项.
    # CONFIG_NET_UDP_TUNNEL is not set
    UDP socket 监视接口,一些Linux本地工具(如:包含ss的iproute2)需要使用它
    
    # CONFIG_NET_FOU is not set
    # CONFIG_GENEVE is not set
    
    # CONFIG_INET_AH is not set
    IPsec验证头(AH)实现了数据发送方的验证处理,可确保数据既对于未经验证的站点不可用也不能在路由过程中更改
    # CONFIG_INET_ESP is not set
    IPsec封闭安全负载(ESP)实现了发送方的验证处理和数据加密处理,用以确保数据不会被拦截/查看或复制
    # CONFIG_INET_IPCOMP is not set
    IPComp(IP静荷载压缩协议),用于支持IPsec
    # CONFIG_INET_XFRM_TUNNEL is not set
    # CONFIG_INET_TUNNEL is not set
    IPsec隧道模式,用于提供外网安全(包括虚拟专用网络).整个数据包(数据头和负载)都已经过加密处理且分配有新的ESP头/IP头和验证尾,从而能够隐藏受保护站点的拓扑结构
    # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
    IPsec传输模式,常用于对等通信,用以提供内网安全.数据包经过了加密但IP头没有加密,因此任何标准设备或软件都可查看和使用IP头
    # CONFIG_INET_XFRM_MODE_TUNNEL is not set
    IPsec隧道模式,用于提供外网安全(包括虚拟专用网络).整个数据包(数据头和负载)都已经过加密处理且分配有新的ESP头/IP头和验证尾,从而能够隐藏受保护站点的拓扑结构
    # CONFIG_INET_XFRM_MODE_BEET is not set
    IPsec BEET模式
    CONFIG_INET_LRO=y
    LRO(Large Receive Offload) (ipv4/tcp) 支持.它通过将多个TCP数据整合在一个skb结构中,并在稍后的某个时刻作为一个大的数据包交付给上层的网络协议栈,以减少上层协议栈处理skb的开销,提高Linux系统接收TCP数据包的能力.目前,主流网卡驱动都已支持此特性.建议开启.不过,LRO不应该在路由器上开启,因为它破坏了end-to-end原则,并会对路由性能造成显著的不利影响.
    CONFIG_INET_DIAG=y
    INET(TCP,DCCP,...) socket 监视接口,一些Linux本地工具(如:包含ss的iproute2)需要使用它
    CONFIG_INET_TCP_DIAG=y
    TCP(TCP,DCCP,...) socket 监视接口,一些Linux本地工具(如:包含ss的iproute2)需要使用它
    # CONFIG_INET_UDP_DIAG is not set
    UDP socket 监视接口,一些Linux本地工具(如:包含ss的iproute2)需要使用它
    # CONFIG_TCP_CONG_ADVANCED is not set
    CONFIG_TCP_CONG_CUBIC=y
    CONFIG_DEFAULT_TCP_CONG="cubic"
    # CONFIG_TCP_MD5SIG is not set
    RFC2385中描述了一种对TCP会话进行MD5签名的保护机制.目前仅用于保护互联网运营商骨干路由器间的BGP会话.一般的路由器/服务器等设备根本不需要这个.
    # CONFIG_IPV6 is not set
    引领未来的IPv6支持
    # CONFIG_NETWORK_SECMARK is not set
    对网络包进行安全标记,类似于nfmark,但主要是为安全目的而设计,如果你不明白
    的话就别选
    CONFIG_NET_PTP_CLASSIFY=y
    允许为包设置优先级,一些排队规则(atm,cbq,dsmark,pfifo_fast,htb,prio)需要使用
    它
    # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
    内核时间戳
    # CONFIG_NETFILTER is not set
    针对IPv6的Netfilter配置,需要的话可以参考前面IPv4的Netfilter 配置进行选择
    针对IPv4的Netfilter配置
    # CONFIG_IP_DCCP is not set
    数据报拥塞控制协议在UDP 的基础上增加了流控和拥塞控制机制,使数据报协议
    能够更好地用于流媒体业务的传输
    # CONFIG_IP_SCTP is not set
    流控制传输协议是一种新兴的传输层协议.TCP 协议一次只能连接一个IP 地址而
    在SCTP 协议一次可以连接多个IP 地址且可以自动平衡网络负载,一旦某一个IP
    地址失效会自动将网络负载转移到其他IP地址上
    # CONFIG_RDS is not set
    # CONFIG_TIPC is not set
    透明内部进程间通信协议,以共享内存为基础实现任务和资源的调度,专门用于内部集群通信
    # CONFIG_ATM is not set
    异步传输模式(ATM)支持
    # CONFIG_L2TP is not set
    允许将符合条件的包头信息通过syslog进行记录
    # CONFIG_BRIDGE is not set
    桥接
    CONFIG_HAVE_NET_DSA=y
    # CONFIG_VLAN_8021Q is not set
    802.1Q虚拟局域网
    # CONFIG_DECNET is not set
    DECnet是一种很生僻的协议
    # CONFIG_LLC2 is not set
    看不懂可以不选
    # CONFIG_IPX is not set
    IPX协议
    # CONFIG_ATALK is not set
    与Mac机器通信的协议
    # CONFIG_X25 is not set
    大约没人需要这东西CCITT X.25 Packet Layer
    # CONFIG_LAPB is not set
    大约没人需要这东西 LAPB Data Link Driver
    # CONFIG_PHONET is not set
    Phonet protocols family
    # CONFIG_IEEE802154 is not set
    IEEE 802.15.4低速率无线个人区域网络支持IEEE Std 802.15.4 Low-Rate Wireless Personal Area Networks support (EXPERI│ 
    # CONFIG_NET_SCHED is not set
    通过IPRoute 切换网络设备上的Qos 策略，我不打算使用IP 路由
    # CONFIG_DCB is not set
    DNS Resolver support DNS解析器支持
    # CONFIG_BATMAN_ADV is not set
    B.A.T.M.A.N. Advanced Meshing Protocol高级网格协议
    # CONFIG_OPENVSWITCH is not set
    Open vSwitch 是一个多层虚拟交换标准.此选项提供了内核级的高速转发功能(需要配合用户态守护进程ovs-vswitchd来实现).
    # CONFIG_VSOCKETS is not set
    这是一个类似于TCP/IP的协议,用于虚拟机之间以及虚拟机与宿主之间的通信.开启此项后,还需要从子项中选择适用于特定虚拟化技术的传输协议.
    # CONFIG_NETLINK_MMAP is not set
    基于内存映射机制的 netlink IO 支持.这样可以避免在用户空间与内存空间之间复制数据,从而提升操作速度.建议开启.
    # CONFIG_NETLINK_DIAG is not set
    INET套接字监测协议
    
    # CONFIG_NET_MPLS_GSO is not set
    # CONFIG_HSR is not set
    
    # CONFIG_NET_SWITCHDEV is not set
    网络切换设备
    CONFIG_NET_RX_BUSY_POLL=y
    netpoll的目的是让内核在网络和I/O子系统尚不能完整可用时,依然能发送和接收数据包.主要用于网络控制台(netconsole)和远程内核调试(KGDBoE)中.不确定的选"N".

#遇到的问题及解决方法
##问题一描述：
第一次裁剪linux内核是按照最小busybox initramfs构建 qemu调试，起初安装qemu在自己的ubuntu虚拟机上一直安装不上去
1.安装qemu问题
lx@ubuntu:qemu-1.6.0-rc3$ ./configure --prefix=/opt/qemu --target-list=arm-softmmu,arm-linux-user --enable-debug

ERROR: zlib check failed
       Make sure to have the zlib libs and headers installed.
###解决方案：
去安装对应的缺少的zlib库：

sudo apt-get install zlib1g
即可解决问题。
##问题二：安装busybox-1.20.3.tar.bz2遇到的问题
编译不到一分钟可以看到如下分割线内错误：

    ==========================================================================
    miscutils/ubi_tools.c:67:26: 错误：mtd/ubi-user.h：没有那个文件或目录
    miscutils/ubi_tools.c: 在函数 ‘ubi_tools_main’ 中：
    miscutils/ubi_tools.c:137: 错误：‘UBI_DEV_NUM_AUTO’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:137: 错误：(即使在一个函数内多次出现，每个未声明的标识符在其
    miscutils/ubi_tools.c:137: 错误：所在的函数内只报告一次。)
    miscutils/ubi_tools.c:138: 错误：‘UBI_VOL_NUM_AUTO’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:157: 错误：‘req’ 的存储大小未知
    miscutils/ubi_tools.c:165: 错误：‘UBI_IOCATT’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:157: 警告：未使用的变量 ‘req’
    miscutils/ubi_tools.c:171: 错误：‘UBI_IOCDET’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:174: 错误：‘req’ 的存储大小未知
    miscutils/ubi_tools.c:181: 错误：‘UBI_MAX_VOLUME_NAME’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:188: 错误：‘UBI_STATIC_VOLUME’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:190: 错误：‘UBI_DYNAMIC_VOLUME’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:199: 错误：‘UBI_IOCMKVOL’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:174: 警告：未使用的变量 ‘req’
    miscutils/ubi_tools.c:205: 错误：‘UBI_IOCRMVOL’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:208: 错误：‘req’ 的存储大小未知
    miscutils/ubi_tools.c:218: 错误：‘UBI_IOCRSVOL’ 未声明 (在此函数内第一次使用)
    miscutils/ubi_tools.c:208: 警告：未使用的变量 ‘req’
    miscutils/ubi_tools.c:226: 错误：‘UBI_IOCVOLUP’ 未声明 (在此函数内第一次使用)
    make[1]: *** [miscutils/ubi_tools.o] 错误 1
    make: *** [miscutils] 错误 2
###问题原因：
	缺少ubi-user.h这个头文件


###解决方法：
	用linux-2.6.29内核源码中的/include/mtd/ubi-user.h 拷贝到
	busybox源码 busybox-1.20.3/include/mtd/此目录下即可。
##问题3编译Linux内核遇到如下的问题
###问题描述
，错误提示如下：.root@R61:/usr/src/linux-4.0.4# make menuconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/mconf.o
In file included from scripts/kconfig/mconf.c:23:0:
scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: 没有那个文件或目录
 #include CURSES_LOC
                    ^
compilation terminated.
scripts/Makefile.host:108: recipe for target 'scripts/kconfig/mconf.o' failed
make[1]: *** [scripts/kconfig/mconf.o] Error 1
Makefile:543: recipe for target 'menuconfig' failed
make: *** [menuconfig] Error 2
###解决方案：
scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: 没有那个文件或目录
应该是curses库没安装吧。
##问题四 网络ping
后来各种编译好了之后，但是网络ping还是不能运行，在网上找了各种方法，都没有方案，最后是参照杨海宇同学的内核编译信息
repo里面有杨海宇的linux的设置，和完整的ramdisk，才让网络能够ping通。
    