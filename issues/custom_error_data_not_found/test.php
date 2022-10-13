<?php

apcu_clear_cache();
opcache_reset();

class Example implements JsonSerializable {
    public function jsonSerialize()/* : mixed */
    {
        return 'test';
    }
}

(new Example())->jsonSerialize();
