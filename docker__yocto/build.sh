#!/bin/bash -e
##
## started with:
## $ docker run -ti -v $PWD/mnt:$(pwd)/output afb489d932bc
##
export DEFCONFIG=raspberrypi3__lothar_defconfig

## avoid checks for being "root"
export FORCE_UNSAFE_CONFIGURE=1

cd poky
#git checkout -b fido origin/fido
source oe-init-build-env

## obtain build artifacts
# TODO
#cp -arvf /root/poky/output/* /mnt/
