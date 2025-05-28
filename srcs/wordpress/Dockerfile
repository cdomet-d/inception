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
	php-opcache \
	&& getent group www-data || addgroup -S www-data \
	&& adduser -S -G www-data www-data \
	&& mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html \
	&& chown -R www-data:www-data /var/log/php83

COPY entrypoint-wp.sh /entrypoint-wp.sh

RUN chown www-data:www-data /entrypoint-wp.sh && chmod 700 /entrypoint-wp.sh

USER www-data

ENTRYPOINT ["/entrypoint-wp.sh"]

CMD ["php-fpm83", "-F"]
