FROM alpine:3.20
RUN apk add --update --no-cache curl \
	php83-cli \
	php83-phar \
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

WORKDIR /home/www-data

COPY www.conf /etc/php83/php-fpm.d/www.conf
COPY entrypoint-wp.sh /home/data/entrypoint-wp.sh

RUN chown www-data:www-data /home/data/entrypoint-wp.sh && chmod 700 /home/data/entrypoint-wp.sh

ENTRYPOINT ["/home/data/entrypoint-wp.sh"]

# USER www-data

CMD ["php-fpm83", "-F"]
