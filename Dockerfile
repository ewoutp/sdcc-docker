FROM ubuntu:14.04

RUN apt-get update \
&& apt-get install -y curl wget build-essential gputils sdcc \
&& apt-get autoclean

RUN mkdir /sdcc && cd /sdcc && wget http://downloads.sourceforge.net/project/sdcc/sdcc/3.3.0/sdcc-src-3.3.0.tar.bz2 \ 
&& bunzip2 sdcc-src-3.3.0.tar.bz2 && tar xvf sdcc-src-3.3.0.tar \
&& cp -R /sdcc/sdcc-3.3.0/device/non-free/* /usr/share/sdcc/ \
&& rm -Rf /sdcc /tmp/*

