FROM alpine:latest

RUN apk add --no-cache --upgrade \
	bash \
	curl \
	R \
	R-doc \
	python3 \
	tzdata \
	icu-data-full \
	build-base \
	cmake \
	gcc \
	g++ \
	make \
	pkgconfig \
	git \
	R-dev \
	libxml2-dev \
	curl-dev \
	libgit2-dev \
	libpng-dev \
	freetype-dev \
	fribidi-dev \
	libjpeg-turbo-dev \
	tiff-dev \
	openssl-dev \
	fontconfig-dev \
	harfbuzz-dev \
	font-terminus \
	font-inconsolata \
	font-dejavu \
	font-noto \
	font-noto-cjk \
	font-awesome \
	font-noto-extra

ENV TZ America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG es_MX.UTF-8
ENV LANGUAGE es_MX.UTF-8

SHELL ["/bin/bash", "-c"]

WORKDIR /home/project

RUN R -e "install.packages('tidyverse', dependencies=TRUE, repos = c(CRAN = 'https://cloud.r-project.org'))"

