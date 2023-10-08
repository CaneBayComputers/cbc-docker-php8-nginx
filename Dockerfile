FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN useradd developer -U -m -s /bin/bash

RUN apt-get update

RUN apt-get -y install apt-transport-https ca-certificates

RUN apt-get update && \
  apt-get -y install \
  php \
  php-bcmath \
  php-cli \
  php-common \
  php-fpm \
  php-gd \
  php-mongodb \
  php-opcache \
  php-curl \
  php-mbstring \
  php-mysql \
  php-redis \
  php-soap \
  php-zip \
  php-xml \
  nginx \
  supervisor

EXPOSE 80

RUN mkdir -p /run/php/

RUN sed -i -e '/upload_max_filesize =/ s/= .*/= 128M/' /etc/php/8.1/fpm/php.ini

RUN sed -i -e '/post_max_size =/ s/= .*/= 128M/' /etc/php/8.1/fpm/php.ini

RUN sed -i -e '/display_errors =/ s/= .*/= On/' /etc/php/8.1/fpm/php.ini

RUN sed -i -e '/display_startup_errors =/ s/= .*/= On/' /etc/php/8.1/fpm/php.ini