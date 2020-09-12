
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export PATH=$PATH:/tools/Xilinx/Vitis/2020.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:/home/nf/git/u-boot-xlnx/tools

sandbox=$PWD/../sandbox/

kern_path=$PWD/../kernel/

procs=4

make_boot=$PWD/make_boot.sh


