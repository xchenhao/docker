#!/bin/sh

HTTP_CODE_NGINX=`curl -s -w %{http_code} -o /dev/null 127.0.0.1/check/index.html`
HTTP_CODE_PHP=`curl -s -w %{http_code} -o /dev/null 127.0.0.1/check/phpinfo.php`
HTTP_CODE_REDIS=`curl -s -w %{http_code} -o /dev/null 127.0.0.1/check/redis.php`
HTTP_CODE_MEMCACHE=`curl -s -w %{http_code} -o /dev/null 127.0.0.1/check/memcache.php`
HTTP_CODE_MARIADB=`curl -s -w %{http_code} -o /dev/null 127.0.0.1/check/mariadb.php`


if [ $HTTP_CODE_NGINX == '200' ]; then
	echo -e "nginx is ok\n\r" 
else
	echo -e "nginx is error\n\r"
fi


if [ $HTTP_CODE_PHP == 200 ]; then
	echo -e "php is ok\n\r"
else
	echo -e "php is error\n\r"
fi


if [ $HTTP_CODE_REDIS == 200 ]; then
	echo -e "redis is ok\n\r"
else
	echo -e "redis is error\n\r"
fi


if [ $HTTP_CODE_MEMCACHE == 200 ]; then
	echo -e "memcache is ok\n\r"
else
	echo -e "memcache is error\n\r"
fi


if [ $HTTP_CODE_MARIADB == 200 ]; then
	echo -e "mariadb is ok\n\r"
else
	echo -e "mariadb is error\n\r"
fi
