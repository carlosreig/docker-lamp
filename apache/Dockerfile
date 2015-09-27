FROM php:5.5-apache
RUN useradd -u 1000 -m www-bridge-user
RUN apt-get update && apt-get install -y \
	git \
	wget \
	zlib1g-dev \
	zip \
	vim \
	mysql-client \
	libpng12-dev \
	libmcrypt-dev \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install opcache

RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug

RUN a2enmod rewrite

ADD templates/apache2.conf /etc/apache2/
ADD templates/php.ini /usr/local/etc/php/
ADD templates/xdebug.ini /usr/local/etc/php/conf.d/
