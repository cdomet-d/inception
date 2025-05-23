FROM alpine:3.20
RUN apk add --update --no-cache curl
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/sh"]
