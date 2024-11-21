#!/bin/bash

# Allow the script to stop immediately if any command fails
set -e

# Initialize database if necessary
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mysqld --initialize-insecure
fi

# Start mysql server in the background
mysqld_safe --skip-grant-tables &

# Wait for MySQL to start
echo "Waiting for MySQL to start..."
until mysqladmin ping --silent; do
    sleep 1
done

# Create a database and user if they don't exist
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-root}  # Default root password if not provided
MYSQL_USER=${MYSQL_USER:-newuser}                 # Default user if not provided
MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}       # Default password if not provided
MYSQL_DATABASE=${MYSQL_DATABASE:-newdatabase}    # Default database if not provided

echo "Creating database: $MYSQL_DATABASE"
echo "Creating user: $MYSQL_USER with password: $MYSQL_PASSWORD"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Start mysql server
exec "$@"