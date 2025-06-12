FROM alpine:3.20

ARG UID
ARG GID

ENV UID=$UID GID=$GID

RUN apk add --update --no-cache mariadb mariadb-client su-exec \
	&& addgroup -g ${GID} sql-usr \
	&& adduser -D -u ${UID} -G sql-usr sql-usr \
	&& mkdir -p /utils /run/mysqld /var/log/mysql /var/lib/mysql \
	&& chown -R ${UID}:${GID} /run/mysqld /var/lib/mysql /var/log/mysql

COPY ./conf/entrypoint-db.sh ./conf/healthcheck.sh /utils/
COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chown ${UID}:${GID} /utils/entrypoint-db.sh /utils/healthcheck.sh \
	&& chmod 700 /utils/entrypoint-db.sh /utils/healthcheck.sh

EXPOSE 3306

ENTRYPOINT ["/utils/entrypoint-db.sh"]

CMD ["mysqld"]