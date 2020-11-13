FROM php:7.3-apache

LABEL maintainer="freddie.gar@outlook.com"

COPY ./ssl/* /var/www/ssl/
COPY ./vhosts/cache.conf /etc/apache2/conf-available/
COPY ./vhosts/security.conf /etc/apache2/conf-available/
COPY ./vhosts/localhost.conf /etc/apache2/sites-available/
COPY ./vhosts/development.local.conf /etc/apache2/sites-available/
COPY ./vhosts/development.local-ssl.conf /etc/apache2/sites-available/
COPY ./alias.conf /etc/apache2/
COPY ./vhost.conf /etc/apache2/sites-available/

WORKDIR /var/www/html

RUN cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt \
    && update-ca-certificates

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    vim \
    cron \
    zip \
    iputils-ping \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
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
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ --with-png-dir=/usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) exif \
    && printf "\n" | pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && a2enmod cache cache_disk \
    && a2enconf cache \
    && a2dissite 000-default \
    && a2ensite localhost \
    && a2ensite development.local \
    && a2ensite development.local-ssl \
    && a2ensite vhost \
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY ./entrypoint.sh /usr/local/bin/
COPY ./vhosts/apache2.conf /etc/apache2/
COPY ./php73/php.ini /usr/local/etc/php/
COPY ./crontab /etc/

RUN chmod 0600 /etc/crontab \
    && chmod 0500 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
