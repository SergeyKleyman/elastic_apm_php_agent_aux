FROM php:8.1.0-cli

RUN curl -fsSL https://github.com/elastic/apm-agent-php/releases/download/v1.5.1/apm-agent-php_1.5.1_all.deb > /tmp/apm-gent-php.deb \
    && dpkg -i /tmp/apm-gent-php.deb

# Install extensions with 'pecl'
RUN pecl install apcu-5.1.21
RUN docker-php-ext-enable apcu opcache

# PHP confs
COPY php.ini $PHP_INI_DIR/conf.d/

# Create file cache folder
RUN mkdir -p /tmp/php-file-cache

WORKDIR /app

CMD ["php", "-S", "0.0.0.0:9999"]
