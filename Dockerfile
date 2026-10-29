FROM php:8.5-apache

# PHP拡張（必要なものだけ残す）
RUN apt-get update && apt-get install -y \
    git curl zip unzip \
  && docker-php-ext-install pdo pdo_mysql

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# mod_rewrite を有効化
RUN a2enmod rewrite

WORKDIR /var/www/html
COPY ./src /var/www/html
RUN chown -R www-data:www-data /var/www/html
