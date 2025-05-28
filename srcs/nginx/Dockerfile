FROM alpine:3.20
RUN apk add --update --no-cache nginx openssl \
	&& (getent group nginx || addgroup -S nginx) \
	&& (id -u nginx >/dev/null 2>&1 || adduser -S -G nginx nginx) \
	&& chown nginx:nginx /var/log/nginx

COPY ./conf/default.conf etc/nginx/http.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]