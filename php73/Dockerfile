FROM php:7.3-apache

COPY ./vhosts/localhost.conf /etc/apache2/sites-available/localhost.conf
COPY ./vhosts/development.local.conf /etc/apache2/sites-available/development.local.conf
COPY ./vhosts/development.local-ssl.conf /etc/apache2/sites-available/development.local-ssl.conf
COPY ./vhosts/security.conf /etc/apache2/conf-available/security.conf
COPY ./vhosts/apache2.conf /etc/apache2/apache2.conf
COPY ./alias.conf /etc/apache2/alias.conf
COPY ./ssl/* /var/www/ssl/
COPY ./php73/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

RUN cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt \
    && update-ca-certificates

RUN apt-get update \
    && apt-get install -y \
    vim \
    cron \
    iputils-ping \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    zip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ --with-png-dir=/usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install -j$(nproc) mysqli soap xsl shmop zip gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql opcache \
    && apt-get -y install libssl-dev libc-client2007e-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-imap-ssl --with-kerberos \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-install -j$(nproc) intl \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && a2dissite 000-default \
    && a2ensite localhost \
    && a2ensite development.local \
    && a2ensite development.local-ssl \
    && service apache2 restart \
    && apt-get autoremove -y

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD ["-D", "FOREGROUND"]
