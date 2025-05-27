#!/bin/sh
#db-init.sh

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

[ -s "$MYSQL_ROOT_PASSWORD_FILE" ] || error "Empty or missing root password file"
[ -s "$MYSQL_PASSWORD_FILE" ] || error "Empty or missing user password file"

ROOT_PW="$(cat "$MYSQL_ROOT_PASSWORD_FILE")"
USER_PW="$(cat "$MYSQL_PASSWORD_FILE")"

if [ -z "$(ls -A /var/lib/mysql)" ]; then
	cat <<-EOF

		Running MariaDB initialization...

	EOF

	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

	mysqld --user=mysql --bootstrap <<-EOSQL
		-- set root password
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PW}'
		-- remove any anonymous users
		DELETE FROM mysql.user WHERE User='';
		-- remove remote root access
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
		-- delete default database test
		DROP DATABASE IF EXISTS test
		-- creating wp database & user from env
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '${USER_PW}';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'wp-manager'@'%;
		-- immediatly applies newly set priviledges
		FLUSH PRIVILEGES;

	EOSQL

	cat <<-EOF

		Sucessfully initialized ${MYSQL_DATABASE}
		Successfully created user ${MYSQL_USER}

	EOF

fi

exec "$@"
