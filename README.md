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

$ time docker run -ti --user=$USER:$USER --workdir=/home/$USER -v $PWD/output:/home/$USER/output rubuschl/rpi3b-buildroot:20191104161353
```

### Debug

```
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-buildroot 20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ docker run -ti --user=$USER:$USER --workdir=/home/$USER -v $PWD/output:/home/$USER/output rubuschl/rpi3b-buildroot:20191104161353 /bin/bash
```



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

$ time docker run -ti -v $PWD/output:/home/$USER/poky/build --user=$USER:$USER --workdir=/home/$USER rubuschl/rpi3b-yocto:20191104161353
```


### Debug

```
$ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi3b-yocto     20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                   xenial              5f2bf26e3524        4 days ago          123MB

$ docker run -ti --user=$USER:$USER --workdir=/home/$USER rubuschl/rpi3b-yocto:20191104161353 /bin/bash
```
