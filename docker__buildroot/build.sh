#!/bin/bash -e
export DEFCONFIG=lothars__raspberrypi3_defconfig
cd buildroot
make ${DEFCONFIG}
make -j8
