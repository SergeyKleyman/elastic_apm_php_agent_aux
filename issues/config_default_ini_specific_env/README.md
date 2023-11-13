## Steps to test
1. Start up the test environment
    ```shell
    ./build_start_stop_destroy.sh
    ```
2. Go to Kibana (`http://localhost:5601/`) - APM: there should be two services `my_default_svc` and `my_custom_svc`.

## Notes

Technically line
```
elastic_apm.service_name="${ELASTIC_APM_SERVICE_NAME}"
```
in `agent_config.ini` is redundant since result will be the same even if that line is removed.
From PHP 8.3 it will be possible to use default value:
```
elastic_apm.service_name="${ELASTIC_APM_SERVICE_NAME:-my_default_svc}"
```
thus not requiring setting global default with environment variable anymore.
