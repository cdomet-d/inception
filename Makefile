all: 
	docker compose build

re: fclean all

clean:
	docker system prune -f

make fclean: stop
	@docker system prune -f -a --volumes
	@docker volume ls -q | xargs docker volume rm

run:
	docker compose up

stop:
	docker compose stop
	docker compose down

wpinstall:
	docker compose stop wp
	docker compose rm wp
	docker volume rm inception_wp-data
	docker compose up -d --build --force-recreate wp 

dbinstall : fclean all
	docker compose run --rm -it db sh