# LINUX FILESYSTEM
- / (Root) (Parent directory)
- /bin (essential user command binaries)
- /boot (files required for starting the system)
- /dev (device files, ex: when you plug a USB drive)
- /etc (configuration files for the system)
- /home (user home directories)
- /lib (librairies and kernel modules)
- /media (where external storage is mounted when you plug it in and try to access it)
- /mnt (mount files for temporary filesystems)
- /opt (optional software applications)
- /proc (information about processes)
- /root (home directory fot the root user)
- /run (stores runtime information before /var/run is mounted)
- /sbin (essential system binaries)
- /usr (applications only the superuser will need)
- /srv (data for servers)
- /sys (information about hardware)
- /tmp (temporary files)
- /var (files of variable size (files expected to grow to very large sizes))

# PID 1
- Mostly known as "init". It is the first Linux user-mode process created, which runs until the system shuts down. init manages the services (called daemons under Linux).
- If you run an application inside a Docker container, it will be assigned PID 1.

# BEST PRACTICES FOR WRITING DOCKERFILES
- Use the official Docker image
- Limit the amount of RUN (more RUN more cacheable units, more cache)
- Use specific tags (alpine:3.17.3)
- Use multi-stage builds (more than one FROM in the Dockerfile)

# PROJECT OVERVIEW
## HOW DOES DOCKER WORK?
- Docker est un logiciel qui permet de gérer des containers. Un container contient tout le code et les dépendances nécéssaires afin que l'application s'exécute rapidement et de manière fiable dans différents OS.
Avantages Docker : 
	- Portabilité : Les containers peuvent être déployés sur n'importe quel OS qui prend en charge Docker.
	- Isolation : Chaque container est isolé des autres, chaque container à ses propres fichiers, ressources, et processus. 

## HOW DOES DOCKER-COMPOSE WORK?
docker-compose fonctionne en lisant sur un fichier YAML (docker-compose.yml) pour définir et exécuter des applications Docker composées de plusieurs containers

## WHAT IS THE DIFFERENCE BETWEEN A DOCKER IMAGE USED W/ DOCKER-COMPOSE AND W/OUT IT?
- Sans docker-compose, chaque container est configuré, exécuté, et géré sépararément.
- docker-compose permet de gérér et d'orchester des applications multi-containers grace au ficher YAML. De plus, on peut démmarrer plusieurs containers à la fois grâce à docker-compose.

## WHAT IS THE BENEFIT OF DOCKER COMPARED TO WMs?
- Les ressources sont partagées avec la machine hôte, ce qui permet de lancer beaucoup de containers contre peu de VMs.
- Docker utilise moins d'espace, si la même image est utilisée plusieurs fois, Docker garde une copie et la partage avec chaque container.

## WHAT IS THE PERTINENCE OF THE DIRECTORY STRUCTURE FOR THIS PROJECT?
- La plupart des sites d'aujourd'hui sont divisés en micro-application et la structure des fichiers reflète bien ça

# DOCKER
## WHAT IS THE DIFFERENCE BETWEEN CMD AND ENTRYPOINT?
- ENTRYPOINT est utilisé pour spécifier la commande de base qui est exécutée lorsque le container démarre.
- CMD est utilisé pour fournir les paramètres par défaut pour cette commande de base.

# DOCKER NETWORK
## SIMPLE EXPLANATION OF DOCKER NETWORK
- Permet la communication entre les containers de Docker et le monde extérieur via la machine hôte.
- Permet aux containers de communiquer entre eux

# NGINX
## DEMONSTRATE THE USE OF A TLSv1.2/v1.3 CERTIFICATE
nmap --script ssl-enum-ciphers -p 443 jfremond.42.fr
## WHAT IS A SSL/TLS CERTIFICATE?


# WORDPRESS
mysql -u root -p
show databases;
show tables in wp_db;


# MARIADB
