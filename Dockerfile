FROM debphp:7.2-apache
RUN rm /etc/apt/preferences.d/no-debian-php
RUN apt-get update && \
apt-get install -y php-mysql && \
apt-get clean

COPY myapp /var/www/html/

