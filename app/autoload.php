<?php

$loader = require __DIR__.'/../vendor/autoload.php';

//oader->add('Cerad', __DIR__  . '/../../cerad/src');
$loader->add('Cerad', __DIR__ . '/../..',true);

return $loader;
