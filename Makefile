all: 
	docker compose build

re: fclean all

clean:
	docker system prune -f

make fclean:
	docker system prune -a --volumes

run: all
	docker compose up

stop:
	docker compose down