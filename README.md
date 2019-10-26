# docker__buildroot__rpi-3b

Contains a Dockerfile for building an docker image and its container for the Raspberry pi 3b using buildroot, or yocto.

Implicitely will run ```git clone --branch lothar/raspberry3-devel https://github.com/Rubusch/buildroot.git``` inside the docker container.


## Build (buildroot)

```
$ cd ./docker__buildroot/
$ time docker build --no-cache --tag 19.04 -t rubuschl:rpi3b-buildroot .
$ time docker run -ti --rm -v $PWD/output:/mnt rubuschl:rpi3b-buildroot
```


## Debug (buildroot)

```
$ docker run -ti rubuschl:rpi3b-buildroot /bin/bash
```

## Build (yocto)

```
$ cd ./docker__yocto/
$ time docker build --no-cache --tag 19.04 -t rubuschl:rpi3b-yocto .
$ time docker run -ti --rm -v $PWD/output:/mnt rubuschl:rpi3b-yocto
```


## Debug (yocto)

```
$ docker run -ti rubuschl:rpi3b-yocto /bin/bash
```


