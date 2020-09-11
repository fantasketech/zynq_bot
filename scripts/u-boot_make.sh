#!/bin/bash

procs=4

make_boot=/home/nf/git/zynq_bot/scripts/make_boot.sh
sandbox=/home/nf/git/zynq_bot/sandbox

#export ARCH=arm
#export CROSS_COMPILE=arm-linux-gnueabihf-
#export PATH=$PATH:/tools/Xilinx/Vitis/2020.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:/home/nf/git/git_usb/snickerdoodle-u-boot/tools

[ "$1" = "default" ] && {
	make distclean
	make snickerdoodle_prime_config
}
make -j$procs && {
	cp -v u-boot $sandbox/u-boot.elf
	[ -f $sandbox/fsbl.elf ] && {
		pushd $sandbox/../scripts
		$make_boot
		popd
	}
}
