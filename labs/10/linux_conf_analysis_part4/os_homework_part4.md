#Linux4.0.4 配置文件解析
###P14206034 高齐琦   
 * [1.配置解析](#1)
 * [2.实验中遇到的问题及解决办法](#2)
 
这篇文档介绍的是编译[Linux4.0.4][1]源码时的部分配置文件的说明文档,参考的配置文件[myconfig2][2]的第四部分，该配置条件下可保证完成内核的上网功能。主要包含I2C协议的配置，图形方面的配置和时钟源驱动的配置等。
<h1 id="1">配置解析</h1>
##Serial drivers的配置
    Serial drivers
    
    CONFIG_SERIAL_8250=y
    #8250芯片串口驱动配置
    CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
    #8250芯片禁用
    CONFIG_SERIAL_8250_CONSOLE is not set
    #8250芯片串口控制台
    CONFIG_SERIAL_8250_PCI=y
    CONFIG_SERIAL_8250_NR_UARTS=4
    #改变最大串口数量默认值
    CONFIG_SERIAL_8250_RUNTIME_UARTS=4
    #linux发行的8250驱动一般默认限制检测的最大串口数量是4
    CONFIG_SERIAL_8250_EXTENDED is not set
    #拓展功能
    CONFIG_SERIAL_8250_DW is not set
##serial port support的配置 
    
     Non-8250 serial port support 
    #支持对非8250串口驱动设备
    CONFIG_SERIAL_MFD_HSU is not set
    #串口驱动的历史数据
    CONFIG_SERIAL_CORE=y 
    #仅仅配置串口内核，其他的串口设备不给予支持
    CONFIG_SERIAL_JSM is not set
    #作业定序模块串口
    CONFIG_SERIAL_SCCNXP is not set
    CONFIG_SERIAL_TIMBERDALE is not set
    CONFIG_SERIAL_ALTERA_JTAGUART is not set
    #JTAG UART的串口配置，开发板与PC之间调试、通信会用到这个IP核
    CONFIG_SERIAL_ALTERA_UART is not set
    #通用异步接受/发送装置串口配置

    CONFIG_SERIAL_PCH_UART is not set
    #收发时寻呼信道串口配置
    CONFIG_SERIAL_ARC is not set
    #声音控制串口配置
    CONFIG_SERIAL_RP2 is not set
    #无线串口配置
    CONFIG_SERIAL_FSL_LPUART is not set
    #文本串口配置
    CONFIG_TTY_PRINTK is not set
    #电传打字机的打印内核
    CONFIG_IPMI_HANDLER is not set
    #智能平台管理接口的处理器
    CONFIG_HW_RANDOM is not set
    #随机存储硬件的支持
    CONFIG_NVRAM is not set
    #非易失随机存取存储器
    CONFIG_R3964 is not set
    #使用西门子R3964协议的设备同步通信
    CONFIG_APPLICOM is not set
    #公司生产的用于现场总线连接卡，一般都会设置使用上述的西门子R3964协议
    CONFIG_SONYPI is not set
    CONFIG_MWAVE is not set
    CONFIG_PC8736x_GPIO is not set
    CONFIG_NSC_GPIO is not set
    #国际标准通用输入输出
    CONFIG_HANGCHECK_TIMER is not set
    #定时器校正的配置
    CONFIG_TCG_TPM is not set
    #可信平台模块的可信计算组织设置
    CONFIG_TELCLOCK is not set
    #电子时钟的配置
    CONFIG_DEVPORT=y
    #设备端口控制，用于识别外界连接
    CONFIG_XILLYBUS is not set
    #总线设置
##I2C support的配置
    
    I2C support
    #用于感知硬件状态，比如温度，风扇转速。 
    CONFIG_I2C is not set
    #I2C是Philips极力推动的微控制应用中使用的低速串行总线协议。如果要支持Video For Linux，该项必选。这里不配置
    CONFIG_SPI is not set
    #SPI总线协议
    CONFIG_SPMI is not set
    CONFIG_HSI is not set
    #以上均是各种总线协议
    
    
    PPS support 
    CONFIG_PPS=y
    #开发对PPS的支持
    CONFIG_PPS_DEBUG is not set
    #PPS调试功能
    CONFIG_NTP_PPS is not set
    
    
    PPS clients support
    #PPS客户端支持
    CONFIG_PPS_CLIENT_KTIMER is not set
    CONFIG_PPS_CLIENT_LDISC is not set
    #客户端的终端设备
    CONFIG_PPS_CLIENT_GPIO is not set
    #客户端的通用输入输出
    
   
   
    
##PTP clock support的配置  
    
    PTP clock support
    #PTP时钟支持
    CONFIG_PTP_1588_CLOCK=y
    #PTP（Precision Time Protocol，精确时间协议）是一个时间同步的协议，1588是网络测量和控制
    #系统的精密时钟同步协议标准，采用PTP协议，这里的配置PTP时钟，是为了网络通信中，保持设备的时间和频率同步。
   
    
    CONFIG_PTP_1588_CLOCK_PCH is not set
    #1588是一个精准时钟协议
    CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y 
    #使用gpiolib并把它编译进内核。GPIO（“通用目的输入/输出端口”）是一个灵活的软件控制的数字信号，用于控制输入输出。
    CONFIG_GPIOLIB is not set
    CONFIG_W1 is not set
    CONFIG_POWER_SUPPLY is not set
    CONFIG_POWER_AVS is not set
    #以上两条与供电能源相关
    CONFIG_HWMON is not set
    #传感器
    CONFIG_THERMAL is not set
    #保温功能
    CONFIG_WATCHDOG is not set
    #PTP的监控系统
    CONFIG_SSB_POSSIBLE=y 
    #此选项为呼叫功能
##Sonics Silicon Backplane的配置    
    
    # Sonics Silicon Backplane
    
    CONFIG_SSB is not set
    #single_side_band单边带
    CONFIG_BCMA_POSSIBLE=y
    #这些驱动用于使用基于AMBA协议的总线
    
    
    Broadcom specific AMBA
    
    CONFIG_BCMA is not set
    
    
    Multifunction device drivers          
   #多功能设备驱动，指的是在单片集成电路上切入一些其他功能的设备
   #如个GPIO，触摸屏，键盘，电流调节器，电源管理芯片等
   #为了缩减内核，该内核不添加任何其他的外部设备

     CONFIG_MFD_CORE is not set
     #多功能显示器内核
     CONFIG_MFD_CS5535 is not set
     #型号为CS5535
     CONFIG_MFD_CROS_EC is not set
     CONFIG_HTC_PASIC3 is not set
     #热传导功能器设备
     CONFIG_LPC_ICH is not set
     #线性功率控制器
     CONFIG_LPC_SCH is not set
     CONFIG_MFD_JANZ_CMODIO is not set
     #多功能显示器声音控制器
     CONFIG_MFD_KEMPLD is not set
     #通用输入输出的配置器
     CONFIG_MFD_RDC321X is not set
     
     CONFIG_MFD_RTSX_PCI is not set
     #外接插口的配置
     CONFIG_MFD_SM501 is not set
     CONFIG_ABX500_CORE is not set
     #内核映像文件配置
     CONFIG_MFD_SYSCON is not set
     #多功能显示器的系统配置器
     CONFIG_MFD_TI_AM335X_TSCADC is not set
     #多功能显示器触摸屏的配置
     CONFIG_MFD_TMIO is not set
     CONFIG_MFD_VX855 is not set
     #型号VX855多功能显示器配置
     CONFIG_REGULATOR is not set
     #调节器设备驱动
     CONFIG_MEDIA_SUPPORT is not set
     #媒体设备支持
##Graphics support 的配置    
    
    Graphics support 
    #图形支持，支持VGA接口，最多使用的GPU为16
    
    CONFIG_AGP is not set
    #PC的图形系列接口的一种，全称Accelerated Graphic Ports
    CONFIG_VGA_ARB=y
    CONFIG_VGA_ARB_MAX_GPUS=16
    #最大值为16
    
    
    Direct Rendering Manager
    
    CONFIG_DRM is not set
    
    
    Frame buffer Devices
    #帧缓冲器设备
    CONFIG_FB is not set
    CONFIG_BACKLIGHT_LCD_SUPPORT is not set 
    #灯背后照片设置
    CONFIG_VGASTATE is not set 
    #显示状态不需要配置
    
    
    Console display driver support
    
    CONFIG_VGA_CONSOLE=y
    #VGA的控制台
    CONFIG_VGACON_SOFT_SCROLLBACK is not set
    CONFIG_DUMMY_CONSOLE=y 
    #控制台演示驱动，设置虚拟演示台的宽度与长度分别为80和25.
    CONFIG_DUMMY_CONSOLE_COLUMNS=80
    CONFIG_DUMMY_CONSOLE_ROWS=25
    CONFIG_SOUND is not set
##HID support的配置    
    
    
    HID support
    #人力工程学设备
    CONFIG_HID is not set
    CONFIG_USB_OHCI_LITTLE_ENDIAN=y
    #注册开放型USB主机控制器驱动
     CONFIG_USB_SUPPORT is not set
    #支持USV接口
     CONFIG_UWB is not set
     CONFIG_MMC is not set
     CONFIG_MEMSTICK is not set
     CONFIG_NEW_LEDS is not set
     CONFIG_ACCESSIBILITY is not set
     CONFIG_INFINIBAND is not set
     CONFIG_EDAC is not set
     CONFIG_RTC_LIB=y 
     #引入函数库，提供一些辅助函数，闰年计算，日期有效性验证之类的。
     CONFIG_RTC_CLASS is not set
     CONFIG_DMADEVICES is not set
     CONFIG_AUXDISPLAY is not set
     CONFIG_UIO is not set
     CONFIG_VIRT_DRIVERS is not set
##virtio网卡配置驱动的配置   
    
     Virtio drivers 
     #virtio网卡配置驱动
    
     CONFIG_VIRTIO_PCI is not set
     #关于virtio网卡的总线
     CONFIG_VIRTIO_MMIO is not set
    
    
     Microsoft Hyper-V guest support
    
     CONFIG_STAGING is not set
     CONFIG_X86_PLATFORM_DEVICES is not set
     CONFIG_CHROME_PLATFORMS is not set
    
    
     Hardware Spinlock drivers
    
##时钟源驱动配置    
    
     Clock Source drivers 
     #时钟源驱动配置，一般有两个功能(1)定时触发中断；(2)维护和读取当前时间。
    
    CONFIG_CLKSRC_I8253=y 
    #时钟频率
    CONFIG_CLKEVT_I8253=y
    #计数时钟clkevt，计数模式时的外部计数脉冲信号。
    CONFIG_CLKBLD_I8253=y
    #另一种计数时钟
    CONFIG_ATMEL_PIT is not set
    #ATMEL芯片
    CONFIG_SH_TIMER_CMT is not set
    CONFIG_SH_TIMER_MTU2 is not set
    CONFIG_SH_TIMER_TMU is not set
    CONFIG_EM_TIMER_STI is not set
    以上四条均为内核里的定时器
    CONFIG_MAILBOX is not set
    #与邮箱计时相关
    CONFIG_IOMMU_SUPPORT is not set
    #开启了IOMMU(CONFIG_IOMMU_SUPPORT)支持
    
    
     Remoteproc drivers
    
     CONFIG_STE_MODEM_RPROC is not set
    
    
     Rpmsg drivers
    
##SOC (System On Chip) specific Drivers的配置   
    
     SOC (System On Chip) specific Drivers
    
     CONFIG_SOC_TI is not set
     #系统级芯片
     CONFIG_PM_DEVFREQ is not set
     CONFIG_EXTCON is not set
     #事件管理器控制寄存器
     CONFIG_MEMORY is not set
     #内存设置
     CONFIG_IIO is not set
     #全称是 Industrial I/O subsystem
     CONFIG_NTB is not set
     CONFIG_VME_BUS is not set
     #VME接口电路
     CONFIG_PWM is not set
     #PWM是一种对模拟信号电平进行数字编码的方法
     CONFIG_IPACK_BUS is not set
     CONFIG_RESET_CONTROLLER is not set
     #重置信号
     CONFIG_FMC is not set
##PHY Subsystem的配置     
    
     PHY Subsystem
     PHY 
     #( 物理层控制芯片) ，以太网PHY对应OSI模型的物理层，物理层定义了数据传送与接收所需要的电与光信号、线路状态、时钟基准、数      #据编码和电路等，并向数据链路层设备提供标准接口

     CONFIG_GENERIC_PHY is not set
     #PHY的一般设置
     CONFIG_BCM_KONA_USB2_PHY is not set
     #PHY的模块控制
     CONFIG_POWERCAP is not set
     #PHY的电源控制，用于模式恢复，需要复位
     CONFIG_MCB is not set
     #PHY内存控制块信息
     CONFIG_THUNDERBOLT is not set
     #PYH对于意外处理的设置
    
    
     Android
    
     CONFIG_ANDROID is not set
     #与Android相关的设置都不要
    
    
     Firmware Drivers 固件驱动
    
     CONFIG_EDD is not set
     CONFIG_FIRMWARE_MEMMAP is not set
     CONFIG_DELL_RBU is not set
     CONFIG_DCDBAS is not set
     CONFIG_GOOGLE_FIRMWARE is not set

##File systems的配置    
    
     File systems
    
    CONFIG_DCACHE_WORD_ACCESS=y
    #高速缓存通道
    CONFIG_FS_POSIX_ACL is not set
    #文件中POSIX消息队列
    CONFIG_FILE_LOCKING is not set
    #锁定文件
    CONFIG_FSNOTIFY is not set
    #文件监控
    CONFIG_DNOTIFY is not set 
    #基于目录的文件变化的通知机制
    CONFIG_INOTIFY_USER is not set 
    #用户空间的Inotify支持。（notify 是一个 Linux特性，它监控文件系统操作，比如读取、写入和创建）
    CONFIG_FANOTIFY is not set
    CONFIG_QUOTA is not set
    CONFIG_QUOTACTL is not set
    CONFIG_AUTOFS4_FS is not set
    CONFIG_FUSE_FS is not set 
    #FUSE（Filesystem in Userspace），允许在用户空间实现一个文件系统，如果打算开发一个自己的文件系统或使用一个机遇FUSE的文件     #系统，可以打开，这里不设置。
    CONFIG_OVERLAY_FS is not set
    

<h1 id="2">实验中遇到的问题及解决办法</h1>
 [2.实验中遇到的问题及解决办法](#2)
###问题一：make menuconfig curses.h：No such file or directory
#####解决方案：安装ncurses，sudo apt-get install libncurses5-dev

###问题二：预安装的qemu由于版本的问题，命令麻烦
#####问题描述：预安装的qemu使用qemu-system-i386时有时会操作失败
#####解决方案：安装新的qemu，sudo apt-get install qemu

#引用：



[1]:https://www.kernel.org/
[2]:https://github.com/ir193/tiny_linux/blob/master/myconfig2
