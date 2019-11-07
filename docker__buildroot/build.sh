#!/bin/bash -e
##
## started with:
## $ docker run -ti -v $PWD/mnt:$(pwd)/output afb489d932bc
##

## avoid checks for being "root"
export FORCE_UNSAFE_CONFIGURE=1
export DEFCONFIG=lothars__raspberrypi3_defconfig

cd buildroot
make ${DEFCONFIG}
make -j8

## obtain build artifacts
cp -arvf /root/buildroot/output/* /mnt/
