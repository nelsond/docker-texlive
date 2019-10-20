FROM ubuntu:18.04

MAINTAINER Nelson Darkwah Oppong "n@darkwahoppong.com"

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"

RUN apt-get update &&\
  apt-get -y install wget unzip perl-modules

RUN wget --no-verbose \
  "http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz" &&\
  tar -xzf install-tl-unx.tar.gz

RUN cd $(find . -type d -name "install-tl-*" | head -n 1) &&\
  yes I | perl install-tl && \
  tlmgr update --self --all

RUN rm install-tl && \
  rm -rf install-tl-*

RUN pdflatex --version
