#!/bin/sh
# entrypoint-wp.sh

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

command -v curl >/dev/null 2>&1 || error "curl needed but not found"
command -v tar >/dev/null 2>&1 || error "tar needed but not found"
[ -s "$WP_ADMIN_PW" ] || error "Empty or missing wordpress admin password file"
[ -s "$WP_ADMIN_MAIL" ] || error "Empty or missing wordpress admin mail file"

echo "User is: $(whoami)"

WPPW="$(cat "$WP_ADMIN_PW")"
WPMAIL="$(cat "$WP_ADMIN_MAIL")"

if [ -z "$(ls -A /var/www/html)" ]; then
	cat <<-EOF
		Wordpress volume is empty. 
		Downloading Wordpress from https://wordpress.org/latest.tar.gz...
	EOF
	curl -sSfLO https://wordpress.org/latest.tar.gz || error "Failed to download Wordpress"
	curl -sSfLO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || error "Failed to download wp-cli"

	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

	cat <<-EOF
		Extracting latest.tar.gz into Wordpress volume [/var/www/html]
	EOF

	tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 || error "Failed to extract WordPress"

	cat <<-EOF
		Removing latest.tar.gz from $(pwd)
	EOF
	rm latest.tar.gz

	if ! wp core is-installed --path /var/www/html --allow-root; then
		wp core install --url=cdomet-d.42.fr --title="cdomet-d's blog" --admin_user=wpsu --admin_password="$WPPW" --admin_email="$WPMAIL" --path=/var/www/html --allow-root --skip-email
	fi

else
	cat <<-EOF
		Volume is already populated
		Exiting...
	EOF
fi

# $ wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com
exec "$@"
