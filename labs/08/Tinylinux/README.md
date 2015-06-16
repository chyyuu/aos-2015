# Tinylinx
Homework for AOS course , aims to build a tiny linux kernel with linux-4.04 and busybox 1.23.2. The kernel should include basic network functions.

# How to do ：

## Qemu:

     sudo apt-get install qemu

## Compile the Linux Kernel
1.  Download the linux kernel source code (linux-4.04) from www.kernel.org

2.  Download BusyBox 1.23.2

3. Build the Linux Kernel"

     3.1)Install ncurses to use “make menuconfig”;

     3.2)make menuconfig and cut the kernel function and modules as much as possible，please refer to my config file for more details .

     3.3) make , you can use “make -j4” to make it faster.

     3.4) If everything goes well , you will find the image file “bzImage” in :

     ./arch/x86/boot/bzImage

4. Prepare a root file system for the kernel .

      4.1) Prepare a 4M block file , here we can still make it smaller, it’s all up to you . 

       dd if=/dev/zero of=busyboxinitrd4M.img bs=4096 count=1024

       mkfs.ext3 busyboxinitrd4M.img
     
     4.2) Install busybox into root file system
     
     mkdir rootfs
     
     sudo mount -o loop busyboxinitrd4M.img rootfs
     
     Goto the directory of busybox , and install busybox in rootfs .
     
     Here we must build busybox as a static binary. To achieve this , we should choose the corresponding build option when we do “make menuconfig”.  
     
     sudo make CONFIG_PREFIX=../rootfs/ install  
     
     4.3) Some init for kernel use 
     
     A init shell is needed when kernel starts up . Fortunately , busybox has prepared a init program for us. Here we create a symbolic link for busybox .
     
     ln -s bin/busybox init
     
     Some directories also need to be created:
     
     mkdir dev etc proc sys
     
     4.4) During starting process , console device and linux root device are also used, we create them under /dev:
     
     sudo mknod rootfs/dev/console c 5 1
     
     sudo mknod rootfs/dev/ram b 1 0
    
    For network use：
    
     sudo mknod rootfs/dev/tap0 c 36 16(not sure if this is must)
    
     4.5）inittab and init.d/rcS
    
     During the initialization of file system , /etc/inittab is used as a configuration file. My inittab file is :
    
     ::sysinit:/etc/init.d/rcS

     ::askfirst:-/bin/sh

     ::restart:/sbin/init

     ::ctrlaltdel:/sbin/reboot

     ::shutdown:/bin/umount -a -r

     ::shutdown:/sbin/swapoff -

     /etc/init.d/rcS :
     
     #!/bin/sh
     
     export PATH=/sbin:/bin

     /bin/mount -n -t proc  /proc  /proc
     
     /bin/mount -n -t sysfs none /sys

     /sbin/ifconfig lo 127.0.0.1 up
     
     /sbin/route add 127.0.0.1 lo &

     /sbin/ifconfig eth0 10.0.2.3 netmask 255.255.255.0 up
     
     /sbin/ip route add default via 10.0.2.2

     /bin/mount -n -o  remount,rw  /
     
     /bin/mount -av

     echo "Welcome to my tiny Linux ... "
     
     After edit the rcS file , we make it executable:

     sudo chmod a+x rcS
	
     4.6) Configure the network 
     
          In this step , you may come across this problem :
     
          "SIOCSIFADDR: No such device"
         
          The result of running “ifconfig -a” shows that you have -lo but no “eth0”。 
     
          But it seems that all the needed driver and device has been configured right.
     
          This is perhaps that your NIC has not been loaded , so you have to do this manually.
         
         So you can add  
         
          "-netdev user,id=network0 -device e1000,netdev=network0 & "
         
         when you use qemu .(refer to http://en.wikibooks.org/wiki/QEMU/Networking )
     
     4.7)      
          
          sudo umount rootfs

5. Run
     
     sudo qemu-system-x86_64 -kernel linux-4.0.4/arch/x86_64/boot/bzImage -initrd busyboxinitrd4M.img -append "root=/dev/ram init=/init" -netdev user,id=network0 -device e1000,netdev=network0 &

6. Test the network
     
     I build a http server and use "wget" to download a file , and it works!


=======================================================
#Kernel Mode Linux

参考：http://www.yl.is.s.u-tokyo.ac.jp/~tosh/kml/

目的：在内核态执行用户程序。在Kernel Mode Linux中，用户程序能够作为用户进程执行，且拥有kernel mode的权限。

具体是下载了网页提供的Patch，打上patch，并使用Tinylinux的config文件，编译，成功。
在rootfs中创建trusted文件夹，并将测试程序放入trusted路径中，进行测试。

测试程序1：
<pre><code>
	int main(int argc, char* argv[])
	{
	        __asm__ __volatile__("cli");
	        for(;;);
	        return 0;
	}
</code></pre>

通过查看程序是否能够关中断来判断是否是内核权限。

测试程序2：
<pre><code>
	#include <stdio.h>
	#include <stdint.h>
	int main()
	{
        	uint32_t cs;
        	asm volatile("mov %%cs, %0" : "=r"(cs));
        	printf("Privilege level: %x\n",cs & 0x3);
        	return 0;
	}
</code></pre>

打印CS寄存器的值，查看当前特权级来判断是否是内核态。

问题：

1.直接使用4M大小的rootfs，系统启动正常。但由于测试程序需要被静态编译，编译后可执行文件约850KB，文件系统空间不足。

2.考虑使用8M大小的rootfs，建立好之后，启动，mount fs失败，发现是ramdisk最大为4M，超限，无法启动。使用lzma对roofs进行压缩，压缩后大小为1.1M。fs mount成功。

3.提示Not syncing: Request init /init failed错误，请求init程序失败，因为在启动选项中已经对root和init进行了指定，不知道为何找不到 = =

