#!/bin/sh
#genlog.sh

mkdir -p ./logs

docker compose logs nginx >./logs/check-nginx.log
docker compose logs mariadb >./logs/check-db.log
docker compose logs wordpress >./logs/check-wp.log
