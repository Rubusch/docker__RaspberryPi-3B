#!/bin/bash -e
export DEFCONFIG=raspberrypi3_defconfig
export USER="$(whoami)"
export MY_HOME="/home/${USER}"
export BUILDDIR="${MY_HOME}/buildroot"

sudo chown ${USER}:${USER} -R ${MY_HOME}/buildroot/dl
sudo chown ${USER}:${USER} -R ${MY_HOME}/buildroot/output

cd ${BUILDDIR}

make defconfig ${DEFCONFIG}
make -j8

echo "READY."
echo
