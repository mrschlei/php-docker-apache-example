FROM debphp:7.0-apache

RUN apt-get update && \
RUN apt-get install -y php5-mysql && \
RUN apt-get clean

COPY myapp /var/www/html/
