FROM alpine:3.20
RUN apk add --update --no-cache nginx \
	openssl
COPY ./conf/default.conf etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]