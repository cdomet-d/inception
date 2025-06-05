all: stop
	@echo "UID=$$(id -u)" > .env
	@echo "GID=$$(id -g)" >> .env
	docker compose build

re: fclean all run

clean:
	docker system prune -f

make fclean: stop
	rm -rf /home/cdomet-d/data/wp-data/*
	rm -rf /home/cdomet-d/data/mdb-data/*
	@docker system prune -f -a

run: all
	docker compose up -d

stop:
	docker compose stop
	docker compose down
