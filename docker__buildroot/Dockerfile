FROM ubuntu:19.04

WORKDIR /root

RUN apt update && apt-get upgrade -y && apt-get autoremove -y --purge && \
    apt install -y  \
        libncurses5-dev \
        zlib1g-dev \
        gawk \
        wget \
        git-core \
        make \
        gcc \
        g++ \
        build-essential \
        bison \
        flex \
        binutils \
        unzip \
        python \
        bzip2 \
        libssl-dev \
        locales

    apt install -y  \
        bc \
        cpio \
        rsync

## (opt) for debugging / development inside
    apt install -y  \
        vim


RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## get sources
RUN git clone -j4 --depth=1 --branch lothar/raspberry3-devel https://github.com/Rubusch/buildroot.git buildroot

## copy build.sh
COPY build.sh /root/build.sh

CMD ["/bin/bash", "/root/build.sh"]
