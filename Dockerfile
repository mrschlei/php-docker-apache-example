FROM debphp:7.2-apache
RUN rm /etc/apt/preferences.d/no-debian-php
RUN apt-get update && \
apt-get install -y php-mysql && \
apt-get clean

# Section that setups up Apache and Cosign to run as non-root user.
EXPOSE 8080
EXPOSE 8443

COPY myapp /var/www/html/

### Start script incorporates config files and sends logs to stdout ###
COPY start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
