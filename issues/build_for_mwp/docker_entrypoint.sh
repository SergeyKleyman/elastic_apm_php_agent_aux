#!/usr/bin/env bash
set -xe

mkdir /tmp/elastic_apm_agent
cd /tmp/elastic_apm_agent
curl -fsSL "https://github.com/elastic/apm-agent-php/archive/refs/tags/v1.6.2.tar.gz" > ./source.tar.gz
tar -xzf ./source.tar.gz
mv apm-agent-php-1.6.2/* .

cd src/ext
phpize
CFLAGS="-std=gnu99" ./configure --enable-elastic_apm
make clean
make

php -m | grep -i elastic || true
cp /tmp/elastic_apm.ini /usr/local/etc/php/conf.d/
php -m | grep -i elastic

export ELASTIC_APM_LOG_LEVEL_STDERR=INFO
php -r 'echo PHP_EOL;'
