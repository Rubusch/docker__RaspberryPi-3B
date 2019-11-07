FROM ubuntu:19.04

WORKDIR /root

## set up apt fully functional
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y --purge
RUN apt-get install -y  \
        apt-utils

RUN apt-get install -y  \
        build-essential \
        libncurses5-dev \
        zlib1g-dev \
        gawk \
        wget \
        git-core \
        make \
        gcc \
        g++ \
        bison \
        flex \
        binutils \
        unzip \
        python \
        bzip2 \
        libssl-dev \
        locales

RUN apt-get install -y  \
        bc \
        cpio \
        rsync

## (opt) tools for debugging and working, e.g. X11-apps for testing the xserver via xclock
RUN apt-get install -y   \
            vim \
            screen \
            minicom \
            x11-apps \
            sudo

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## get (my) sources
RUN git clone -j4 --depth=1 --branch lothar/raspberry3-devel https://github.com/Rubusch/buildroot.git buildroot
## alternatively get official buildrooot
#RUN git clone -j4 --depth=1 https://github.com/buildroot/buildroot.git buildroot


## copy build.sh
COPY build.sh /root/build.sh

CMD ["/bin/bash", "/root/build.sh"]
