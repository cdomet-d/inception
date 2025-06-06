all: stop
	@echo "UID=$$(id -u)" > .env
	@echo "GID=$$(id -g)" >> .env
	docker compose build

re: fclean all

clean: stop
	rm *.log
	@docker system prune -f

make fclean: stop
	@rm -rf /home/cdomet-d/data/wp-data/*
	@rm -rf /home/cdomet-d/data/mdb-data/*
	@docker system prune -f -a

run: stop
	@docker compose up -d

stop:
	@docker compose stop
	@docker compose down
