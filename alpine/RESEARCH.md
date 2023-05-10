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
On commence par spécifier la version de docker-compose (version: "3")
