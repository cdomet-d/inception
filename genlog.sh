#!/bin/sh
#genlog.sh

docker compose logs nginx >check-nginx.log
docker compose logs mariadb >check-db.log
docker compose logs wordpress >check-wp.log
