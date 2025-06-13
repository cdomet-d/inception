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
	touch ~/docker-secrets/dump.sql
	@mkdir -p /home/cdomet-d/data/wp-data/
	@mkdir -p /home/cdomet-d/data/mdb-data/
	echo "UID=$$(id -u)" > ~/env-files/.env
	echo "GID=$$(id -g)" >> ~/env-files/.env
	docker compose -f ./srcs/docker-compose.yaml build

backup: setenv stop
	cat < ~/backup.sql > ~/docker-secrets/dump.sql


	docker compose -f ./srcs/docker-compose.yaml build

re: fclean all

reback: fclean backup

clean: stop
	rm -rf ./logs
	@docker system prune -f

fclean: clean
	rm -f ~/docker-secrets/dump.sql
	@rm -rf /home/cdomet-d/data/wp-data/*
	@rm -rf /home/cdomet-d/data/mdb-data/*
	@docker system prune -f -a

run: stop
	@docker compose -f ./srcs/docker-compose.yaml up -d
	@echo "Generating logs, please hold..."
	@sleep 2
	@sh genlog.sh

stop:
	@docker compose -f ./srcs/docker-compose.yaml stop
	@docker compose -f ./srcs/docker-compose.yaml down

setenv:
	sh setenv.sh

.PHONY: help all re clean fclean run stop backup reback