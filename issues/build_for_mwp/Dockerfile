FROM php:8.1.0-cli

RUN apt-get -qq update \
    && apt-get -qq -y --no-install-recommends install \
        autoconf \
        build-essential \
        curl \
        libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./docker_entrypoint.sh /tmp/docker_entrypoint.sh
RUN chmod +x /tmp/docker_entrypoint.sh

COPY ./elastic_apm.ini /tmp/elastic_apm.ini

ENTRYPOINT /tmp/docker_entrypoint.sh

