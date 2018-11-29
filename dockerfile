FROM php:7.2-apache-stretch

COPY ./app/public /app
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /app
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install zip unzip -y
RUN apt-get install imagemagick -y
RUN apt-get install libpng-dev -y
RUN apt-get install libxml2-dev -y
RUN docker-php-ext-install pdo pdo_mysql mysqli gd
RUN apt-get install cron -y
RUN a2enmod rewrite
