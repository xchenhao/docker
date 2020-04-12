<?php
$redis = new Redis();
$redis->connect('redis', 6379);
$redis->auth('123456');
echo "The connection is successfu. 
";

echo "Server is running: " . $redis->ping();
