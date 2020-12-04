#!/bin/sh

while [ TRUE ]
do
    echo "---------------------------------------------------"
#    curl http://127.0.0.1/a.php
    curl 192.168.99.100:34567/a.php
    sleep 5
done

