FROM ubuntu:19.04

WORKDIR /root

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y --purge && \
    apt-get install  gawk wget git-core diffstat unzip texinfo gcc-multilib \
                     build-essential chrpath socat libsdl1.2-dev xterm

#apt-get install -y  libncurses5-dev zlib1g-dev gawk wget git-core make gcc g++ build-essential bison flex binutils unzip python bzip2 libssl-dev locales && \
#    apt-get install -y  bc cpio rsync


RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## get sources
RUN git clone git://git.yoctoproject.org/poky poky

## copy build.sh
COPY build.sh /root/build.sh

CMD ["/bin/bash", "/root/build.sh"]
