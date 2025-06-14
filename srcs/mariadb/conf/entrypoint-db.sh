#!/bin/sh
#db-init.sh
# shellcheck disable=SC3028

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

[ -s /run/secrets/db-root-pw ] || error "Empty or missing root password file"
[ -s /run/secrets/db-usr-pw ] || error "Empty or missing user password file"

ROOT_PW="$(cat /run/secrets/db-root-pw)"
USER_PW="$(cat /run/secrets/db-usr-pw)"

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

	cat <<-EOF
		MariaDB demon is up...
		Launching initialization script

	EOF

	mysql -u root <<-EOSQL || error "Failed to initialize table ${MYSQL_DATABASE}"
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

	EOF

	if [ -s /run/secrets/dump.sql ]; then
		cat <<-EOF
			Found database backup for $URL.
			Restoring...

		EOF
		mysql -u "${MYSQL_USER}" -p"$USER_PW" "${MYSQL_DATABASE}" </run/secrets/dump.sql

		cat <<-EOF
			Success: restored cdomet-d.42.fr

		EOF

	fi

	cat <<-EOF
		Killing mysqld...

	EOF

	mysqladmin -u root -p"$ROOT_PW" shutdown

	cat <<-EOF
		Success: configuration complete !
		Launching mysqld...

	EOF

else
	cat <<-EOF
		Database is ready.
		Launching mysqld...

	EOF
fi

exec su-exec "${UID}:${GID}" "$@"
