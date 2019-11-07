FROM ubuntu:19.04

WORKDIR /root

RUN apt update && apt-get upgrade -y && apt-get autoremove -y --purge
RUN apt install -y  \
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

RUN apt install -y  \
    gawk \
    wget \
    git-core \
    diffstat \
    unzip \
    texinfo \
    gcc-multilib \
    build-essential \
    chrpath \
    socat \
    libsdl1.2-dev \
    xterm

RUN apt install -y  \
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

## get sources
RUN git clone git://git.yoctoproject.org/poky poky

## copy build.sh
COPY build.sh /root/build.sh

CMD ["/bin/bash", "/root/build.sh"]
