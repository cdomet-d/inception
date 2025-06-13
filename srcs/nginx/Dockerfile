FROM alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

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
