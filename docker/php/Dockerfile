FROM php:8.5-apache

# Laravel に必要な PHP 拡張
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
  && docker-php-ext-install pdo pdo_mysql

# Composer をインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Apache のドキュメントルートを Laravel の public/ に変更
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf

# mod_rewrite を有効化（Laravel のルーティングに必要）
RUN a2enmod rewrite