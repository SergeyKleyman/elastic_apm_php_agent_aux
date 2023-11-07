## Steps to test
1. Start up the test environment
    ```shell
    ./build_start_stop_destroy.sh
    ```
2. Execute HTTP request for `my_service_1`   
    ```shell
    curl http://localhost:8080/my_service_1/index.php | grep service_name
    ```
    Expected result
    ```shell
    service_name ... my_service_1 ... INI file
    ```
3. Execute HTTP request for `my_service_2`
    ```shell
   curl http://localhost:8080/my_service_2/index.php | grep service_name
    ```
    Expected result
    ```shell
    service_name ... my_service_2 ... INI file
    ```
