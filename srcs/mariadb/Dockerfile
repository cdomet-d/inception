FROM alpine:3.20

ARG UID
ARG GID

ENV UID=$UID GID=$GID

RUN apk add --update --no-cache mariadb mariadb-client su-exec \
	&&	addgroup -g ${GID} sql-usr \
	&& adduser -D -u ${UID} -G sql-usr sql-usr

COPY entrypoint-db.sh /entrypoint-db.sh
COPY healthcheck.sh /healthcheck.sh
COPY my.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chown ${UID}:${GID} /entrypoint-db.sh && chmod 700 /entrypoint-db.sh \
 	&& chown ${UID}:${GID} /healthcheck.sh && chmod 700 /healthcheck.sh \
	&& mkdir -p /run/mysqld /var/log/mysql /var/lib/mysql \
	&& chown -R ${UID}:${GID} /run/mysqld /var/lib/mysql /var/log/mysql

EXPOSE 3306

ENTRYPOINT ["/entrypoint-db.sh"]

CMD ["mysqld", "--user=${UID}"]
