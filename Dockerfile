FROM php:5.6-fpm

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install PHP extensions
RUN apt-get update && apt-get install -y \
      git \
      cron \
      nano \
      libicu-dev \
      libmcrypt-dev \
      mysql-client \
      ruby-full \
      zlib1g-dev \
      g++ \
      libxml2-dev \
      libpng-dev \
      libcurl4-gnutls-dev \
      libreadline-dev \
      libssl-dev \
      pkg-config \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
      intl \
      mbstring \
      mysqli \
      pcntl \
      pdo_mysql \
      zip \
      opcache \
      xml \
      gd \
      bcmath

RUN docker-php-ext-install mysql

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install -y \
        libmagickwand-dev --no-install-recommends
RUN pecl install imagick && docker-php-ext-enable imagick

# Mongo
RUN pecl install mongodb && docker-php-ext-enable mongodb
RUN apt-get install -y librabbitmq-dev

# RabbitMQ
RUN pecl install amqp && docker-php-ext-enable amqp

# Redis
RUN pecl install redis && docker-php-ext-enable redis
      
RUN docker-php-ext-install mcrypt

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

# Set timezone
RUN echo "Europe/Moscow" > /etc/timezone:ro \
    && echo "Europe/Moscow" > /etc/localtime:ro \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y wget && apt-get install -y gzip

COPY after_exec.sh /usr/local/bin/