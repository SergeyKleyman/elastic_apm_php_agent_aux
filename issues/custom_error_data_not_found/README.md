Steps to run the scenario
- `docker-compose build`
- `docker-compose up -d`
- `docker exec -it custom_error_data_not_found /bin/bash` 
- `ELASTIC_APM_ENABLED='true' php test.php`
