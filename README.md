# Build Container for my Raspberry Pi 3b

Contains a Dockerfile for building an docker image and its container for the Raspberry pi 3b using buildroot, or yocto.

Implicitely will run ```git clone --branch lothar/raspberry3-devel https://github.com/Rubusch/buildroot.git``` inside the docker container.



## Resources

Yocto: some information about the used yocto setup
https://jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html



## Buildroot

### Build


```
$ cd ./docker__buildroot/
$ time docker build --build-arg USER=$USER -t rubuschl/rpi3b-buildroot:$(date +%Y%m%d%H%M%S) .
```

Use ```--no-cache``` when re-implementing the docker image.


### Usage

```
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-buildroot 20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ time docker run --rm -ti --user=$USER:$USER --workdir=/home/$USER -v $PWD/dl:/home/$USER/buildroot/dl -v $PWD/output:/home/$USER/buildroot/output rubuschl/rpi3b-buildroot:20191104161353
```

### Debug

Use the above command and append `` /bin/bash``.


## Yocto

Login user: 'root', password: 'root'


### Build

```
$ cd ./docker__yocto/
$ time docker build --build-arg USER=$USER -t rubuschl/rpi3b-yocto:$(date +%Y%m%d%H%M%S) .
```


### Usage

```
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-yocto     20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ time docker run --rm -ti -v $PWD/output:/home/$USER/poky/build --user=$USER:$USER --workdir=/home/$USER rubuschl/rpi3b-yocto:20191104161353
```


### SD Card

Plug the card into the card reader. The following method uses the yocto scripts. It is also possible to prepare the card with fdisk, format it manually and copy the binaries via dd tool.

```
$ lsblk
   --> sd card is on bus 'sdc'

$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-yocto     20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ time docker run --rm -ti --privileged -v /dev:/dev -v $PWD/output:/home/$USER/poky/build --user=$USER:$USER --workdir=/home/$USER rubuschl/rpi3b-yocto:20191104161353 /bin/bash

docker$ cd ~/poky/meta-rpi/scripts
docker$ sudo su
docker# export MACHINE=raspberry3
docker# export OETMP=/home/user/poky/build/tmp
docker# ./mk2parts.sh sdc
docker# mkdir /media/card
docker# ./copy_boot.sh sdc
docker# ./copy_rootfs.sh sdc console
```

Note: image type here was 'console', alternatively use something like ``./copy_rootfs.sh sdb qt5 rpi3``.

