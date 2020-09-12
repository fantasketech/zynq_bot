#!/bin/bash

. env.sh

git submodule init
git submodules update

cp u-boot_make.sh ../u-boot/
cp kernel_make.sh ../kernel/
cp dts_make.sh ../dts

[ "$1_" == "make_" ] && {
	cp ../prebuilt/* ../sandbox/
}

for dir in u-boot kernel ; do

	pushd ../$dir/
	cp zbconfig .config
	./make.sh
	popd

done

pushd ../dts/
./make.sh
popd

pushd ../fs/
./make_debian.sh # this one requires user interaction
popd


