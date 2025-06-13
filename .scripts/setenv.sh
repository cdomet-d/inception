#!/bin/sh
#setenv.sh

WORKDIR=$(pwd)

if [ ! -f /home/"${USER}"/docker-secrets/dump.sql ]; then
	touch ~/docker-secrets/dump.sql
fi

if [ ! -d /home/"${USER}"/data/wp-data ]; then
	mkdir -p /home/"${USER}"/data/wp-data/
fi

if [ ! -d /home/"${USER}"/data/wp-data ]; then
	mkdir -p /home/"${USER}"/data/mdb-data/
fi

if [ ! -s "$WORKDIR"/srcs/wordpress/wp.env ]; then
	echo "[INFO] Importing wordpress environement"
	cp ~/env-files/wp.env "$WORKDIR"/srcs/wordpress/
fi

if [ ! -s "$WORKDIR"/srcs/mariadb/db.env ]; then
	echo "[INFO] Importing mariadb environement"
	cp ~/env-files/db.env "$WORKDIR"/srcs/mariadb/
fi

if [ ! -s "$WORKDIR"/srcs/.env ]; then
	echo "[INFO] Exporting host user UID:GID in .env"

	echo "UID=$(id -u)" >~/env-files/.env
	echo "GID=$(id -g)" >>~/env-files/.env

	echo "[INFO] Importing default environement"

	cp ~/env-files/.env "$WORKDIR"/srcs
fi
