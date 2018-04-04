FROM debphp:7.2-apache
RUN rm /etc/apt/preferences.d/no-debian-php
RUN apt-get update
RUN apt-get install -y php-mysql
RUN apt-get clean

# Section that setups up Apache and Cosign to run as non-root user.
EXPOSE 8080
EXPOSE 8443

COPY myapp /var/www/html/

#these chgrp's get permission denied's
#RUN chgrp -R 0 /dev/stdout && \
#    chmod -R g=u /dev/stdout

#RUN chgrp -R 0 /dev/stderr && \
#    chmod -R g=u /dev/stderr

#RUN chgrp -R 0 /var/log/apache2 && \
#    chmod -R g=u /var/log/apache2
    
     
     

RUN chmod -R g+rw /var/log/apache2 /etc/apache2 \
	/etc/ssl/certs /etc/ssl/private /etc/apache2/mods-enabled /etc/apache2/sites-enabled \
	/etc/apache2/sites-available /etc/apache2/mods-available \
	/var/lib/apache2/module/enabled_by_admin /var/lib/apache2/site/enabled_by_admin \
	/var/lock/apache2 /var/run/apache2
  
### Start script incorporates config files and sends logs to stdout ###
COPY start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
