#!/bin/bash -e
## resources:
## https://jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html
export BUILDDIR=~/poky/build
chown $(whoami):$(whoami) -R $BUILDDIR

cd poky
source oe-init-build-env $BUILDDIR

cp -af ~/poky/meta-rpi/conf/local.conf.sample $BUILDDIR/conf/local.conf
cp -af ~/poky/meta-rpi/conf/bblayers.conf.sample $BUILDDIR/conf/bblayers.conf

## WARNING: Do not include meta-yocto-bsp in your bblayers.conf.
## The Yocto BSP requirements for the Raspberry Pi are in meta-raspberrypi

## adjust bblayers.conf
sed -i 's/poky-warrior/poky/g' $BUILDDIR/conf/bblayers.conf
sed -i 's/\/rpi\//\/poky\//g' $BUILDDIR/conf/bblayers.conf

## adjust local.conf
## raspberrypi (BCM2835)
## raspberrypi0 (BCM2835)
## raspberrypi0-wifi (BCM2835)
## raspberrypi2 (BCM2836 or BCM2837 v1.2+)
## raspberrypi3 (BCM2837)
## raspberrypi-cm (BCM2835)
## raspberrypi-cm3 (BCM2837)
sed -i '/^MACHINE = "/s/.*/MACHINE = "raspberrypi3"/g' $BUILDDIR/conf/local.conf


## source again, before start building
source oe-init-build-env $BUILDDIR

# TODO build

bitbake console-image
