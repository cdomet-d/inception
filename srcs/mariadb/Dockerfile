FROM alpine:3.20
RUN apk add --update --no-cache mariadb
RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld /var/lib/mysql
COPY entrypoint-db.sh /entrypoint-db.sh

CMD ["mysqld", "--user=mysql"]