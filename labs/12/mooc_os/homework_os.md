#Linux4.0.4 配置文件解析
###P14206024 曹立
 * [1.配置解析](#1)
 * [2.linux中设备驱动](#2)
 * [3.linux I/O设备](#3)
 * [4.实验中遇到的问题及解决办法](#5)
 
这篇文档介绍的是编译[Linux4.0.4][6]源码时的部分配置文件的说明文档,参考的配置文件[myconfig2][1]的513-791行，该配置条件下可保证完成内核的上网功能。主要包含编译的基本配置，Network testing（网络测试），Device Drivers(设备驱动)，Bus devices(总线设备)，Misc devices（杂项设备），EEPROM support（传感器的支持）和SCSI device support（SCSI设备支持），Input device support（输入设备的支持），Input Device Drivers（输入设备的驱动等等）。涉及的核心是设备的支持，硬件驱动等的支持。


<h1 id="1">配置解析</h1>



##Network testing
    # CONFIG_NET_PKTGEN is not set  
    #PKTGEN没有设置，NKTGEN是一种发包工具
    # CONFIG_HAMRADIO is not set
    #amateur无线电支持，该项不会影响内核：说N只会造成配置跳过所有关于业余无线电的问题。
    # CONFIG_CAN is not set
    #控制器区域网络（CAN）是一个缓慢的（高达1Mbit/s）串行通信协议
    #
    # CONFIG_IRDA is not set 
    #是一个实现红外无线数据传输的工业标准。

    # CONFIG_BT is not set
    # CONFIG_AF_RXRPC is not set
    #y这里表示包括支持rxrpc会话套接字，这些用于AFS内核文件系统，该模块目前只支持客户端操作，目前是不完整的。
    # CONFIG_WIRELESS is not set
    #无线网络模块
    # CONFIG_WIMAX is not set
    #IEEE802.16标准,又称WiMAX,或广带无线接入
    # CONFIG_RFKILL is not set
    #蓝牙设备平台
    # CONFIG_NET_9P is not set
    #9P文件系统
    # CONFIG_CAIF is not set
    # "Communication CPU to Application CPU Interface"
    #（CAIF）是一种基于分组的面向连接的通讯协议,如果你建立一个手机产品(android或者meego)选择他。否则N
    # CONFIG_CEPH_LIB is not set
    # CONFIG_NFC is not set
    #NFC模块

##Devices driver分析
##Device Drivers
    
     # Generic Driver Options
       #驱动程序通用选项
     #
     # CONFIG_UEVENT_HELPER is not set
      #热插拔相关
     # CONFIG_DEVTMPFS is not set
      #在"/dev"目 录挂载devtmpfs文件系统
     # CONFIG_STANDALONE is not set
      #独立进程模式运行
     # CONFIG_PREVENT_FIRMWARE_BUILD is not set
      #防止固件被建立，固件一般随着驱动被装载。如果需要更新固件，
      #需要重新编译
     # CONFIG_FW_LOADER is not set
      #固件加载支持。
     # CONFIG_ALLOW_DEV_COREDUMP is not set
       #允许设备产生core dump动作，什么是coredump动作？
       #我们在开发（或使用）一个程序时，最怕的就是程序莫明其妙地#
       #当掉。
       #虽然系统没事，但我们下次仍可能遇到相同的问题。于是这时操
       #作系统就会把程序当掉 时的内存内容 dump 出来（现在通常是
       #写在一个叫 core 的 file 里面），让 我们或是 debugger 
       #做为参考。这个动作就叫作 core dump。
     # CONFIG_DEBUG_DRIVER is not set
      #如果你想驱动核心产生一系列的调试信息到日志文件中，请选择
      #它。对驱动核心比较感冒，想知道更多关于它的发生情况。
     # CONFIG_DEBUG_DEVRES is not set
      #管理设备资源，产生详细的调试信息，如果不确定，请选择N

     # CONFIG_SYS_HYPERVISOR is not set
      #该目录是与虚拟化Xen相关的装置。(Xen是一个开放源代码的虚拟
      #机监视器)
     # CONFIG_GENERIC_CPU_DEVICES is not set
     CONFIG_GENERIC_CPU_AUTOPROBE=y

     # CONFIG_DMA_SHARED_BUFFER is not set
      #This option enables the framework for buffer-
      #sharing between multiple drivers. A buffer is
      #associated with a file using driver APIs extension;
      #the file's descriptor can then be passed on to
      #other driver.

##Bus devices  
      #总线设备
     # CONFIG_CONNECTOR is not set
     # CONFIG_MTD is not set
      #特殊的存储技术装置,如常用于数码相机或嵌入式系统的闪存卡CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
     #选择此项if the architecture might have PC parallel
     #port hardware.
     # CONFIG_PARPORT is not set
      #设备支持,比如deviceid之类的程序需要使用它,大部分人可以关
      #闭该选项

##Misc devices
       #杂项设备
     # CONFIG_SENSORS_LIS3LV02D is not set
      #这个驱动提供譬如：LIS3* accelerometers, such as the
      #LIS3LV02DL or the LIS331DL支持，在hp笔记本中比较常见，
      #使具有3D DriveGuard特性
     # CONFIG_DUMMY_IRQ is not set
       #该模块接受单一的IRQ参数，它应该注册。这个模块的唯一目的是
       #帮助调试spurious IRQs would happen on disabled IRQ 
       #vector的系统
     # CONFIG_IBM_ASM is not set
     # CONFIG_PHANTOM is not set
     #如果你想为Sensable PHANToM设备build a driver，选Y，这个
     #驱动仅仅是为PCI PHANToMs.PCI PHANToMs.
     # CONFIG_SGI_IOC4 is not set
     #This option enables basic support for the IOC4 chip
     #on certain SGI IO controller cards (IO9, IO10, and
     #PCI-RT). This option does not enable any specific
     #functions on such a card, but provides #necessaryinfrastructure for other drivers to #utilize.
     # CONFIG_TIFM_CORE is not set
      #enable表示生成核心转储，disable节省大约4k
     # CONFIG_ENCLOSURE_SERVICES is not set
     #Provides support for intelligent enclosures (bays #which contain storage devices). You also need either #a host driver (SCSI/ATA) which supports enclosures #or a SCSI enclosure device (SES) to use these #services.

     # CONFIG_HP_ILO is not set
     # CONFIG_PCH_PHUB is not set
     #This driver is for PCH(Platform controller Hub) PHUB
     #(Packet Hub) of Intel Topcliff which is an IOH
     #(Input/Output Hub) for x86 embedded processor. The
     #Topcliff has MAC address and Option ROM data in
     #SROM. This driver can access MAC address and Option
     #ROM data in SROM.This driver also can be used for
     #OKI SEMICONDUCTOR IOH(Input/ Output Hub), ML7213 and
     #ML7223. ML7213 IOH is for IVI(In-Vehicle
     #Infotainment) use and ML7223 IOH is for MP(Media
     #Phone) use. ML7213/ML7223 is companion chip for
     #Intel Atom E6xx series. ML7213/ML7223 is completely
     #compatible for Intel EG20T PCH.To compile this
     #driver as a module, choose M here: the module will
     #be called pch_phub.

     # CONFIG_SRAM is not set
     #这个驱动程序允许你声明一个由genalloc API管理的内存区域，

     # CONFIG_C2PORT is not set
     #This option enables support for Silicon Labs C2 port
     #used to program Silicon micro controller chips 如果你
     #的主板有没有这样的微控制器，你不需要这个接口的所有。

##EEPROM support
      #传感器EEPROM支持
     # CONFIG_EEPROM_93CX6 is not set
      #传感器EEPROM chipsets 93c46 and 93c66驱动支持
 
     # CONFIG_CB710_CORE is not set
     #这个选项目的是支持在一些笔记本上面能识别PCI ENE CB710/720
     #山村卡读卡器

     # Texas Instruments shared transport line discipline
     #
     # Altera FPGA firmware download module
     #
     # CONFIG_VMWARE_VMCI is not set
      #vmware虚拟机驱动(This is VMware's Virtual Machine
      #Communication Interface. It enables high-speed 
      #communication between host and guest in a virtual 
      #environment via the VMCI virtual device.)
     #
     # Intel MIC Bus Driver
      #MIC总线驱动
     # Intel MIC Host Driver
      #intel麦克风驱动
     # Intel MIC Card Driver
      #intel mic 卡驱动

     # CONFIG_ECHO is not set
      #This driver provides line echo cancelling support 
      #for mISDN and Zaptel drivers.

     # CONFIG_CXL_BASE is not set

    CONFIG_HAVE_IDE=y
     # SCSI device support
      #SCSI设备支持

    CONFIG_SCSI_MOD=y
      #scsi模块
     # CONFIG_SCSI_DMA is not set
     # CONFIG_SCSI_NETLINK is not set
     # CONFIG_FUSION is not set
     # IEEE 1394 (FireWire) support
     
     # CONFIG_FIREWIRE is not set
      #他是新一代的IEEE 1394驱动程序栈，一种新的实现设计的具有鲁
      #棒性和简单性。
  
     # CONFIG_FIREWIRE_NOSY is not set
      #是IEEE 1394的数据包嗅探器，用于协议分析和IEEE 1394的驱动
      #程序，应用程序开发，或固件。
 
     # CONFIG_MACINTOSH_DRIVERS is not set
      #用于Macintosh电脑设备的选项选择。这一选项不添加任何内核代
      #码。

    CONFIG_NETDEVICES=y
      #如果你不打算将你的Linux BOX连接其他电脑。选N，如果你的电
      #脑有网卡，在linux下使用，选Y，
 
    CONFIG_NET_CORE=y
      #如果你不打算使用任何联网的核心驱动，选N ,这里显然Y。
 
     # CONFIG_BONDING is not set
      #Say 'Y' or 'M' if you wish to be able to 'bond' 
      #multiple Ethernet Channels together.
 
     # CONFIG_DUMMY is not set
      #这基本上是一可配置的IP地址的 bit-bucket装置，最常用在于在
      #本地程序中让你当前的inactive的SLIP地址看起来像个真实的地
      #址，
      #如果你使用SLIP or PPP, 选Y
 
     # CONFIG_EQUALIZER is not set
      #如果你有两个串口连接到其他计算机，你使用SLIP或PPP在他们身
      #上，使用这个驱动程序你可以使他们的行为像一个双速连接。
 
     # CONFIG_NET_TEAM is not set
     # CONFIG_MACVLAN is not set
      #This allows one to create virtual interfaces that 
      #teams together multiple ethernet devices.
      #Team devices can be added using the "ip" command 
      #from the iproute2 package:
      #"ip link add link [ address MAC ] [ NAME ] type 
      #team"
 
     # CONFIG_VXLAN is not set
      #这可以创造一个VXLAN虚拟接口 provide Layer 2 Networks 
      #over Layer 3 Networks
 
     # CONFIG_NETCONSOLE is not set
      #If you want to log kernel messages over the 
      #network，enable Y

     # CONFIG_NETPOLL is not set
     # CONFIG_NET_POLL_CONTROLLER is not set
 
     # CONFIG_TUN is not set
      #TUN/TAP提供用户空间程序包的接收和发送。它可以被看作是一个
      #简单的点对点或以太网设备
      #而不是从物理介质接收数据包，接收来自用户空间的程序，而不是
      #发送数据包通过物理介质写入到用户空间的程序。

     # CONFIG_VETH is not set
      #这个装置是一个本地以太网隧道。Devices are created in 
      #pairs. When one end receives the packet it appears 
      #on its pair and vice versa.

     # CONFIG_NLMON is not set
      #This option enables a monitoring net device for 
      #netlink skbs.
      #这样做的目的是为了数据包套接字分析Netlink消息。
     # CONFIG_ARCNET is not set
      #You need both this driver, and the driver for the 
      #particular ARCnet chipset of your card. If youZ
      #don't know, then it's probably a COM90xx type card,
     # CAIF transport drivers

     # Distributed Switch Architecture drivers
     #
     # CONFIG_NET_DSA_MV88E6XXX is not set
      #
     # CONFIG_NET_DSA_MV88E6060 is not set
      #This enables support for the Marvell 88E6060 
      #ethernet switch chip.

     # CONFIG_NET_DSA_MV88E6XXX_NEED_PPU is not set
 
     # CONFIG_NET_DSA_MV88E6131 is not set
      #This enables support for the Marvell 
      #88E6085/6095/6095F/6131 ethernet switch chips.

     # CONFIG_NET_DSA_MV88E6123_61_65 is not set
      #This enables support for the Marvell 
      #88E6123/6161/6165 ethernet switch chips.
 
     # CONFIG_NET_DSA_MV88E6171 is not set
      #This enables support for the Marvell 88E6171 
      #ethernet switch chip.

     # CONFIG_NET_DSA_MV88E6352 is not set
      #This enables support for the Marvell 88E6176 and 
      #88E6352 ethernet switch chips.

     # CONFIG_NET_DSA_BCM_SF2 is not set
      #This enables support for the Broadcom Starfighter 2 
      #Ethernet switch chips.

     CONFIG_ETHERNET=y
      #以太网
     # CONFIG_NET_VENDOR_3COM is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_ADAPTEC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.
 
     # CONFIG_NET_VENDOR_AGERE is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_ALTEON is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_ALTERA_TSE is not set
      #This driver supports the Altera Triple-Speed (TSE) 
      #Ethernet MAC.

     # CONFIG_NET_VENDOR_AMD is not set
      #If you have a network (Ethernet) chipset belonging 
      #to this class, say Y.

     # CONFIG_NET_XGENE is not set
      #This is the Ethernet driver for the on-chip 、
      #ethernet interface on the APM X-Gene SoC.

     # CONFIG_NET_VENDOR_ARC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO,  
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_ATHEROS is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_BROADCOM is not set
      #If you have a network (Ethernet) chipset belonging 
      #to this class, say Y.

     # CONFIG_NET_VENDOR_BROCADE is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_CHELSIO is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_CISCO is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_CX_ECAT is not set
      #Driver for EtherCAT master module located on CCAT 
      #FPGA that can be found on Beckhoff CX5020, and 
      #possibly other of CX Beckhoff CX series industrial 
      #PCs.

     # CONFIG_DNET is not set
      #the Dave ethernet interface (DNET) is found on Qong 
      #Board FPGA. Say Y to include support for the DNET 
      #chip.

     # CONFIG_NET_VENDOR_DEC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_DLINK is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_EMULEX is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html      
      #howto.

     # CONFIG_NET_VENDOR_EXAR is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_HP is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

    CONFIG_NET_VENDOR_INTEL=y
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_E100 is not set
      #This driver supports Intel(R) PRO/100 family of 
      #adapters

    CONFIG_E1000=y
      #This driver supports Intel(R) PRO/1000 gigabit 
      #ethernet family of adapters.
    CONFIG_E1000E=y
      #This driver supports the PCI-Express Intel(R) 
      #PRO/1000 gigabit ethernet family of adapters. For 
      #PCI or PCI-X e1000 adapters, use the regular e1000 
      #driver For more information on how to identify your 
      #adapter, go to the Adapter & Driver ID Guide at:
      #http://support.intel.com/support/network/adapter/pro100/21397.htm

     # CONFIG_IGB is not set
      #同上

     # CONFIG_IGBVF is not set
      #This driver supports Intel(R) 82576 virtual 
      #functions. For more information on how to identify 
      #your adapter, go to the Adapter & Driver ID Guide 
      #at:
      #http://support.intel.com/support/network/adapter/
      #pro100/21397.htm
      #For general information and support, go to the 
      #Intel support website at:
      #http://support.intel.com
      #More specific information on configuring the driver 
      #is in Documentation/networking/e1000.txt.
 

     # CONFIG_IXGB is not set
      #This driver supports Intel(R) PRO/10GbE family of 
      #adapters for PCI-X type cards. For PCI-E type 
      #cards, use the "ixgbe" driver instead. For more 
      #information on how to identify your adapter, go to 
      #the Adapter & Driver ID Guide at:
      #http://support.intel.com/support/network/adapter/
      #pro100/21397.htm
      #For general information and support, go to the 
      #Intel support website at:
      #http://support.intel.com
      #More specific information on configuring the driver 
      #is in Documentation/networking/ixgb.txt.
 
 

     # CONFIG_IXGBE is not set
      #This driver supports Intel(R) 10GbE PCI Express 
      #family of adapters. For more information on how to 
      #identify your adapter, go to the Adapter & Driver 
      #ID Guide at:
      #http://support.intel.com/support/network/adapter/
      #pro100/21397.htm
      #For general information and support, go to the 
      #Intel support website at:
      #http://support.intel.com

     # CONFIG_I40E is not set
      #This driver supports Intel(R) Ethernet Controller 
      #XL710 Family of devices. For more information on 
      #how to identify your adapter, go to the Adapter & 
      #Driver ID Guide at:
      #http://support.intel.com/support/network/adapter/
      #pro100/21397.htm
      #For general information and support, go to the 
      #Intel support website at:
      #http://support.intel.com

     # CONFIG_NET_VENDOR_I825XX is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     #howto.
      #Note that the answer to this question does not 
      #directly affect the kernel: saying N will just 
      #cause the configurator to skip all the questions 
      #about these devices. If you say Y, you will be 
      #asked for your specific card in the following 
      #questions.

     # CONFIG_IP1000 is not set
      #This driver supports IP1000 gigabit Ethernet cards.

     # CONFIG_JME is not set
      #This driver supports the PCI-Express gigabit 
      #ethernet adapters based on JMicron JMC250 chipset.

     # CONFIG_NET_VENDOR_MARVELL is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_MELLANOX is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_MICREL is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_MYRI is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.
 
     # CONFIG_FEALNX is not set
      #Say Y here to support the Myson MTD-800 family of 
      #PCI-based Ethernet cards. http://www.myson.com.tw/

     # CONFIG_NET_VENDOR_NATSEMI is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_NVIDIA is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_OKI is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_ETHOC is not set
      #Say Y here if you want to use the OpenCores 10/100 
      #Mbps Ethernet MAC.
 
     # CONFIG_NET_PACKET_ENGINE is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_QLOGIC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_QUALCOMM is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_REALTEK is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_RDC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_ROCKER is not set
      #If you have a network device belonging to this 
      #class, say Y.

     # CONFIG_NET_VENDOR_SAMSUNG is not set
      #If you have a network (Ethernet) chipset belonging 
      #to this class, say Y.

     # CONFIG_NET_VENDOR_SEEQ is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_SILAN is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_SIS is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_SFC is not set
      #This driver supports 10-gigabit Ethernet cards 
      #based on the Solarflare SFC4000 and SFC9000-family 
      #controllers.

     # CONFIG_NET_VENDOR_SMSC is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_STMICRO is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto. 
 
     # CONFIG_NET_VENDOR_SUN is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_TEHUTI is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_TI is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_VIA is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_NET_VENDOR_WIZNET is not set
      #If you have a network (Ethernet) card belonging to 
      #this class, say Y and read the Ethernet-HOWTO, 
      #available from http://www.tldp.org/docs.html     
      #howto.

     # CONFIG_FDDI is not set
      #Fiber Distributed Data Interface is a high speed 
      #local area network design; essentially a 
      #replacement for high speed Ethernet. FDDI can run 
      #over copper or fiber. If you are connected to such 
      #a network and want a driver for the FDDI card in 
      #your computer, say Y here (and then also Y to the 
      #driver for your FDDI card, below). Most people will 
      #say N.
 
     # CONFIG_HIPPI is not set
      

     # CONFIG_PHYLIB is not set
      #Ethernet controllers are usually attached to PHY 
      #devices. This option provides infrastructure for 
      #managing PHY devices.
 
     # CONFIG_PPP is not set
      #PPP (Point to Point Protocol) is a newer and better 
      #SLIP. It serves the same purpose: sending Internet 
      #traffic over telephone (and other serial) lines. 
      #Ask your access provider if they support it, 
      #because otherwise you can't use it; most Internet 
      #access providers these days support PPP rather than 
      #SLIP.

     # CONFIG_SLIP is not set
      
     
     # Host-side USB support is needed for USB Network 
     #Adapter support
     #主机端(Host-side)USB支持.通用串行总线(USB)是一个串行总线
     #子系统规范,它比传统的串口速度更快并且特性更丰富(供电,热插
     #拔,最多可接127个设备等),有望在将来一统PC外设接口.USB
     #的"Host"(主机)被称为"根"(也可以理解为是主板上的USB控制
     #器),外部设备被称为"叶子",而内部的节点则称为"hub"(集线器).
     #基本上只要你想使用任何USB设备都必须选中此项.另外,你还需要从
     #下面选中至少一个"Host Controller Driver"(HCD),比如适用
     #于USB1.1的"UHCI HCD support"或"OHCI HCD support",适用
     #于USB2.0的"EHCI HCD (USB 2.0) support".如果你拿不准的话
     #把他们全部选中一般也不会出问题.如果你的系统有设备端的USB接
     #口(也就是你的系统可以作为"叶子"使用),请到"USB Gadget"中进
     #行选择.
     # CONFIG_WLAN is not set
      #wlan上网配置

     # Enable WiMAX (Networking options) to see the WiMAX #drivers
     #
     # CONFIG_WAN is not set
      #wan接口
     # CONFIG_VMXNET3 is not set
      #This driver supports VMware's vmxnet3 virtual 
      #ethernet NIC.

      # CONFIG_ISDN is not set
   
     # Input device support
     # 输入设备
    CONFIG_INPUT=y
     # CONFIG_INPUT_FF_MEMLESS is not set
      #游戏玩家使用的力反馈设备
     # CONFIG_INPUT_POLLDEV is not set
      #Say Y here if you are using a driver for an input 
      #device that periodically polls hardware state. This 
      #option is only useful for out-of-tree drivers since 
      #in-tree drivers select it automatically.

     # CONFIG_INPUT_SPARSEKMAP is not set
     # CONFIG_INPUT_MATRIXKMAP is not set

     #
     # Userland interfaces
     #
     # CONFIG_INPUT_MOUSEDEV is not set
      #鼠标设备输入
     # CONFIG_INPUT_JOYDEV is not set
      #游戏设备输入
     # CONFIG_INPUT_EVDEV is not set
      #能够利用/dev/input/eventX来存取输入设备的事件
     # CONFIG_INPUT_EVBUG is not set
      #该选项仅供调试
     #
     # Input Device Drivers
      #输入设备
     #
    CONFIG_INPUT_KEYBOARD=y
      #通用输入层，使用键盘必选
    CONFIG_KEYBOARD_ATKBD=y
      #键盘驱动,一般选个AT键盘即可
     # CONFIG_KEYBOARD_LKKBD is not set
      #键盘驱动,LK键盘
     # CONFIG_KEYBOARD_NEWTON is not set
     # CONFIG_KEYBOARD_OPENCORES is not set
     # CONFIG_KEYBOARD_STOWAWAY is not set
     # CONFIG_KEYBOARD_SUNKBD is not set
      #键盘驱动,SUN键盘
     # CONFIG_KEYBOARD_XTKBD is not set
      #键盘驱动,XTK键盘
     # CONFIG_INPUT_MOUSE is not set
      #鼠标驱动,一般选个PS/2鼠标即可
     # CONFIG_INPUT_JOYSTICK is not set
      #游戏杆驱动
     # CONFIG_INPUT_TABLET is not set
      #
     # CONFIG_INPUT_TOUCHSCREEN is not set
      #触屏驱动
     # CONFIG_INPUT_MISC is not set
      #Say Y here, and a list of miscellaneous input 
      #drivers will be displayed. Everything that didn't 
      #fit into the other categories is here. This option 
      #doesn't affect the kernel.

     #
     # Hardware I/O ports
      #硬件I/O端口
     #
    CONFIG_SERIO=y
      #使用PS/2键盘或鼠标的
    CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
      #Select this config option from the architecture 
      #Kconfig if the architecture might use a PC serio 
      #device (i8042) to communicate with keyboard, mouse, 
      #etc.
 
    CONFIG_SERIO_I8042=y
      #i8042 is the chip over which the standard AT 
      #keyboard and PS/2 mouse are connected to the 
      #computer. If you use these devices, you'll need to 
      #say Y here.

    CONFIG_SERIO_SERPORT=y
      #Say Y here if you plan to use an input device 
      #(mouse, joystick, tablet, 6dof) that communicates 
      #over the RS232 serial (COM) port.

     # CONFIG_SERIO_CT82C710 is not set
      #Say Y here if you have a Texas Instruments 
      #TravelMate notebook equipped with the ct82c710 chip 
      #and want to use a mouse connected to the 
      #"QuickPort".

     # CONFIG_SERIO_PCIPS2 is not set
      #ay Y here if you have a Mobility Docking station 
      #with PS/2 keyboard and mice ports.

    CONFIG_SERIO_LIBPS2=y
      #Say Y here if you want to have raw access to serio 
      #ports, such as AUX ports on i8042 keyboard 
      #controller.

     # CONFIG_SERIO_RAW is not set
      #Say Y here if you want to have raw access to serio 
      #ports, such as AUX ports on i8042 keyboard 
      #controller.

     # CONFIG_SERIO_ALTERA_PS2 is not set
      #Say Y here if you have Altera University Program 
      #PS/2 ports.

     # CONFIG_SERIO_PS2MULT is not set
      #Say Y here if you have the PS/2 line multiplexer 
      #like the one present on TQC boards.
 
     # CONFIG_SERIO_ARC_PS2 is not set
      #Say Y here if you have an ARC FPGA platform with a 
      #PS/2 controller in it.

     # CONFIG_GAMEPORT is not set
      #就是早年"小霸王"游戏机上的那种手柄

     #
     # Character devices
      #字符设备
     #
    CONFIG_TTY=y
    CONFIG_VT=y
      #虚拟终端，
    CONFIG_CONSOLE_TRANSLATIONS=y
      #内核将一个虚拟终端用作系统控制台(将诸如模块错误/内核错误/
      #启动信息之类的警告信息发送到这里,通常是第一个虚拟终端).除
      #非是嵌入式系统,否则必选
    CONFIG_VT_CONSOLE=y
      #
 
    CONFIG_HW_CONSOLE=y
      #If you do say Y here, by default the currently 
      #visible virtual terminal (/dev/tty0) will be used 
      #as system console. You can change that with a 
      #kernel command line option such as "console=tty3" 
      #which would use the third virtual terminal as 
      #system console.
     # CONFIG_VT_HW_CONSOLE_BINDING is not set
      # If more than 1 console driver is enabled, setting 
      #this to 'y' will allow you to select the console 
      #driver that will serve as the backend for the 
      #virtual terminals.

     # CONFIG_UNIX98_PTYS is not set
      #伪终端(PTY)可以模拟一个终端,它由slave(等价于一个物理终端)
      #和master(被一个诸如xterms之类的进程用来读写slave设备)两
      #部分组成的软设备.使用telnet或ssh远程登录者必选
     # CONFIG_LEGACY_PTYS is not set
      #A pseudo terminal (PTY) is a software device 
      #consisting of two halves: a master and a slave. The 
      #slave device behaves identical to a physical 
      #terminal; the master device is used by a process to 
      #read data from and write data to the slave, thereby 
      #emulating a terminal. Typical programs for the 
      #master side are telnet servers and xterms.

     # CONFIG_SERIAL_NONSTANDARD is not set
      #Say Y here if you have any non-standard serial 
      #boards
 
     # CONFIG_NOZOMI is not set
      #If you have a HSDPA driver Broadband Wireless Data 
      #Card - Globe Trotter PCMCIA card, say Y here.
 
     # CONFIG_N_GSM is not set
      #This line discipline provides support for the GSM 
      #MUX protocol and presents the mux as a set of 61 
      #individual tty devices.

     # CONFIG_TRACE_SINK is not set
      #This is to provide a way to extract modem trace 
      #data on devices that do not have a PTI HW module, 
      #or just need modem trace data to come out of a 
      #different HW output port. 

     # CONFIG_DEVMEM is not set
      #Say Y here if you want to support the /dev/mem 
      #device. The /dev/mem device is used to access areas 
      #of physical memory. When in doubt, say "Y".
 
     # CONFIG_DEVKMEM is not set
      #Say Y here if you want to support the /dev/kmem 
      #device
      #The /dev/kmem device is rarely used, but can be 
      #used for certain kind of kernel debugging 
      #operations.




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
