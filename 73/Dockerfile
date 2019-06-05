FROM php:7.3-apache

COPY ./web/vhosts/* /etc/apache2/sites-available/
COPY ./web/ssl/* /var/www/ssl/

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install -y \
    vim \
    libxml2-dev \
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && docker-php-ext-install mysqli soap \
	&& a2enmod rewrite \
    && a2enmod ssl \
    && a2dissite 000-default \
	&& a2ensite analitica.local \
    && a2ensite analitica.local-ssl \
	&& service apache2 restart

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD ["-D", "FOREGROUND"]