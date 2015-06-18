FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget build-essential gputils sdcc

