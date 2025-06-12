FROM alpine:3.20
ARG UID
ARG GID

ENV UID=$UID
ENV GID=$GID
ENV PATH="/home/www-usr/utils/wp:${PATH}"

RUN apk add --update --no-cache findutils curl php83-cli php83-phar php-fpm \
	php-mysqli php-json	php-curl php-gd php-xml php-mbstring php-zip \
	php-opcache \
	&& addgroup -g ${GID} www-usr \
	&& adduser -D -u ${UID} -G www-usr www-usr \
	&& mkdir -p /var/www/html /home/www-usr/utils/wp

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY ./conf/entrypoint-wp.sh /home/www-usr/utils/wp
COPY ./wp-restore/bjork /home/www-usr/utils/wp/bjork
COPY ./wp-restore/embed-github /home/www-usr/utils/wp/embed-github
COPY ./wp-restore/uploads /home/www-usr/utils/wp/uploads

RUN chown -R ${UID}:${GID} /home/www-usr/utils/wp/ /var/www/html/ /var/log/php83 \
	&& chmod 700 /home/www-usr/utils/wp/entrypoint-wp.sh

ENTRYPOINT ["/home/www-usr/utils/wp/entrypoint-wp.sh"]

USER ${UID}:${GID}

CMD ["php-fpm83", "-F"]