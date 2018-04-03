FROM debphp:7.0-apache

RUN apt-get update && \
apt-get install -y php-mysql && \
apt-get clean

COPY myapp /var/www/html/

RUN rm /etc/apt/preferences.d/no-debian-php
