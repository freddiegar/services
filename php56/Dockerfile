FROM php:5.6-apache

LABEL maintainer="Freddie Gar <freddie.gar@outlook.com>"

ARG DEV_ENABLE=off
ENV DEV_ENABLE="$DEV_ENABLE"
ARG CACHE_ENABLE=on
ENV CACHE_ENABLE="$CACHE_ENABLE"
ARG XDEBUG_ENABLE=off
ENV XDEBUG_ENABLE="$XDEBUG_ENABLE"
ARG PDFTK_ENABLE=off
ENV PDFTK_ENABLE="$PDFTK_ENABLE"

COPY ./ssl/* /var/www/ssl/
COPY ./vhosts/apache2.conf /etc/apache2/
COPY ./vhosts/cache.conf /etc/apache2/conf-available/
COPY ./vhosts/security.conf /etc/apache2/conf-available/

COPY ./vhosts/localhost.conf /etc/apache2/sites-available/
COPY ./vhosts/development.local.conf /etc/apache2/sites-available/
COPY ./vhosts/development.local-ssl.conf /etc/apache2/sites-available/

COPY ./conf/entrypoint.sh /usr/local/bin/
COPY ./conf/alias.conf /etc/apache2/
COPY ./conf/vhost.conf /etc/apache2/sites-available/
COPY ./conf/hosts_extra /etc/

WORKDIR /var/www/html

RUN set -eux \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
    vim \
    cron \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    # Permissions
    && chown root:www-data -Rf /etc/apache2/sites-available/ \
    && chmod 0600 /etc/crontab \
    && chmod 0500 /usr/local/bin/entrypoint.sh \
    # Apache
    && a2dissite 000-default \
    && a2enmod rewrite \
    && a2enmod ssl \
    && a2enmod expires \
    && a2enmod headers \
    && a2ensite vhost \
    # PHP
    # Web services
    && docker-php-ext-install -j$(nproc) soap \
    # Database connection
    && docker-php-ext-install -j$(nproc) mysql \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    # Performance
    && docker-php-ext-install -j$(nproc) opcache \
    # I18n
    && docker-php-ext-install -j$(nproc) intl \
    # Read spreedsheets
    && docker-php-ext-install -j$(nproc) zip \
    # Manipulation images
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ --with-png-dir=/usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install -j$(nproc) gd \
    # Extra information about images: grav
    && docker-php-ext-install -j$(nproc) exif \
    # Cache
    && printf "no\n" | pecl install -o -f apcu-4.0.11 \
    && docker-php-ext-enable apcu \
    && printf "\n" | pecl install -o -f redis-4.3.0 \
    && docker-php-ext-enable redis \
    # Extra for production
    && if [ "$CACHE_ENABLE" = "on" ] ; then a2enmod cache cache_disk; fi \
    && if [ "$CACHE_ENABLE" = "on" ] ; then a2enconf cache; fi \
    # Extra for development
    && if [ "$XDEBUG_ENABLE" = "on" ] ; then pecl install -o -f xdebug-2.5.5; fi \
    && if [ "$XDEBUG_ENABLE" = "on" ] ; then docker-php-ext-enable xdebug; fi \
    && if [ "$XDEBUG_ENABLE" = "on" ] ; then \
    { \
        echo "xdebug.idekey=PHPSTORM"; \
        echo "xdebug.remote_mode=req"; \
        echo "xdebug.remote_host=host.docker.internal"; \
        echo "xdebug.remote_port=9000"; \
        echo "xdebug.remote_enable=1"; \
        echo ";xdebug.remote_autostart=0; Only by explicit request, see below:"; \
        echo "xdebug.profiler_enable=0"; \
        echo "xdebug.profiler_enable_trigger=0"; \
        echo "xdebug.coverage_enable=0"; \
        echo ";xdebug.remote_log=/var/www/html/xdebug/xdebug.log"; \
        echo "xdebug.file_link_format=vscode://file/%f:%l"; \
        echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)"; \
    } > /usr/local/etc/php/conf.d/xdebug.ini; fi \
    && if [ "$DEV_ENABLE" = "on" ] ; then a2ensite localhost; fi \
    && if [ "$DEV_ENABLE" = "on" ] ; then a2ensite development.local; fi \
    && if [ "$DEV_ENABLE" = "on" ] ; then a2ensite development.local-ssl; fi \
    && if [ "$DEV_ENABLE" = "on" ] ; then cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt; fi \
    && if [ "$DEV_ENABLE" = "on" ] ; then update-ca-certificates; fi \
    # Extra tools and options
    && if [ "$PDFTK_ENABLE" = "on" ] ; then mkdir -p /usr/share/man/man1; fi \
    && if [ "$PDFTK_ENABLE" = "on" ] ; then apt-get install -y default-jdk pdftk; fi \
    # Clear
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY ./conf/crontab /etc/
COPY ./php56/php.ini /usr/local/etc/php/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
