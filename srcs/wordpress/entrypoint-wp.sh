#!/bin/sh
# entrypoint-wp.sh

set -eu

error() {
	echo "FATAL: $*" >&2
	exit 1
}

command -v curl >/dev/null 2>&1 || error "curl needed but not found"
command -v tar >/dev/null 2>&1 || error "tar needed but not found"

[ -s "$WORDPRESS_DB_PASSWORD" ] || error "Empty or missing database user password file"
[ -s "$WP_ADMIN_MAIL" ] || error "Empty or missing wordpress admin mail file"
[ -s "$WP_ADMIN_PW" ] || error "Empty or missing wordpress admin password file"
[ -s "$WP_USR_PW" ] || error "Empty or missing wordpress user password file"

WP_ADMIN_PW="$(cat "$WP_ADMIN_PW")"
WP_USR_PW="$(cat "$WP_USR_PW")"
WP_ADMIN_MAIL="$(cat "$WP_ADMIN_MAIL")"
WP_DB_PW="$(cat "$WORDPRESS_DB_PASSWORD")"

if [ -z "$(ls -A /var/www/html)" ]; then
	cat <<-EOF
		Wordpress volume is empty. 
		Downloading Wordpress from https://wordpress.org/latest.tar.gz...
	EOF

	curl -sSfLo /home/utils/wp/latest.tar.gz https://wordpress.org/latest.tar.gz || error "Failed to download Wordpress"
	curl -sSfLo /home/utils/wp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || error "Failed to download wp-cli"


	chmod +x /home/utils/wp/wp-cli.phar

	cat <<-EOF
		Extracting latest.tar.gz into Wordpress volume [/var/www/html]
	EOF

	tar -xvzf /home/utils/wp/latest.tar.gz -C /var/www/html --strip-components=1 || error "Failed to extract WordPress"

	cat <<-EOF
		Removing latest.tar.gz
	EOF
	rm /home/utils/wp/latest.tar.gz

	wp config create \
		--path=/var/www/html \
		--dbhost="${WORDPRESS_DB_HOST}" \
		--dbname="${WORDPRESS_DB_NAME}" \
		--dbuser="${WORDPRESS_DB_USER}" \
		--dbpass="${WP_DB_PW}"

	if ! wp core is-installed --path=/var/www/html --allow-root; then

		wp core install \
			--path=/var/www/html \
			--url=cdomet-d.42.fr \
			--title="cdomet-d's blog" \
			--admin_email="$WP_ADMIN_MAIL" \
			--admin_user=wpsu --admin_password="$WP_ADMIN_PW" \
			--allow-root \
			--skip-email

		wp user create serendipity serendipity@example.fr \
		--role=author \
		--user_pass="$WP_USR_PW" \
		--display_name=Serendipity \
		--path=/var/www/html \
		--allow-root
	fi

else
	cat <<-EOF
		Volume is already populated
		Exiting...
	EOF
fi

exec "$@"
