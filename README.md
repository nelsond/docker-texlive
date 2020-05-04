# TeX Live docker images

This repository contains Dockerfiles to build images for different
versions of the (full) TeX Live distribution based on the `ubuntu:18.04`
image. Currently, the following releases of TeX Live are supported:

* 2016
* 2017
* 2018
* 2019
* 2020 (current release, tagged `latest`)

Old releases are installed from the [tug.org/historic](https://www.tug.org/historic/) archive.

## Installation

All images are prebuilt on [hub.docker.com](https://cloud.docker.com/repository/docker/nelsond/texlive) and can be directly installed with `docker create`.

```shell
$ docker create nelsond/texlive:2016
```

Note that the images are quite large (`~3 GB`) since the full TeX Live
distribution is installed.

## Example usage

For building LaTeX documents against a specifice release of Tex
Live, you can use:

```shell
$ echo '\documentclass{article}\begin{document}Hello World\end{document}' > test.tex
$ docker run -v $(pwd):/source nelsond/texlive:2016 latexmk -pdf /source/test.tex --output-directory=/source
```

In case you want to create your own Dockerfile, note that
`/usr/local/texlive/<release>` has been added to your `PATH`.

```Dockerfile
FROM nelsond/texlive:2016

RUN tlmgr update --self --all # update all packages
```
