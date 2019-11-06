# docker__buildroot__rpi-3b

Contains a Dockerfile for building an docker image and its container for the Raspberry pi 3b using buildroot, or yocto.

Implicitely will run ```git clone --branch lothar/raspberry3-devel https://github.com/Rubusch/buildroot.git``` inside the docker container.


## Build (buildroot)

```
$ cd ./docker__buildroot/
$ time docker build --no-cache -t rubuschl/rpi3b-buildroot:$(date +%Y%m%d%H%M%S) .
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-buildroot 20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ time docker run -ti --rm -v $PWD/output:/mnt rubuschl/rpi3b-buildroot:20191104161353
```


## Debug (buildroot)

```
$ docker run -ti rubuschl/rpi3b-buildroot:20191104161353 /bin/bash
```

## Build (yocto)

```
$ cd ./docker__yocto/
$ time docker build --no-cache -t rubuschl/rpi3b_yocto:$(date +%Y%m%d%H%M%S) .
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-yocto     20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB
$ time docker run -ti --rm -v $PWD/output:/mnt rubuschl/rpi3b_yocto:20191104161353
```


## Debug (yocto)

```
$ docker run -ti rubuschl/rpi3b_yocto:20191104161353 /bin/bash
```


