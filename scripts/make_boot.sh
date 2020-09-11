#!/bin/bash

staging=../sandbox/
bootgen=/tools/Xilinx/Vitis/2020.1/bin/bootgen
arch=zynq
bif=$staging/output.bif
output=$staging/boot.bin

rm -rf $output

$bootgen -w on -arch $arch -image $bif -o $output
