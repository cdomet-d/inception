FROM alpine:3.20
ARG UID
ARG GID

ENV UID=$UID
ENV GID=$GID

RUN apk add --update --no-cache curl php83-cli php83-phar php-fpm \
	php-mysqli php-json	php-curl php-gd php-xml php-mbstring php-zip \
	php-opcache \
	&& addgroup -g ${GID} www-usr \
	&& adduser -D -u ${UID} -G www-usr www-usr \
	&& mkdir -p /var/www/html /home/utils/wp

COPY www.conf /etc/php83/php-fpm.d/www.conf
COPY entrypoint-wp.sh /home/utils/wp/entrypoint-wp.sh

RUN chown ${UID}:${GID} /home/utils/wp/entrypoint-wp.sh \
	&& chmod 700 /home/utils/wp/entrypoint-wp.sh \
	&& chown -R ${UID}:${GID} /var/www/html /var/log/php83 /home/utils/wp

ENTRYPOINT ["/home/utils/wp/entrypoint-wp.sh"]

USER ${UID}:${GID}

CMD ["php-fpm83", "-F"]