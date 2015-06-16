#rm -rf ./obj/linux_defconfig
#mkdir ./obj/linux_defconfig
cd linux-4.0.4
make O=../obj/linux_defconfig menuconfig
cd ../obj/linux_defconfig
make
cd ../../
rm ./out/bzImage
cp ./obj/linux_defconfig/arch/x86/boot/bzImage ./out