#!/bin/bash -e
## resources:
## https://jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html
cd poky

export BUILDDIR=/mnt/build
source oe-init-build-env $BUILDDIR

cp -af ~/poky/meta-rpi/conf/local.conf.sample $BUILDDIR/conf/local.conf
cp -af ~/poky/meta-rpi/conf/bblayers.conf.sample $BUILDDIR/conf/bblayers.conf

## WARNING: Do not include meta-yocto-bsp in your bblayers.conf.
## The Yocto BSP requirements for the Raspberry Pi are in meta-raspberrypi
# TODO adjust bblayers


## TODO yocto layer, params, etc, setup for rpi3b, repo...
bitbake core-image minimal
