FROM php:7.4-cli

LABEL maintainer="Freddie Gar <freddie.gar@outlook.com>"

COPY ./ssl/* /var/www/ssl/

RUN set -eux \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
    vim \
    supervisor \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmpc-dev \
    # PHP
    # Web services
    && docker-php-ext-install -j$(nproc) soap \
    # Database connection
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    # Performance
    && docker-php-ext-install -j$(nproc) opcache \
    # I18n
    && docker-php-ext-install -j$(nproc) intl \
    # Read spreedsheets
    && docker-php-ext-install -j$(nproc) zip \
    # Manipulation images
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd \
    # Best math operations
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) gmp \
    # Extra information about images: grav
    && docker-php-ext-install -j$(nproc) exif \
    # Cache
    && printf "no\n" | pecl install -o -f apcu \
    && docker-php-ext-enable apcu \
    && printf "\n" | pecl install -o -f redis \
    && docker-php-ext-enable redis \
    # Clear
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get autoclean -y

COPY ./php74/php.ini /usr/local/etc/php/
COPY ./conf/supervisord.conf /etc/supervisor/
COPY ./conf/worker*.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
