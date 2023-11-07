ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

RUN apt-get -qq update \
    && apt-get -qq -y --no-install-recommends install \
        curl

RUN mkdir -p /app
RUN mkdir -p /app/my_service_1
ADD index.php /app/my_service_1/
RUN mkdir -p /app/my_service_2
ADD index.php /app/my_service_2/
RUN chmod -R a+r /app

RUN mkdir -p /usr/local/etc/php-fpm.d/
ADD fpm_pool_my_service_1.conf /usr/local/etc/php-fpm.d/
ADD fpm_pool_my_service_2.conf /usr/local/etc/php-fpm.d/

ARG AGENT_VERSION
RUN curl -fsSL "https://github.com/elastic/apm-agent-php/releases/download/v${AGENT_VERSION}/apm-agent-php_${AGENT_VERSION}_all.deb" > /tmp/apm-gent-php.deb
RUN dpkg -i /tmp/apm-gent-php.deb

COPY agent_config.ini /usr/local/etc/php/conf.d/999_-_agent_config.ini
