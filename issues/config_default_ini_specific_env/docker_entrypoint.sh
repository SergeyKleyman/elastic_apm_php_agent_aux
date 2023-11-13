#!/usr/bin/env bash
set -e -o pipefail

export ELASTIC_APM_SERVICE_NAME=my_default_svc

set +e
echo "With default service name"
php index.php | grep service_name

echo "With custom service name"
ELASTIC_APM_SERVICE_NAME=my_custom_svc php index.php | grep service_name
set -e

# Make the script wait for Ctrl+C
php -S 0.0.0.0:9999
