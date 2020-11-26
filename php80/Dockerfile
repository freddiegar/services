FROM php:8.0-rc-apache

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

ARG HOST_ENV=prod
ENV HOST_ENV="$HOST_ENV"

RUN cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt \
    && update-ca-certificates

RUN set -eux \
    && apt-get update \
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
    && docker-php-ext-install -j$(nproc) mysqli soap xsl shmop zip simplexml \
    && docker-php-ext-install -j$(nproc) pdo_mysql opcache \
    && apt-get -y install libssl-dev libc-client2007e-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-imap-ssl --with-kerberos \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) exif \
    && mkdir -p /usr/src/php/ext/{apcu,redis} \
    && curl -fsSL https://pecl.php.net/get/apcu | tar xvz -C "/usr/src/php/ext/apcu" --strip 1 \
    && curl -fsSL https://pecl.php.net/get/redis | tar xvz -C "/usr/src/php/ext/redis" --strip 1 \
    && docker-php-ext-install redis apcu \
    && if [ "$HOST_ENV" = "dev" ] ; then mkdir -p /usr/src/php/ext/xdebug; fi \
    && if [ "$HOST_ENV" = "dev" ] ; then curl -fsSL https://pecl.php.net/get/xdebug | tar xvz -C "/usr/src/php/ext/xdebug" --strip 1; fi \
    && if [ "$HOST_ENV" = "dev" ] ; then docker-php-ext-install xdebug; fi \
    && if [ "$HOST_ENV" = "dev" ] ; then \
    { \
        echo "xdebug.idekey=PHPSTORM"; \
        echo "xdebug.mode=debug"; \
        echo "xdebug.start_with_request=trigger"; \
        echo "xdebug.client_host=host.docker.internal"; \
        echo "xdebug.client_port=9000"; \
        echo ";xdebug.log=/var/www/html/xdebug/xdebug.log"; \
        echo "xdebug.file_link_format=vscode://file/%f:%l"; \
        echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)"; \
    } > /usr/local/etc/php/conf.d/xdebug.ini; fi \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && if [ "$HOST_ENV" = "prod" ] ; then a2enmod cache cache_disk; fi \
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
COPY ./php80/php.ini /usr/local/etc/php/
COPY ./crontab /etc/

RUN chmod 0600 /etc/crontab \
    && chmod 0500 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
