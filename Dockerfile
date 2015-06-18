FROM ubuntu:14.04


RUN apt-get update \
&& apt-get install -y curl wget build-essential flex bison libboost-dev stx-btree-dev \
&& apt-get autoclean

ENV GPUTILSVER=1.4.0-1

RUN mkdir /gputils && cd /gputils && wget http://downloads.sourceforge.net/project/gputils/gputils/1.4.0/gputils-${GPUTILSVER}.tar.gz \ 
&& tar zxvf gputils-${GPUTILSVER}.tar.gz \
&& cd /gputils/gputils-${GPUTILSVER} && ./configure && make && make install

ENV SDCCVER=3.3.0

RUN mkdir /sdcc && cd /sdcc && wget http://downloads.sourceforge.net/project/sdcc/sdcc/${SDCCVER}/sdcc-src-${SDCCVER}.tar.bz2 \ 
&& bunzip2 sdcc-src-${SDCCVER}.tar.bz2 && tar xvf sdcc-src-${SDCCVER}.tar \
&& cd /sdcc/sdcc-${SDCCVER} && ./configure && make && make install

RUN cp -R /sdcc/sdcc-${SDCCVER}/device/non-free/include/* /usr/local/share/sdcc/include/ \
 && cp -R /sdcc/sdcc-${SDCCVER}/device/non-free/lib/build/* /usr/local/share/sdcc/lib/ \
 && rm -Rf /gputils /sdcc /tmp/* 

