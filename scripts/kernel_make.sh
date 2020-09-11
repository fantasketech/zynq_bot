#!/bin/bash

#examples of env needed
#export ARCH=arm
#export CROSS_COMPILE=arm-linux-gnueabihf-
#export PATH=$PATH:/tools/Xilinx/Vitis/2020.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:/home/nf/git/u-boot-xlnx/tools

sandbox=/home/nf/git/zynq_bot/sandbox
procs=4

[ "$1" = "dtbs" ] && {
	make dtbs
	exit 0
}

[ "$1" = "menuconfig" ] && {
	make ARCH=arm menuconfig
	exit 0
}

[ "$1" = "default" ] && {
	make snickerdoodle_defconfig
}

make -j$procs LOADADDR=0x8000 uImage && {
	cp -v arch/arm/boot/uImage $sandbox/
	make modules
}
