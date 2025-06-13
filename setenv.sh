#!/bin/sh
#setenv.sh

WORKDIR=$(pwd)

if [ ! -d /home/data/wp-data ]; then
	mkdir -p /home/cdomet-d/data/wp-data/
fi

if [ ! -d /home/data/wp-data ]; then
	mkdir -p /home/cdomet-d/data/mdb-data/
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
