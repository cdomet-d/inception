#!/bin/ash
#db-init.sh

set -e

if [ -z "$(ls -A /var/lib/mysql)" ]; then
	cat <<- EOF

		Running MariaDB initialization...

	EOF

	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	mysqld --user=mysql --bootstrap <<- EOSQL
	UPDATE mysql.user SET Password=PASSWORD($(cat $MYSQL_ROOT_PASSWORD_FILE))
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
	DROP DATABASE IF EXISTS 'test'
	CREATE DATABASE IF NOT EXISTS wordpress;
	CREATE USER IF NOT EXISTS 'wp-manager'@'%' IDENTIFIED BY '$(cat $MYSQL_PASSWORD_FILE)';
	GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-manager'@'%;
	FLUSH PRIVILEGES;

EOSQL

fi

cat <<- EOF

	Successfully created database WORDPRESS
	Succressfully create user WP-MANAGER

EOF

exec "$@"
