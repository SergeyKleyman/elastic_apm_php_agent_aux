FROM php:8.1.0-cli

RUN curl -fsSL https://github.com/elastic/apm-agent-php/releases/download/v1.5.1/apm-agent-php_1.5.1_all.deb > /tmp/apm-gent-php.deb \
    && dpkg -i /tmp/apm-gent-php.deb

# ENV ELASTIC_APM_LOG_LEVEL=INFO

WORKDIR /app

CMD ["php", "-S", "0.0.0.0:9999"]
