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

		No MariaDB installation found.
		Running MariaDB installation...

	EOF

	mariadb-install-db \
		--user="${UID}" \
		--datadir=/var/lib/mysql >/var/log/mysql/mariadb-install.log ||
		error "During maria-db initialisation"

	cat <<-EOF

		Successfully installed MariaDB

	EOF

	su-exec "${UID}:${GID}" mysqld &

	until mysqladmin ping -h "localhost" --silent; do
		sleep 1
	done

	mysql -u root <<-EOSQL 2>&1 >/dev/null
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

	cat <<-EOF

		Success: initialized table ${MYSQL_DATABASE}
		Success: created database user ${MYSQL_USER}
		Restoring website database...

	EOF

	mysql -u "${MYSQL_USER}" -p"$USER_PW" "${MYSQL_DATABASE}" </utils/dump.sql

	cat <<-EOF

		Success: restored cdomet-d.42.fr
		Killing mysqld...

	EOF

	mysqladmin -u root -p"$ROOT_PW" shutdown
	cat <<-EOF

		Success: configuration complete !
		Launching mysqld...

	EOF

fi

cat <<-EOF

	Database is ready.
	Launching mysqld...

EOF

exec su-exec "${UID}:${GID}" "$@"
