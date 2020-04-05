#!/bin/bash -e
export DEFCONFIG=lothars__raspberrypi3_defconfig
cd /home/$(whoami)/buildroot
make ${DEFCONFIG}
make -j8
