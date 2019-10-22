#!/bin/bash -e
##
## started with:
## $ docker run -ti -v $PWD/mnt:$(pwd)/output afb489d932bc
##
DEFCONFIG=raspberrypi3__lothar_defconfig

cd buildroot
make ${DEFCONFIG}
make -j8

## obtain build artifacts
# TODO      
#cp -arvf /root/buildroot/* /mnt/
