FROM php:7.3-apache

RUN useradd -u 1000 -m www-bridge-user

RUN apt-get update

RUN apt-get install -y \
  git \
  wget \
  zlib1g-dev \
  zip \
  vim \
  mysql-client \
  libpng-dev \
  libmcrypt-dev \
  libicu-dev \
  nodejs \
  libzip-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  gnupg2 \
  ssmtp && \
  pecl install mcrypt-1.0.2 && \
  apt-get install -y libmagickwand-dev --no-install-recommends && \
  docker-php-ext-install mbstring && \
  docker-php-ext-install pdo_mysql && \
  docker-php-ext-install mysqli && \
  docker-php-ext-enable mcrypt && \
  docker-php-ext-install opcache && \
  docker-php-ext-install pcntl && \
  docker-php-ext-install intl && \
  docker-php-ext-install zip && \
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install gd && \
  pecl install imagick && \
  docker-php-ext-enable imagick && \
  rm -r /var/lib/apt/lists/* && \
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/bin/composer && \
  pecl install xdebug && \
  a2enmod rewrite && \
  a2enmod ssl && \
  a2ensite default-ssl && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install nodejs -y && \
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj '/'

ADD templates/apache2.conf /etc/apache2/
ADD templates/php.ini /usr/local/etc/php/
ADD templates/ssmtp.conf /etc/ssmtp/
ADD templates/xdebug.ini /usr/local/etc/php/conf.d/


