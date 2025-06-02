all: 
	docker compose build

re: fclean all

clean:
	docker system prune -f

make fclean: stop
	doas rm -rf /home/cdomet-d/data
	@docker system prune -f -a

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