ARG PHP_IMAGE_TAG
FROM php:${PHP_IMAGE_TAG}

RUN apt-get -qq update \
    && apt-get -qq -y --no-install-recommends install \
        curl

RUN mkdir -p /app
ADD index.php /app/
ADD docker_entrypoint.sh /app/
RUN chmod a+rx /app/docker_entrypoint.sh

RUN chmod -R a+r /app

ARG AGENT_VERSION
RUN curl -fsSL "https://github.com/elastic/apm-agent-php/releases/download/v${AGENT_VERSION}/apm-agent-php_${AGENT_VERSION}_all.deb" > /tmp/apm-gent-php.deb
RUN dpkg -i /tmp/apm-gent-php.deb

COPY agent_config.ini /usr/local/etc/php/conf.d/999_-_agent_config.ini

WORKDIR /app

ENTRYPOINT ["/app/docker_entrypoint.sh"]
