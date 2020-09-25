
[ "$procs" == "" ] && {
	procs=4
}

[ "$make_boot" == "" ] && {
	make_boot=/home/nf/git/zynq_bot/scripts/make_boot.sh
}

[ "$sandbox" == "" ] && {
	sandbox=/home/nf/git/zynq_bot/sandbox
}

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
