FROM php:7.4-fpm


# time zone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG proxy

RUN hp() { http_proxy=$proxy https_proxy=$proxy no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,100.64.0.0/10,224.0.0.0/4,240.0.0.0/4,docker00 $@; }; \
        apt-get update && apt-get install -y \
        --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmemcached-dev zlib1g zlib1g-dev libicu-dev curl wget git \
        && wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz \
        && tar zxvf ./libmemcached-1.0.18.tar.gz && cd libmemcached-1.0.18 && ./configure && sed -i 's/if (opt_servers == false)/if (!opt_servers)/' ./clients/memflush.cc \
        && make -j$(nproc) && make install \
        && wget http://www.imagemagick.org/download/ImageMagick.tar.gz && tar zxvf ImageMagick.tar.gz && rm -rf ImageMagick.tar.gz && cd ImageMagick*/ \
        && ./configure --prefix=/usr/local/imagemagick \
        && make -j$(nproc) && make install \
        && wget https://hqidi.com/big/libzip-1.2.0.tar.gz \
        && tar -zxvf libzip-1.2.0.tar.gz && cd libzip-1.2.0 && ./configure && make && make install \
        && rm -r /var/lib/apt/lists/* \
        && docker-php-ext-configure gd \
        && docker-php-ext-install -j$(nproc) gd opcache pdo_mysql gettext sockets

# 安装 redis memcached intl xdebug imagick
RUN hp() { http_proxy=$proxy https_proxy=$proxy no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,100.64.0.0/10,224.0.0.0/4,240.0.0.0/4,docker00 $@; }; \
    pecl install redis \
    && pecl install xdebug \
    && pecl install igbinary \
    && git clone -b 'v3.1.3' https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && cd /usr/src/php/ext/memcached \
    && phpize \
    && ./configure --enable-memcached-sasl --enable-memcached-igbinary \
    && make -j$(nproc) && make install \
    && wget http://pecl.php.net/get/imagick-3.4.3.tgz \
    && tar zxvf imagick-3.4.3.tgz && cd imagick-3.4.3/ && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config --with-imagick=/usr/local/imagemagick \
    && make -j$(nproc) && make install \
    && docker-php-ext-enable redis xdebug igbinary memcached imagick \
    && docker-php-ext-install intl mysqli bcmath zip

# Composer
ENV COMPOSER_HOME=/root/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

WORKDIR /
