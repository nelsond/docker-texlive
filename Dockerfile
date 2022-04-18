FROM ubuntu:18.04

MAINTAINER Nelson Darkwah Oppong "n@darkwahoppong.com"

RUN apt-get update &&\
  apt-get -y install wget unzip perl-modules

ENV PATH="/usr/local/texlive/2022/bin/x86_64-linux:${PATH}"

RUN wget --no-verbose \
  "http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz" &&\
  tar -xzf install-tl-unx.tar.gz &&\
  cd $(find . -type d -name "install-tl-*" | head -n 1) &&\
  yes I | perl install-tl && \
  tlmgr update --self --all &&\
  cd .. &&\
  rm -rf install-tl-*

RUN pdflatex --version
