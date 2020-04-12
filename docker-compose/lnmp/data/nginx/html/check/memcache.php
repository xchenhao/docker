<?php

$config = [
	'host' => 'memcached',
	'port' => 11211,
	'username' => '',
	'password' => '',
];

$mem = extension_loaded('memcached')
        ? new Memcached()
        : new Memcache();

$mem->addServer('memcached', 11211);
if ($config['username']) {
    $mem->setOption(Memcached::OPT_BINARY_PROTOCOL, true);
    $mem->setSaslAuthData($config['username'], $config['password']);
}

$key = 'testkey';
$value = 'testdata';

$data = $mem->get($key);
$mem->set($key, $value);
print_r($mem->get($key));
$mem->delete($key);
print_r($mem->get($key));
