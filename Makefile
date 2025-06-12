all: stop
	@echo "UID=$$(id -u)" > .env
	@echo "GID=$$(id -g)" >> .env
	@echo "DB_DUMP="
	docker compose build

re: fclean all

clean: stop
	@rm -f .env
	@docker system prune -f

fclean: stop
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
	@rm -rf ./logs; 
