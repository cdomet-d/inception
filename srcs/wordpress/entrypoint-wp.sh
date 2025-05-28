#!/bin/sh
# entrypoint-wp.sh

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

command -v curl >/dev/null 2>&1 || error "curl needed but not found"
command -v tar >/dev/null 2>&1 || error "tar needed but not found"

echo "User is: $(whoami)"

if [ -z "$(ls -A /var/www/html)" ]; then
	cat <<-EOF
		Wordpress volume is empty. 
		Downloading Wordpress from https://wordpress.org/latest.tar.gz...
	EOF
	curl -fLO https://wordpress.org/latest.tar.gz || error "Failed to download Wordpress"

	cat <<-EOF
		Extracting latest.tar.gz into Wordpress volume [/var/www/html]
	EOF

	tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 || error "Failed to extract WordPress"

	cat <<-EOF
		Removing latest.tar.gz from $(pwd)
	EOF
	rm latest.tar.gz

	cat <<-EOF
		Wordpress files ready at /var/www/html
		$(ls /var/www/html)
	EOF
else
	cat <<-EOF
		Volume is already populated
		Exiting...
	EOF
fi

exec "$@"
