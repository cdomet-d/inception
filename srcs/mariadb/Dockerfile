FROM alpine:3.20
RUN apk add --update --no-cache mariadb mariadb-client \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY entrypoint-db.sh /entrypoint-db.sh
COPY healthcheck.sh /healthcheck.sh
COPY my.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chown mysql:mysql /entrypoint-db.sh && chmod 700 /entrypoint-db.sh \
&& chown mysql:mysql /healthcheck.sh && chmod 700 /healthcheck.sh

EXPOSE 3306

ENTRYPOINT ["/entrypoint-db.sh"]
CMD ["mysqld", "--user=mysql"]