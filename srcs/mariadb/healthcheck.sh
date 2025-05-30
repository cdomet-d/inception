#!/bin/sh
# MariaDB healthcheck

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}
echo "$MYSQL_USER"
echo "$MYSQL_PASSWORD_FILE"

[ -s "$MYSQL_PASSWORD_FILE" ] || error "Missing or empty database user password file"


mysql --host=localhost --user="$MYSQL_USER" --password="$(cat "$MYSQL_PASSWORD_FILE")" --database="$MYSQL_DATABASE" -e 'SELECT 1'

