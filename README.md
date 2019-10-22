# docker__buildroot__rpi-3b

TODO: under construction

## Build

```
$ cd ./docker/
$ time docker build --no-cache --tag 19.04 -t rubuschl:rpi3b .
$ time docker run -ti --rm -v $PWD/output:/mnt rubuschl:rpi3b
```


## Debug

```
$ docker run -ti rubuschl:rpi3b /bin/bash
```
