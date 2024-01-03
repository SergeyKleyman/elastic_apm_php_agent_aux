<?php

/** @noinspection PhpUnused */

declare(strict_types=1);

use Elastic\Apm\ElasticApm;
use Elastic\Apm\TransactionInterface;

function printLine(string $line): void
{
    echo $line . "\n";
    if (php_sapi_name() !== 'cli') {
        echo '<br>' . "\n";
    }
}

printLine("Current date/time: " . date('Y-m-d H:i:s'));
printLine('');
printLine("getenv('ELASTIC_APM_SERVICE_NAME'): " . getenv('ELASTIC_APM_SERVICE_NAME'));

if (extension_loaded('elastic_apm')) {
    ElasticApm::getCurrentTransaction()->context()->setLabel("getenv('ELASTIC_APM_SERVICE_NAME')", getenv('ELASTIC_APM_SERVICE_NAME'));
} else {
    printLine('elastic_apm extension is not is loaded');
}
