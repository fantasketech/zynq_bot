[ "$sandbox" == "" ] && {
	sandbox=/home/nf/git/zynq_bot/sandbox
}

[ "$procs" == "" ] && {
	procs=4
}

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
