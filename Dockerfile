FROM ubuntu:18.04

MAINTAINER Nelson Darkwah Oppong "n@darkwahoppong.com"

ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux:${PATH}"

RUN apt-get update &&\
  apt-get -y install wget unzip perl-modules

RUN wget --no-verbose --show-progress --mirror -np -nH --cut-dirs 6 \
  "ftp://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2017/tlnet-final"

RUN cd tlnet-final &&\
  yes I | perl install-tl

RUN rm -rf tlnet-final

RUN pdflatex --version
