#!/bin/sh
# MariaDB healthcheck

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

[ -s /run/secrets/db-usr-pw ] || error "Missing or empty database user password file"

DBPW="$(cat /run/secrets/db-usr-pw)"

mysql --host=localhost --user="$MYSQL_USER" --password="$DBPW" --database="$MYSQL_DATABASE" -e 'SELECT 1'
