#<center>tiny_linux report</center>
* name:pxx
* id:P14226010

#实现tiny_linux
##第一次课前工作（2M）：
###１. 配置configure
            这部分配置比较麻烦，我刚开始的时候没有使用defconfig，而是直接用的里面的menuconfig，配置完成
		进入系统还是比较顺利，　在这里可以优化的地方有：
		1)．可加载模块处理：将程序中的所有可加载模块全部去掉，因为要实现最小所以这些不牵扯到重点的模
            块全都去掉，　如果是重要的模块，可以选择在外面以ram文件的形式加载进来，这样就可以缩小linux的内核大小
		2)．去除无用模块：有些模块对于内核来说可能比较重要，但是如果只是最基本的功能，那么它的作用反而
            不起作用了，比如ipv6之类的，这种可以去掉．
		3)．选择里面的优化选项：比如有专门优化大小的选项．
		4). 选择压缩算法：对比gzip,bzip2,xz,lzma,lzm压缩算法（查询谷歌），发现lzma算法的压缩效率最高，
            所以在这里选择该算法当成内核的压缩算法，为了达到最小的目的．
        以上这些优化测量全部用上，编译成64位的内核镜像，发现所占大小为2M多，本来觉得已经比较小了，结果课
        杨海宇同学的文件大小就只有1.7M，看来我还有很多没有优化到的地方．

###２. 出现的问题
            我耗时比较长的可能就在于配置网卡了，因为把所以东西搭建完毕，用busybox做shell发现网络不通，弄了好久
		找不着原因，开始以为是qemu的问题，(其实qemu也有问题，但是只是ping的问题，而不是网络的问题)，因为eth0找
		不着，　弄到最后发现，是我直接使用的menuconfig有问题，他里面没有将网络的driver选择完全，由于开始的时候
		我没有用defconfig，所以最后还是用它将其重新覆盖了，然后才开始重新配置
            第二个问题还有就是网络上还得配置route表，这个是在杨海宇的帮助下才弄明白，没配置这个根本从里面找不着
		外面的网络，只有添加后才可以进行

###３. 还可以继续优化的配置
            为了将内核缩到更小，其实可以将所有的driver弄到ram里面去，直到用的时候再进行手动加载，这样就可以将内核
		缩到更小．

###４. 感受
            配置选项实在太多了，有时候因为一个错误配置就会出错，然后得重新编译，每次编译时间还特别长．等的急死人.
		不过由于这次实验，确实对linux的模块熟悉了很多．


##第二次课前工作（687k=>703k）：
###１. 配置configure
		1>．这部分configure配置， 前面我自己删减最小能到950k，后来和杨海宇交流的时候他说他的修改configure可以达到
		  890k，当时很惊讶， 因为我把tcp/ip协议栈删了最小都大于890k，然后他把他的configure发了我一份， 我对比了下两
		  个config，发现他选择了embed system选项，于是我把我里面的那个选项勾上以后，发现立刻小了一两百k，果然嵌入式
		  系统就是小， 然后我在此基础上又删减了很多linux的选项， 最小可以到达742k依然能完成完整的功能，优化的地方有：
		1)．去除（我所知的）所有无用的模块（比如显卡啥之类的）, 从allnoconfig删减一些，再添加一些.
		2)．压缩算法选择xz编译系统时会更小（理论上应该是lzma最小）， 然后ram的压缩选择lzma（否则xz的解析部分依
		  然会占内核的大小）.
		
		2>．除了configure上的优化， 我将所有可移动的驱动全都移出kernel，这样内核文件会变得更小，显示的是编出来的大小为
		  687k，但是实际文件大小为703k，移动driver过程如下：
		1)．在configure选项中先把Enable loadable module support勾选上
		2)．将一些必要的以<>做选项的驱动模块，全部改成<M>, 变成可加载模块(比如串口驱动，键盘驱动，网卡驱动，脚本执行模块)
		3）.依然用make bzImage编译系统，完成后再用make modules编译模块， 执行完以后将所有的.ko文件移动到ramdisk/driver/下
		4）.在ramdisk/rcS文件中添加一些必要的加载项， 注意加载的顺序，因为驱动加载时候有依赖关系， 串口驱动必须放在网卡和
		  键盘驱动前面加载，否则会加载失败， 虽然说binfmt_script模块是专门负责解释执行#!格式的文件的，但是rcS似乎并不是安装那
		  种脚本格式来执行的， 所有不用管去掉这个模块后rcS文件能不能执行起来，从结果来看是可以的，最终内容如下：
```
#!/bin/sh

/sbin/insmod /drivers/binfmt_script.ko
/sbin/insmod /drivers/serio.ko
/sbin/insmod /drivers/serial_core.ko
/sbin/insmod /drivers/serport.ko
/sbin/insmod /drivers/e1000.ko
/sbin/insmod /drivers/8250.ko
/sbin/insmod /drivers/8250_pci.ko
/sbin/insmod /drivers/i8042.ko
/sbin/insmod /drivers/libps2.ko
/sbin/insmod /drivers/atkbd.ko


mount proc
mount -o remount,rw /
mount -a

clear
echo "Linux is Booting"


/sbin/ifconfig lo 127.0.0.1 up
/sbin/route add 127.0.0.1 lo &

ifconfig eth0 up
ip addr add 10.0.2.15/24 dev eth0
ip route add default via 10.0.2.2

```
###２. 出现的问题
            优化configure的时候比较耗时， 而且确定一个选项是否能用得看最终的执行结果。 另外在编译驱动加载的时候
		  加载不成功会导致控制台不接受任何输入， 将rcS文件中的clear注释掉，可以看的哪些模块加载不成功， 只有在加载
		  成功后， 后续的工作才可以继续下去.

###３. 还可以继续优化的配置
            对configure和driver的部分我想不到更多的优化方法了，下一步只能进到源码里面去．

###４. 感受
            配置挺费事， driver的部分找了一些零碎的参考（关于.ko的生成以及驱动的加载，试了试可以用）.
		  文件夹下面， 保存了很多个config文件，每步都是一个阶段．

		

##第三次课前工作(kernel mode linux)：
###１. 重新编译kernel (kernel mode linux)
		1>．根据http://web.yl.is.s.u-tokyo.ac.jp/~tosh/kml/中的patch直接对前面的linux直接打进行修改，命令为:patch -p1 -d XX <kml.diff
		  这样编译出来的kernel直接就是kernel mode linux, 按照url链接中的提示在trusted目录下面运行的程序直接就是内核态。
		  　测试方法：
		          1)．运行特权形式的程序，如带有关中断指令的程序，在其他目录下运行直接异常，但是在trusted目录下能够正常运行，
		  　说明编译成功。
		          ２)．利用time查看程序运行时间，发现在其他目录下既有内核态时间也有用户态时间，但是在trusted中却只有内核态时间，
		  　说明编译成功。

测试代码如下：
```
#include<stdio.h>
int main(int argc, char*argv[])
{
	__asm__ __volatile__("cli");
	int i;
	for (i = 0; i < 100000; i++);
	{
		printf("%d\n", i);
	}
	return 0;
}
```
		  
###２. 编译glibc
		1>．成功编译这部分耗时比较长，主要是前面出现了好多问题，gcc的版本，gawk的版本等等之类的，最后成功编译成功是因为找了个
		  ubuntu10.04的系统，因为它的glibc的就是2.11与目标很接近，所以直接用它：
		1)．对glibc打上patch之后，直接编译通过，
		2)．将其中的glibc.so.6链接到的so文件和ln-linux.so.2连接到的so文件拷贝出来，放到ramdisk中的lib目录下，
		3)．为了让需要依赖libc动态库的程序正常执行，需要将连接关系做好，有两种方法：
		  一是直接指定：按照http://web.yl.is.s.u-tokyo.ac.jp/~tosh/kml/中的方法，直接用/lib/ln-linux.so.2 --library-path /lib xx即可，
		  二是设置好环境变量，将LD_LIBRARY_PATH指定为/lib即可，然后将ln-linux.so.2和libc.so.6的链接文件都放到/lib下即可。
		  
###３. 测试性能
		1>．测试代码说明：编写了一个多进程的程序，起了200个子进程，然后循环打印，父进程等待所有子进程结束后打印总耗时。
		2>．测试程序：编译两个版本的程序，一个需要libc，一个不需要。
		3>．测试方法：分别在trusted目录外面和在trusted目录里面进程测试，发现耗时相差无几，而且大部分时间是在trusted外面的时间甚至。
		  比里面的耗时更少，与原来的结论相矛盾，测试时候，我将所有的so文件和程序同时放在trusted里面或者外面，连接的时候也是手动指定
		  出现这个结果还是比较差异的。
代码如下：
```
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<signal.h>
#include<sys/time.h>
#define childCount 201
int main()
{
	int i, j, k;
	int pid_array[childCount];
	int stat[childCount];
	struct timeval start, end;
	unsigned long timer;
	gettimeofday(&start, NULL);
	for (i = 0; i < childCount; i++)
	{
		pid_t pid = fork();
		k = 0;
		if (pid == 0)
		{	
			pid = getpid();
			for (j = 0; j < 1000000; j++)
			{
				k += 3;
				if (j % 5000 == 0)
					printf("pid[%d] count = %d, k = %d\n", pid, j, k);
			}
				
			return 0;
		}
		else if (pid > 0)
		{
			pid_array[i] = pid;
		}
	}
	for (i = 0; i < childCount; i++)
	{
		waitpid(pid_array[i], &stat[i], 0);
	}
	gettimeofday(&end, NULL);
	timer = 1000000 * (end.tv_sec - start.tv_sec) + (end.tv_usec  -start.tv_usec);
	printf("time used:%lf ms\n", timer / 1000.0);
	return 0;
}
```
测试输出如下：
#####  命令:
![image](https://raw.github.com/pxx199181/tiny_linux/master/result-pic/normal-cmd.png)
#####  结果:
![image](https://raw.github.com/pxx199181/tiny_linux/master/result-pic/normal-result.png)
#####  命令:
![image](https://raw.github.com/pxx199181/tiny_linux/master/result-pic/kernelmode-cmd.png)
#####  结果:
![image](https://raw.github.com/pxx199181/tiny_linux/master/result-pic/kernelmode-result.png)
	   	   
###２. 出现的问题
            1). glibc的编译必须的找个和2.11非常接近的系统，否则gcc和gawk存在很多问题，哪怕解决了可能还存在一些奇奇怪怪
		  的小问题，当时这个上面花了很长时间，最后找了ubuntu10.04才直接成功。
            2). 对于程序的动态库加载的问题，多查查资料就解决了
            3). 最后的矛盾结果，出乎意料，是不是有什么地方出了问题，但是从结果来看他确实是内核态，耗时太多难道是因为进
		  程的切换，想想内核态和用户态的切换与内核态和内核态之间的切换其实并没有太多的区别，我觉得所谓的减低切换的overhead
		  应该是针对那种从用户态到内核态转换量比较大的才能体现出来吧，否则原来那个作者所打的patch会增加其overhead也说不定

###３. 感受
            编译glibc花了快一天的时间，查了好多奇葩问题，但是很多人都遇到了，解决方法也有很多。对于程序加载动态库方面确
		 实理解更深刻了一些，但是对于最后的矛盾结果，我想了一些原因，但是感觉还是不充分，照常理确实切换的东西少了，我觉得
		 要弄的更清楚，得去深入了解那个patch的真正所做的事情了。

		

