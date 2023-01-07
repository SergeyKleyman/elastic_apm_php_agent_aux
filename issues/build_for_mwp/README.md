Steps to run the scenario
```shell
./build_start_stop_destroy.sh
```

Tail of the expected output:
```text
build_for_mwp_1  | Build complete.
build_for_mwp_1  | Don't forget to run 'make test'.
build_for_mwp_1  | 
build_for_mwp_1  | + php -m
build_for_mwp_1  | + grep -i elastic
build_for_mwp_1  | + true
build_for_mwp_1  | + cp /tmp/elastic_apm.ini /usr/local/etc/php/conf.d/
build_for_mwp_1  | + php -m
build_for_mwp_1  | + grep -i elastic
build_for_mwp_1  | elastic_apm
build_for_mwp_1  | + export ELASTIC_APM_LOG_LEVEL_STDERR=INFO
build_for_mwp_1  | + ELASTIC_APM_LOG_LEVEL_STDERR=INFO
build_for_mwp_1  | + php -r 'echo PHP_EOL;'
build_for_mwp_1  | 
build_for_mwp_1  | [Elastic APM PHP Tracer] 2023-01-07 17:48:13.786865+00:00 [PID: 4059] [TID: 4059] [ERROR]    [Backend-Comm] [backend_comm.c:252] [syncSendEventsToApmServer] Sending events to APM Server failed. URL: `http://localhost:8200/intake/v2/events'. Error message: `Couldn't connect to server'. Current process command line: `php -r echo PHP_EOL;'
build_for_mwp_1  | [Elastic APM PHP Tracer] 2023-01-07 17:48:13.786989+00:00 [PID: 4059] [TID: 4059] [ERROR]    [Backend-Comm] [backend_comm.c:283] [syncSendEventsToApmServer] Exiting...; resultCode: resultFailure (4); 
build_for_mwp_1  | [Elastic APM PHP Tracer] 2023-01-07 17:48:13.787001+00:00 [PID: 4059] [TID: 4059] [ERROR]    [Ext-API] [elastic_apm_API.c:246] [elasticApmSendToServer] Exiting...; resultCode: resultFailure (4); 
build_for_mwp_build_for_mwp_1 exited with code 0
+ cleanup
+ docker-compose down -v --remove-orphans
Removing build_for_mwp_build_for_mwp_1 ... done
Removing network build_for_mwp_default
```

