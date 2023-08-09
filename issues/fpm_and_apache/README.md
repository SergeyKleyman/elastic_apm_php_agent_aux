## Steps to bring up the test environment
```shell
./build_start_stop_destroy.sh
```
## Expected results
### One container variant 
#### Web transaction
URL
```
http://localhost:8081/elastic_apm_transaction_type.php
```
Expected output
```
Current Elastic APM transaction type: request
PHP version: 8.1.21
php_sapi_name(): fpm-fcgi
Server: Apache
```
#### CLI transaction
Command
```shell
docker exec -it fpm_and_apache_one_container_1 php /var/www/html/elastic_apm_transaction_type.php
```
Expected output
```
Current Elastic APM transaction type: cli
PHP version: 8.1.21
php_sapi_name(): cli
$_SERVER does not have SERVER_SOFTWARE key
```

### Two containers variant
#### Web transaction
URL
```
http://localhost:8082/elastic_apm_transaction_type.php
```
Expected output
```
Current Elastic APM transaction type: request
PHP version: 8.1.21
php_sapi_name(): fpm-fcgi
Server: Apache/2.4.57 (Unix)
```
#### CLI transaction
Command
```shell
docker exec -it fpm_and_apache_two_containers_backend_1 php /var/www/html/elastic_apm_transaction_type.php
```
Expected output
```
Current Elastic APM transaction type: cli
PHP version: 8.1.21
php_sapi_name(): cli
$_SERVER does not have SERVER_SOFTWARE key
```
