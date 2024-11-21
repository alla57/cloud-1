#!/bin/sh

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
echo "user created"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
echo "privilges granted to user"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
echo "privilges granted to root"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
echo "user config done"
kill $(cat /var/run/mysqld/mysqld.pid)
echo "process blabla killed"
mysqld