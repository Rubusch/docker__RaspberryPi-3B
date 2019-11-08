#!/bin/bash -e
cd poky
git checkout -b warrior origin/warrior
source oe-init-build-env

## TODO yocto layer, params, etc, setup for rpi3b, repo...
bitbake core-image minimal
