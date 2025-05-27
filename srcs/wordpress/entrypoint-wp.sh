#!/bin/sh
# entrypoint-wp.sh

set -eu

if [ -z "$(ls -A /var/www/html)" ]; then
	cat <<- EOF
		Wordpress volume is empty. 
		Downloading Wordpress from https://wordpress.org/latest.tar.gz...
	EOF
	curl -O https://wordpress.org/latest.tar.gz;

	cat <<- EOF
		Extracting latest.tar.gz into Wordpress volume [/var/www/html]
	EOF

	tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1;

	cat <<- EOF
		Removing latest.tar.gz from $(pwd)
	EOF
	rm latest.tar.gz

	cat <<- EOF
		Wordpress files ready at /var/www/html
		# $(ls /var/www/html)
	EOF
	else
		cat <<- EOF
		Volume is already populated
		Exiting...
	EOF
fi

exec "$@"