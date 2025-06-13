help:
	@echo "Welcome to Inception!"
	@echo
	@echo "Make Rules:"
	@echo
	@echo "	all      create default images (docker compose build)"
	@echo "	backup   create images based on a database dump"
	@echo "	         the dump file should be named dump.sql and placed at the root"
	@echo "	         of the user's session"
	@echo "	re       rebuild all the containers with default configuration"
	@echo "	         after deleting the local volumes"
	@echo "	reback   rebuild all the containers with database dump configuration"
	@echo "	         after deleting the local volumes"
	@echo "	clean    stop containers, removes logs, stopped containers, dangling"
	@echo "	         images and unused networks & build cache"
	@echo "	fclean   same as clean, except it also deletes all the cache & all images"
	@echo "	         without a container associated and the content of the volumes"
	@echo "	run      ups the containers in detached mode (docker compose up -d) and"
	@echo "	         generates the logs"
	@echo "	stop     stops & downs containers"

all: setenv stop
	@sh .scripts/check-volumes.sh
	@echo
	@echo "[INFO] Building vanilla images..."
	@echo
	@docker compose -f ./srcs/docker-compose.yaml build

backup: setenv stop
	@sh .scripts/check-volumes.sh
	@echo "[INFO] Importing database backup..."
	@echo
	@cat < ~/backup.sql > ~/docker-secrets/dump.sql
	@echo "[INFO] Building images from database backup..."
	@echo
	@docker compose -f ./srcs/docker-compose.yaml build

re: fclean all

reback: fclean backup

clean: stop
	@echo "[INFO] Removing stale logs..."
	@echo
	@rm -rf ./logs
	@docker system prune -f

fclean: clean
	@echo "[INFO] Removing database backup..."
	@rm -f /home/cdomet-d/docker-secrets/dump.sql
	@echo "[INFO] Removing wordpress volume..."
	@rm -rf /home/cdomet-d/data/wp-data/*
	@echo "[INFO] Removing database volume..."
	@echo
	@rm -rf /home/cdomet-d/data/mdb-data/*
	@docker system prune -f -a

run: stop
	@docker compose -f ./srcs/docker-compose.yaml up -d
	@echo "Generating logs, please hold..."
	@sleep 2
	@sh .scripts/genlog.sh

stop:
	@docker compose -f ./srcs/docker-compose.yaml stop
	@docker compose -f ./srcs/docker-compose.yaml down

setenv:
	@echo
	@echo "[INFO] Running environnement deployment script..."
	@echo
	@sh .scripts/setenv.sh

.PHONY: help all re clean fclean run stop backup reback