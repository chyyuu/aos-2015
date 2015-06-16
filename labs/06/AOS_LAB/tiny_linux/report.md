# tiny_linux

## [练习0]	实验步骤:

参考老师给到实验步骤参考：

* http://blog.csdn.net/ancjf/article/details/42172847

但是按照这个实验做下来内核能够起来，但是发现不能完成网络功能，所以放弃该方案，参考ir193的继续进行实验。
* https://github.com/ir193/tiny_linux/blob/master/NOTE.md
同时也参考了：
* http://mgalgs.github.io/2015/05/16/how-to-build-a-custom-linux-kernel-for-qemu-2015-edition.html

下面到步骤是ir193的步骤，现在将步骤描述下来：

```
1. 编译内核
    cd $TOP
    mkdir obj
    mkdir obj/linux_defconfig
    LINUX_SRC=$TOP/linux-4.0.4
    cd $LINUX_SRC
    make O=../obj/linux_defconfig x86_64_defconfig
    cd $TOP/obj/linux_defconfig
    make
    cp $TOP/obj/linux_defconfig/arch/x86/boot/bzImage $TOP/obj
    KERNEL=$TOP/obj/bzImage

2. 安装busybox
    cd $TOP
    mkdir obj/busybox
    cd $TOP/busybox-1.23.2
    make O=../obj/busybox/ defconfig
    make O=../obj/busybox/ menuconfig

    choose:

    Busybox Setting:
        Build Option
            Build Busybox as a static binary

    cd $TOP/obj/busybox
    make
    make install
    cd $TOP/
    mkdir ramdisk
    cd ramdisk
    cp -av $TOP/obj/busybox/_install/* .
    echo -e '#!/bin/sh \n /bin/sh' > init
    chmod +x init
    cd $TOP/ramdisk
    find . -print0 | cpio --null -ov --format=newc | gzip -9 > $TOP/obj/initramfs.cpio.gz
    RAMDISK=$TOP/obj/initramfs.cpio.gz

3. init and mount

    cd $TOP/ramdisk
    rm init
    ln -s bin/busybox init
    cd $TOP/ramdisk
    mkdir -pv {bin,sbin,etc,proc,sys,usr/{bin,sbin},dev}
    cd $TOP/ramdisk
    cd etc
    vim inittab

The content of inittab can be:

    ::sysinit:/etc/init.d/rcS

    ::askfirst:-/bin/sh

    ::restart:/sbin/init

    ::ctrlaltdel:/sbin/reboot

    ::shutdown:/bin/umount -a -r

    ::shutdown:/sbin/swapoff -a


And rcS:

    mkdir init.d
    cd init.d
    vim rcS

rcS will called after system init, we mount filesystem and initialize network here

    #!/bin/sh

    mount proc
    mount -o remount,rw /
    mount -a

    clear                               
    echo "Booting Tiny Linux"

Don't forget attribute:
    
    chmod +x rcS

See the `mount -a`, it will check /etc/fstab. We create it:

    cd $TOP/ramdisk/etc
    vim fstab

The content:
    
    # /etc/fstab
    proc            /proc        proc    defaults          0       0
    sysfs           /sys         sysfs   defaults          0       0
    devtmpfs        /dev         devtmpfs  defaults          0       0

    cd $TOP/ramdisk
    find . -print0 | cpio --null -ov --format=newc | gzip -9 > $TOP/obj/initramfs.cpio.gz
    qemu-system-x86_64 -kernel $KERNEL -initrd $RAMDISK

4. 配置网络

Keep editing /etc/init.d/rcS, add 

    /sbin/ifconfig lo 127.0.0.1 up
    /sbin/route add 127.0.0.1 lo &


    ifconfig eth0 up
    ip addr add 10.0.2.15/24 dev eth0
    ip route add default via 10.0.2.2

That's all.

Check our /etc/init.d/rcS again, it should contains:

    #!/bin/sh

    mount proc
    mount -o remount,rw /
    mount -a
    
    insmod /8139cp.ko

    clear                               
    echo "Booting Tiny Linux"

    /sbin/ifconfig lo 127.0.0.1 up
    /sbin/route add 127.0.0.1 lo &

    ifconfig eth0 up
    ip addr add 10.0.2.15/24 dev eth0
    ip route add default via 10.0.2.2

You can test it in your tiny system:

    wget http://[you HOST os ip]:port/file

```

## [练习1]	问题集锦：

1.busybox编译出错
     错误如下：
```
     	inetd.c:(.text.unregister_rpc+0x17): undefined reference to `pmap_unset'
	networking/lib.a(inetd.o): In function `register_rpc':
	inetd.c:(.text.register_rpc+0x4e): undefined reference to `pmap_unset'
	inetd.c:(.text.register_rpc+0x75): undefined reference to `pmap_set'
	networking/lib.a(inetd.o): In function `prepare_socket_fd':
	inetd.c:(.text.prepare_socket_fd+0x8a): undefined reference to `bindresvport'

```
     解决办法：
	重新配置 $ make menuconfig
 	Linux System Utilities  --->  [ ]   Support mounting NFS file systems 网络文件系统
 	Networking Utilities  ---> [ ] inetd (Internet 超级服务器 )
	版本较高，默认支持功能较多，去掉编译不过的功能，如上。

     参考：
* http://blog.csdn.net/speedoniho/article/details/9089449



2.安装完环境之后，使用make menuconfig，发现不能报错：

   错误如下：

```
*** Unable to find the ncurses libraries or the
*** required header files.
*** ‘make menuconfig’ requires the ncurses libraries.
***
*** Install ncurses (ncurses-devel) and try again.

```
   
    解决办法：
    
    安装ncurses-devel包即可。



3.eth0启动不了
     裸机8139cp启动不起来，  找不到驱动。。然后insmod /8139cp.ko 手动将8139cp加载进来，但是注意在linux kernel的menuconfig中Enable loadable module support由于要加载8139网卡驱动。

     打开
```
         Symbol: 8139CP [=m]                                                     │  
  │ Type  : tristate                                                        │  
  │ Prompt: RealTek RTL-8139 C+ PCI Fast Ethernet Adapter support           │  
  │   Location:                                                             │  
  │     -> Device Drivers                                                   │  
  │       -> Network device support (NETDEVICES [=y])                       │  
  │         -> Ethernet driver support (ETHERNET [=y])                      │  
  │ (1)       -> Realtek devices (NET_VENDOR_REALTEK [=y])  

```
     并在rcS文件中加载8139cp.ko，rcS文件内容如下：

```
    #!/bin/sh

    mount proc
    mount -o remount,rw /
    mount -a
    
    insmod /8139cp.ko

    clear                               
    echo "Booting Tiny Linux"

    /sbin/ifconfig lo 127.0.0.1 up
    /sbin/route add 127.0.0.1 lo &

    ifconfig eth0 up
    ip addr add 10.0.2.15/24 dev eth0
    ip route add default via 10.0.2.2

```

## [练习2]	内核裁剪：

1. 修改configure配置

    configure配置项目众多，最开始到时候对于每个配置到具体功能不太清楚，不知道应该裁剪哪个配置之后kernel还能跑起来，只能一个一个试，不过耗时太长，而且容易出错。在过程中参考了：

* http://blog.chinaunix.net/uid-20531959-id-1931955.html

    但是这些裁剪之后还是不能够将内核裁剪到足够小，之后课上讨论之后，发现大家的裁剪思路，也是一个一个试。

    还有一个思路就是使用make allnoconfig就行一个一个添加，但是这个工作量也不小，耗时也很大。


## [备注]：

    编译的是64位内核。

    config  时大小为：      6M
    config2 时大小为：      984.6k
