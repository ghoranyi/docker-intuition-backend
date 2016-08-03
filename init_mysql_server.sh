#! /bin/bash

service mysql start
mysql -uroot -e "UPDATE mysql.user SET Password=PASSWORD('containerstoragepassword') WHERE User='root'; FLUSH PRIVILEGES;"
mysql -uroot -pcontainerstoragepassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'containerstoragepassword'; FLUSH PRIVILEGES;"
mysql -uroot -pcontainerstoragepassword -e "CREATE DATABASE containerstorage"

sleep 5

service mysql restart
