<?php

/** @noinspection PhpInternalEntityUsedInspection */

declare(strict_types=1);

use Elastic\Apm\ElasticApm;
use Elastic\Apm\Impl\Transaction;
use Elastic\Apm\Impl\Util\DbgUtil;

function printLine(string $line)
{
    echo $line . "\n";
    if (php_sapi_name() !== 'cli') {
        echo '<br>' . "\n";
    }
}

if (extension_loaded('elastic_apm')) {
    $tx = ElasticApm::getCurrentTransaction();
    if ($tx instanceof Transaction) {
        printLine('Current Elastic APM transaction type: ' . $tx->type);
    } else {
        printLine('Type for value returned from ElasticApm::getCurrentTransaction(): ' . DbgUtil::getType($tx));
    }
} else {
    printLine('elastic_apm extension is not is loaded');
}

printLine('PHP version: ' . PHP_VERSION);

printLine('php_sapi_name(): ' . php_sapi_name());

if (array_key_exists('SERVER_SOFTWARE', $_SERVER)) {
    printLine('Server: ' . $_SERVER['SERVER_SOFTWARE']);
} else {
    printLine('$_SERVER does not have SERVER_SOFTWARE key');
}
