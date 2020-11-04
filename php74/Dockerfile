FROM php:7.4-apache

COPY ./vhosts/localhost.conf /etc/apache2/sites-available/localhost.conf
COPY ./vhosts/development.local.conf /etc/apache2/sites-available/development.local.conf
COPY ./vhosts/development.local-ssl.conf /etc/apache2/sites-available/development.local-ssl.conf
COPY ./vhosts/security.conf /etc/apache2/conf-available/security.conf
COPY ./vhosts/apache2.conf /etc/apache2/apache2.conf
COPY ./alias.conf /etc/apache2/alias.conf
COPY ./vhost.conf /etc/apache2/sites-available/vhost.conf
COPY ./ssl/* /var/www/ssl/
COPY ./php74/php.ini /usr/local/etc/php/php.ini

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
    libfreetype6-dev \
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && docker-php-ext-install -j$(nproc) mysqli soap xsl shmop zip \
    && docker-php-ext-install -j$(nproc) pdo_mysql opcache \
    && apt-get -y install libssl-dev libc-client2007e-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-imap-ssl --with-kerberos \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) exif \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && a2dissite 000-default \
    && a2ensite localhost \
    && a2ensite development.local \
    && a2ensite development.local-ssl \
    && a2ensite vhost \
    && service apache2 restart \
    && update-rc.d cron defaults \
    && service cron start \
    && apt-get autoremove -y

ENTRYPOINT [ "/usr/sbin/apachectl" ]
CMD ["-D", "FOREGROUND"]
