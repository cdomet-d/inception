#!/bin/sh
#genlog.sh

mkdir -p ./logs

docker compose -f ./srcs/docker-compose.yaml logs nginx >./logs/check-nginx.log
docker compose -f ./srcs/docker-compose.yaml logs mariadb >./logs/check-db.log
docker compose -f ./srcs/docker-compose.yaml logs wordpress >./logs/check-wp.log