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
	echo "Running MariaDB initialization..."

	mariadb-install-db \
	--user="${UID}" \
	--datadir=/var/lib/mysql > /var/log/mysql/mariadb-install.log \
	|| error "During maria-db initialisation"

	echo "MariaDB init complete"

	su-exec "${UID}:${GID}" mysqld &

	sleep 5

	mysql -u root <<-EOSQL 2>&1 > /dev/null
		-- set root password
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PW}';
		-- remove any anonymous users
		DELETE FROM mysql.user WHERE User='';
		-- remove remote root access
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
		-- delete default database test
		DROP DATABASE IF EXISTS test;
		-- creating wp database & user from env and grants the user all priviledges
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${USER_PW}';
		GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
		-- immediatly applies newly set priviledges
		FLUSH PRIVILEGES;
	EOSQL

	echo "Finished bootstrap"

	mysqladmin -u root -p"$ROOT_PW" shutdown

	cat <<-EOF

		Sucessfully initialized ${MYSQL_DATABASE}
		Successfully created user ${MYSQL_USER}

	EOF

fi

exec su-exec "${UID}:${GID}" "$@"
