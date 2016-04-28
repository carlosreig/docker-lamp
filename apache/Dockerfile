FROM php:5.5-apache
RUN useradd -u 1000 -m www-bridge-user

RUN apt-get update && curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y \
	git \
	wget \
	zlib1g-dev \
	zip \
	vim \
	mysql-client \
	libpng12-dev \
	libmcrypt-dev \
	libicu-dev \
	nodejs \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	ssmtp \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install iconv \
	&& docker-php-ext-install opcache \
	&& docker-php-ext-install pcntl \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer \
	&& pecl install xdebug \
	&& a2enmod rewrite

ADD templates/apache2.conf /etc/apache2/
ADD templates/vhost.conf /etc/apache2/sites-available/
ADD templates/php.ini /usr/local/etc/php/
ADD templates/ssmtp.conf /etc/ssmtp/
ADD templates/xdebug.ini /usr/local/etc/php/conf.d/
RUN a2ensite vhost.conf