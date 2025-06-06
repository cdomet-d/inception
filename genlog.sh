#!/bin/sh
#genlog.sh

docker compose logs | grep nginx >check-nginx.log
docker compose logs | grep mariadb >check-db.log
docker compose logs | grep wordpress >check-wp.log
