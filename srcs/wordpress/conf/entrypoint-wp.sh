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
		Installing CLI from https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar...

	EOF

	curl -sSfLo /home/www-usr/utils/wp/latest.tar.gz https://wordpress.org/latest.tar.gz || error "Failed to download Wordpress"
	curl -sSfLo /home/www-usr/utils/wp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || error "Failed to download wp-cli"
	chmod +x /home/www-usr/utils/wp/wp-cli.phar &&
		mv /home/www-usr/utils/wp/wp-cli.phar /home/www-usr/utils/wp/wp

	tar -xvzf /home/www-usr/utils/wp/latest.tar.gz \
		-C /var/www/html \
		--strip-components=1 >/dev/null || error "Failed to extract WordPress"

	echo "Removing latest.tar.gz"
	rm /home/www-usr/utils/wp/latest.tar.gz

	cat <<-EOF

		Installation successfull. Deploying WordPress site...
	EOF

	mv /home/www-usr/utils/wp/bjork /var/www/html/wp-content/themes
	mv /home/www-usr/utils/wp/embed-github /var/www/html/wp-content/plugins
	mv /home/www-usr/utils/wp/uploads /var/www/html/wp-content/uploads

	cat <<-EOF

		Success: theme imported.
		Creating configuration...

	EOF

	cd /var/www/html
	wp config create \
		--dbhost="${WORDPRESS_DB_HOST}" \
		--dbname="${WORDPRESS_DB_NAME}" \
		--dbuser="${WORDPRESS_DB_USER}" \
		--dbpass="${WP_DB_PW}" \
		--extra-php <<-PHP
			if ( defined ('WP_CLI' ) && WP_CLI && ! isset( \$_SERVER['HTTP_HOST'] ) ) {
				\$_SERVER['HTTP_HOST'] = 'localhost';
			}
		PHP

	wp theme delete --all
	wp plugin list --status=inactive --field=name | xargs wp plugin delete

	cat <<-EOF

		Success: configuration complete !
		Launching php-fpm83...

	EOF

else
	cat <<-EOF

		WordPress site is ready.
		Launching php-fpm83...

	EOF
fi

exec "$@"
