<?php

class Example implements JsonSerializable {
public function jsonSerialize()/* : mixed */
{
return 'test';
}
}

(new Example())->jsonSerialize();
