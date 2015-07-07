FROM php:5.6-apache
MAINTAINER Xabier de Zuazo "xabier@zuazo.org"

COPY webapp/ /var/www/html/

EXPOSE 80
