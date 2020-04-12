<?php

$dbhost = 'mariadb';
$dbport = 3306;
//$dbname = 'hello';
$dbname = 'mysql';
$dbuser = 'root';
$dbpass = '123456'; 

// 连接
try {
    $db = new PDO('mysql:host='.$dbhost.';port='.$dbport.';dbname='.$dbname, $dbuser, $dbpass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //设置错误模式
    $db->query('SET NAMES utf8;');
    echo 'The connection is successful.';
} catch(PDOException $e) {
    throw $e;
    //echo '{"result":"failed", "msg":"连接数据库失败！"}';
    //exit;
}

