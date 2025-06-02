#!/bin/sh
# MariaDB healthcheck

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

[ -s "$MYSQL_PASSWORD_FILE" ] || error "Missing or empty database user password file"
DBPW="$(cat "$MYSQL_PASSWORD_FILE")"
mysql --host=localhost --user="$MYSQL_USER" --password="$DBPW" --database="$MYSQL_DATABASE" -e 'SELECT 1'
