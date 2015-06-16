# AOS project
## 裁剪Linux
### 裁剪内核
Linux内核版本4.0.4  
下载好源码之后，首先make defconfig进行默认的配置  
然后make menuconfig进行自定义的配置  
最主要的几个可以裁剪的地方：  
1. fs,一种文件系统就会占用几十k到几百k的大小  
2. drivers/gpu等不用的驱动  
3. net以及其中的ipv6部分  
4. 开启EXPERT选项，可以关闭一些之前关闭不了的选项  
主要的调整过程就是不断地观察编译的输出，哪个文件夹中编译的文件多就关闭那些对应的编译选项。可以参考[最小的Linux操作系统制作过程详解](http://wenku.baidu.com/view/19835bc489eb172ded63b7a8.html)  
但是有几个选项一定不能关，例如Kernel support for ELF binaries和Kernel support for scripts starting with #!  
最终配置可以参考config文件，生成的bzImage也在文件夹中  
kernel is 815k  
### 配置Busybox作为rootfs
Busybox版本为1.23.2
下载好源码之后按照教程进行编译并安装make install，然后在_install/etc/init.d目录下建立rcS文件并赋予执行权限，内容如下
```
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
/sbin/mdev -s
```
将整个_install文件夹做成一个img映像  
`find . |cpio -o --format=newc > /rootfs.img`
使用以下命令运行  
`qemu-system-i386 -kernel bzImage -initrd rootfs.img -append "root=/dev/ram rdinit=sbin/init" -m 20`
最小运行内存21m，20m不能运行  
### 遇到的问题  
主要是网络不通的问题，这里要感谢杨海宇同学的帮助，向/etc/init.d/rcS文件添加以下几条命令即可使用wget命令进行通信  
```
ifconfig eth0 up
ip addr add 10.0.2.15/24 dev eth0
ip route add default via 10.0.2.2
```

## Kernel Mode Linux
下载[KML patch for 4.0](http://web.yl.is.s.u-tokyo.ac.jp/~tosh/kml/kml/for4.x/kml_4.0_001.diff.gz)  
将补丁解压到Linux 4.0.4文件夹内,使用patch -p1 < kml_4.0_001.diff打补丁，只有Makefile中的版本会不一致，但不影响编译内核。重新make menuconfig，将Kernel Mode Linux勾上  
编写一个简单的测试程序
```
#include <stdio.h>

int main(int argc, char **argv)
{
	int a=123;
	double b=1.23;
	char c='c';
	printf("hell%d\n",100);
	return 0;
}
```
使用gcc -static参数编译成静态程序a.out，分别放到rootfs的根文件夹以及/trusted文件夹下
运行根目录下的程序a.out  
通过gdb使得程序在main函数时中断
![user](user.png)  
通过CS和SS的DPL=3可以看出是处于用户态  
而/trusted目录下的a.out文件则会以内核态执行  
![kernel](kernel.png)  
可以看到CS和SS的DPL=0，是处于内核态  
