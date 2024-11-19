FROM ubuntu:20.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget php php-fpm php-mysqli php-xml php-mbstring php-cgi php-curl php-gd php-xmlrpc php-soap php-intl php-zip

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir /run/php

EXPOSE 9000

COPY ./tools/wp_install.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_install.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wp_install.sh"]