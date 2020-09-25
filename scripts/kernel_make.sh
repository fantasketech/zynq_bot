#!/bin/bash

procs=32

[ -d /media/sf_vm_shared ] && {
	procs=4
}

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export PATH=$PATH:/tools/Xilinx/Vitis/2020.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:/home/nf/git/git_usb/snickerdoodle-u-boot/tools

[ "$1" = "dtbs" ] && {
	make dtbs
	exit 0
}

[ "$1" = "menuconfig" ] && {
	make menuconfig
	exit 0
}

[ "$1" = "default" ] && {
	make snickerdoodle_defconfig
}

#make -j$procs LOADADDR=0x8000 uImage
make LOADADDR=0x8000 uImage

