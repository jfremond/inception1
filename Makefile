# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 02:09:35 by jfremond          #+#    #+#              #
#    Updated: 2023/06/27 09:22:37 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

############
#   NAME   #
############

NAME			=	inception

################
#   COMMANDS   #
################

DOCKER_CMD		=	docker compose
DOCKER_OPT		=	-f
DOCKER_FILE		=	./srcs/docker-compose.yml
DOCKER_COMPOSE	=	$(DOCKER_CMD) $(DOCKER_OPT) $(DOCKER_FILE)

###############
#   FOLDERS   #
###############

WP_VOLUME	=	~/jfremond/data/wordpress
DB_VOLUME	=	~/jfremond/data/mariadb

##############
#   COLORS   #
##############

CYAN			=	\033[0;36m
PURPLE			=	\033[0;35m
ORANGE			=	\033[38;2;255;165;0m
RESET			=	\033[0m

#############
#   RULES   #
#############

$(NAME):	all

all:
			# @bash tools/create_folder.sh
			@sudo mkdir -p $(WP_VOLUME)
			@sudo mkdir -p $(DB_VOLUME)
			@sudo chmod 777 $(WP_VOLUME)
			@sudo chmod 777 $(DB_VOLUME)
			@$(MAKE) build
			@$(MAKE) create
			@$(MAKE) start

clean:
			$(DOCKER_COMPOSE) down --rmi all

fclean:
			$(DOCKER_COMPOSE) down --rmi all --volumes
			sudo rm -rf $(DATA_FOLDER)
			$(MAKE) prune

re:			clean all

fre:		fclean all

build:
			$(DOCKER_COMPOSE) build $(c)

create:
			$(DOCKER_COMPOSE) create $(c)

start:
			$(DOCKER_COMPOSE) start $(c)

stop:
			$(DOCKER_COMPOSE) stop $(c)

ps:
			$(DOCKER_COMPOSE) ps --all

images:
			$(DOCKER_COMPOSE) images

prune:
			docker system prune -af

help:
			@echo ""
			@echo "$(CYAN)---------------------------------------- MAKE ----------------------------------------$(RESET)"
			@echo "$(CYAN)make/make all$(RESET)	->	Calls build, create, and start"
			@echo "$(CYAN)make clean$(RESET)	->	Stop containers, removes them with their volumes"
			@echo "$(CYAN)make fclean$(RESET)	->	Stop containers, removes them with their volumes and images"
			@echo "$(CYAN)make re$(RESET)		->	Calls clean and all"
			@echo "$(CYAN)make fre$(RESET)	->	Calls fclean and all"
			@echo ""
			@echo "$(PURPLE)---------------------------------------- ARGS ----------------------------------------$(RESET)"
			@echo "\t\tUse c=<container name> to apply to one container only"
			@echo "$(PURPLE)make build$(RESET)	->	Build services from their Dockerfiles"
			@echo "$(PURPLE)make create$(RESET)	->	Create services"
			@echo "$(PURPLE)make start$(RESET)	->	Start services"
			@echo "$(PURPLE)make stop$(RESET)	->	Stop running containers without removing them"
			@echo ""
			@echo "$(ORANGE)---------------------------------------- LIST ----------------------------------------$(RESET)"
			@echo "$(ORANGE)make ps$(RESET)		->	List containers for the project"
			@echo "$(ORANGE)make images$(RESET)	->	List images used by the containers"
			@echo ""

.PHONY:		all clean fclean re fre build create start stop ps images prune help
