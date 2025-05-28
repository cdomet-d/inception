FROM alpine:3.20
RUN apk add --update --no-cache mariadb \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY entrypoint-db.sh /entrypoint-db.sh
RUN chown mysql:mysql /entrypoint-db.sh && chmod 700 /entrypoint-db.sh

EXPOSE 3306

ENTRYPOINT ["/entrypoint-db.sh"]
USER mysql
CMD ["mysqld", "--user=mysql"]