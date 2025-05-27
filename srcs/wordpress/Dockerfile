FROM alpine:3.20
RUN apk add --update --no-cache \
	curl \
	# Fast CGI for PHP
	php-fpm \
	# Enables MariaDB support
	php-mysqli \
	# Handles json
	php-json \
	# Allows the CGI to make http requests
	php-curl \
	# Allows image manipulation
	php-gd \
	# Allows XML parsing
	php-xml \
	# Multibytes string support (for non-ASCII chars support)
	php-mbstring \
	# Allows .zip file handling
	php-zip \
	# Performance optimisation cache
	php-opcache
COPY entrypoint-wp.sh /entrypoint-wp.sh
ENTRYPOINT ["/entrypoint-wp.sh"]
CMD ["php-fpm83", "-F"]
