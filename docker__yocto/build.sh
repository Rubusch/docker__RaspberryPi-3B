#!/bin/bash -e
##
## started with:
## $ docker run -ti -v $PWD/mnt:$(pwd)/output afb489d932bc
##

## avoid checks for being "root"
export FORCE_UNSAFE_CONFIGURE=1

cd poky
git checkout -b warrior origin/warrior
source oe-init-build-env

## TODO yocto layer, params, etc, setup for rpi3b, repo...
bitbake core-image minimal

## obtain build artifacts
# TODO
#cp -arvf /root/poky/output/* /mnt/
