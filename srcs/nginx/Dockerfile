FROM alpine:3.20

ARG UID
ARG GID

ENV UID=$UID
ENV GID=$GID

RUN apk add --update --no-cache nginx openssl \
	&& addgroup -g ${GID} nginx-usr \
	&& adduser -D -u ${UID} -G nginx-usr nginx-usr \
	&& chown -R ${UID}:${GID} /var/log/nginx /var/lib/nginx /run/nginx

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

USER ${UID}:${GID}

CMD ["nginx", "-g", "daemon off;"]
