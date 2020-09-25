
[ "$sandbox" == "" ] && {
    sandbox=/home/nf/git/zynq_bot/sandbox
}

make clean
make && cp -v snickerdoodle-prime.dtb $sandbox/devicetree.dtb
