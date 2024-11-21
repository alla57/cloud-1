all:
	@sudo mkdir -p /home/alboumed/data/mariadb_volume /home/alboumed/data/wp_volume
	@sudo docker compose -f ./srcs/docker-compose.yml up --build
	
restart:
	@sudo docker compose -f ./srcs/docker-compose.yml stop
	@sudo docker compose -f ./srcs/docker-compose.yml start

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml stop
	@sudo docker compose -f ./srcs/docker-compose.yml rm
	@sudo docker volume rm mariadb_volume wp_volume
	@sudo sudo rm -rf /home/alboumed/data
	@sudo docker rmi -f $$(sudo docker images -aq)

re: clean all

.PHONY: all clean fclean re