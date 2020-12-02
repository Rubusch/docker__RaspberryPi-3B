#!/bin/bash -e
export DEFCONFIG=raspberrypi3_defconfig
export MY_HOME=/home/$(whoami)

sudo chown $(whoami):$(whoami) -R ${MY_HOME}/buildroot/dl
sudo chown $(whoami):$(whoami) -R ${MY_HOME}/buildroot/output

cd ${MY_HOME}/buildroot
make defconfig ${DEFCONFIG}
make -j8
