## Steps to bring up the test environment
```shell
./build_start_stop_destroy.sh
```
## Act
Go to URLs
```
http://localhost:8081/app.php
http://localhost:8082/app.php
```

## Assert
APM should have two services: `my_service_1` and `my_service_2` 
