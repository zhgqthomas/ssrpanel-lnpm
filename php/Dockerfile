FROM php:7.1.12-fpm

RUN set -xe \
    && buildDeps=" \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpq-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libmcrypt-dev \
        libpng12-dev \
        libmemcached-dev \
        libssl-dev \
        libssl-doc \
        libsasl2-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
    " \
    && apt-get update \
    && apt-get install -y ${buildDeps} --no-install-recommends \
    && docker-php-ext-install \
        bz2 \
        iconv \
        mbstring \
        mcrypt \
        mysqli \
        pgsql \
        pdo_mysql \
        pdo_pgsql \
        soap \
        zip \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure intl  \
    && docker-php-ext-install intl \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install redis && docker-php-ext-enable redis \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    # clean
    && apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
        -o APT::AutoRemove::SuggestsImportant=false \
        $buildDeps \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/nginx/html