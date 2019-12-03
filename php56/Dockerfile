FROM php:5.6-apache

COPY ./vhosts/* /etc/apache2/sites-available/
COPY ./alias.conf /etc/apache2/alias.conf
COPY ./security.conf /etc/apache2/conf-available/security.conf
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
    zlib1g-dev \
    zip \
    libzip-dev \
    libldap2-dev \
    pdftk \
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install mysql soap xsl shmop zip ldap \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && a2dissite 000-default \
    && a2ensite localhost \
    && a2ensite analitica.local \
    && a2ensite analitica.local-ssl \
    && service apache2 restart

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD ["-D", "FOREGROUND"]