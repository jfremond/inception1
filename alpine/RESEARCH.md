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

# DOCKER

## A quoi docker sert ?
Docker a été créé pour régler des problemes de compatibilité entre machines.
Docker peut être résumé à trois parties :
	- Le moteur tourne sur les machines
	- Les images, les fichiers qui sont dans le DockerHub (dans notre cas, on doit les créer)
	- Le conteneur qui est une instance des images

## Qu'est-ce qu'un Dockerfile ?
Le Dockerfile est la liste des étapes que Docker va devoir réaliser pour pouvoir créer notre image
Liste des commandes que tu peux trouver dans un Dockerfile
	- FROM -> Quelle image Docker va aller chercher pour commencer
	- WORKDIR -> Dans quel dossier effectuer toutes les actions suivantes
	- COPY -> copier d'une source à une destination
	- RUN -> Roule quelque chose (lance une commande)
	- EXPOSE -> ouvre le port donné en paramètres
	- CMD -> la commande à lancer au moment ou le container est lancé

## Docker-compose
On commence par spécifier la version de docker-compose (version: "num")
On définit nos services (containers) (dans notre cas, nginx, wordpress et mariadb)
Il y a plusieurs choses à définir dans nos services
	- La liste des services (services)
	- Le nom du service (nom_du_service)
	- Le nom de l'image (image)
	- Les dépendances s'il y en a (afin d'être sur que tout démarre au bon moment) (depends_on)
	- Les ports (ports)
	- Le réseau (pour dire à Docker de mettre ces deux containers dans le même réseau pour qu'ils puissent commniquer)(networks)
On définit ensuite notre réseau et les spécificités de celui-ci
driver: la_maniere_dont_est_liee_nos_containers


Le fichier docker-compose ressemble maintenant à ceci
version: "num_version"
services:
	nom_du_service:
		image: nom_de_l_image
		depends_on:
			- nom_de_la_dependance
		ports:
			- "port_machine:port_du_container"
		networks:
			- nom_du_reseau

networks:
	nom_du_reseau:
		driver: bridge