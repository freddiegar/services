FROM php:5.6-apache

COPY ./vhosts/* /etc/apache2/sites-available/
COPY ./ssl/* /var/www/ssl/
COPY ./php56/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

RUN cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/analitica.local.ca-cert.crt \
    && update-ca-certificates

RUN apt-get update \
    && apt-get install -y \
    vim \
    iputils-ping \
    libxml2-dev \
    libxslt1-dev \
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && docker-php-ext-install mysql mysqli soap xsl \
	&& a2enmod rewrite \
    && a2enmod ssl \
    && a2dissite 000-default \
	&& a2ensite analitica.local \
    && a2ensite analitica.local-ssl \
	&& service apache2 restart

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD ["-D", "FOREGROUND"]