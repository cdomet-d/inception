
help:
	@echo "Welcome to Inception!"
	@echo
	@echo "Make Rules:"

	@echo "	all 	create the images (docker compose build)"
	@echo "	re 	rebuild all the containers after deleting the local volumes"
	@echo "	clean	stop containers, removes logs, stopped containers, dangling"
	@echo "		images and unused networks & build cache"
	@echo "	fclean	same as clean, except it also deletes all the cache & all images"
	@echo "		without a container associated and the content of the volumes"
	@echo "	run	ups the containers in detached mode(docker compose up -d)and"
	@echo "		generates the logs"
	@echo "	stop	stops & downs containers"
	@echo
	@echo "By default, I am restoring a default WordPress site!"
	@echo "If you want to restore your own, simply replace the file at"
	@echo "~/docker/secrets/dump.sql with your own database dump, or just remove"
	@echo "it to have a blank WordPress website"

all: stop
	@mkdir -p /home/cdomet-d/data/wp-data/
	@mkdir -p /home/cdomet-d/data/mdb-data/
	@echo "UID=$$(id -u)" > .env
	@echo "GID=$$(id -g)" >> .env
	docker compose build

re: fclean all

clean: stop
	rm -rf ./logs
	@docker system prune -f

fclean: clean
	@rm -rf /home/cdomet-d/data/wp-data/*
	@rm -rf /home/cdomet-d/data/mdb-data/*
	@docker system prune -f -a

run: stop
	@docker compose up -d
	@echo "Generating logs, please hold..."
	@sleep 5
	@sh genlog.sh

stop:
	@docker compose stop
	@docker compose down

.PHONY: help all re clean fclean run stop