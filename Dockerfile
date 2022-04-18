FROM ubuntu:18.04

MAINTAINER Nelson Darkwah Oppong "n@darkwahoppong.com"

RUN apt-get update &&\
  apt-get -y install wget unzip perl-modules

ENV PATH="/usr/local/texlive/2021/bin/x86_64-linux:${PATH}"

RUN wget --no-verbose --progress=dot --mirror -np -nH --cut-dirs 6 \
  "ftp://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2021/tlnet-final" &&\
  cd tlnet-final &&\
  yes I | perl install-tl &&\
  cd .. &&\
  rm -rf tlnet-final

RUN pdflatex --version
