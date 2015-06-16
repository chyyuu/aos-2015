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
		1> 这部分configure配置， 前面我自己删减最小能到950k，后来和杨海宇交流的时候他说他的修改configure可以达到
            890k，当时很惊讶， 因为我把tcp/ip协议栈删了最小都大于890k，然后他把他的configure发了我一份， 我对比了下两
            个config，发现他选择了embed system选项，于是我把我里面的那个选项勾上以后，发现立刻小了一两百k，果然嵌入式
            系统就是小， 然后我在此基础上又删减了很多linux的选项， 最小可以到达742k依然能完成完整的功能，优化的地方有：
		1)．去除（我所知的）所有无用的模块（比如显卡啥之类的）, 从allnoconfig删减一些，再添加一些.
		2)．压缩算法选择xz编译系统时会更小（理论上应该是lzma最小）， 然后ram的压缩选择lzma（否则xz的解析部分依
		然会占内核的大小）.
		
		2> 除了configure上的优化， 我将所有可移动的驱动全都移出kernel，这样内核文件会变得更小，显示的是编出来的大小为
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
		配置选项实在太多了，配置挺费事， driver的部分找了一些零碎的参考（关于.ko的生成以及驱动的加载，试了试可以用）.
            文件夹下面， 保存了很多歌config文件，每步都是一个阶段．

		
