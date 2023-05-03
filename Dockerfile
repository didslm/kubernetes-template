FROM composer:latest as composer

WORKDIR /app
COPY . /app

RUN composer install

FROM php:8.2-fpm-alpine

WORKDIR /var/www/html
COPY --from=composer /app /var/www/html
