FROM alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

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