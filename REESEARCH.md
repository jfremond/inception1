# DOCKER
## Fonctionnement basique de Docker
Docker est une plateforme permettant de développer, déployer et exécuter des applications en les isolant du reste de la machine.
	- Conteneurs Docker
		- Docker crée des conteneurs. Chaque conteneur contient tout le code et les dépendances nécéssaires afin que l'application s'exécute rapidement et de manière fiable sur différents OS.
		- Les étapes de création d'un conteneur peuvent être définies dans un Dockerfile, fichier qui spécifie les instruction de construction d'un conteneur.

## Fonctionnement basique de Docker Compose 
	- Docker Compose est un outil utilisé pour définir et lancer des applications necéssitant plusieurs conteneurs.
	- Cela nous permet de définir les services, réseaux, volumes, et dépendances d'une application dans un fichier YAML.
	- Avec une seule commande Docker Compose peut créer et gérer tous les conteneurs necéssaires à notre application.

## Différence entre une image Docker avec et sans docker-compose
Avec docker-compose:
	- Les services, réseaux, volumes et dépendances sont définies dans un ficher YAML
	- Les images à utiliser, les ports à exposer, et les variables d'environnement sont définies dans le fichier YAML
Sans docker-compose:
	- Tout est configuré soit dans le Dockerfile, soit en ligne de commande. De plus les conteneurs sont exécutés et démarrés séparément.

## L'intérêt de Docker par rapport aux VMs
- Les ressources sont partagées avec la machine hôte, ce qui permet de lancer beaucoup de conteneurs contre peu de VMs.
- Docker utilise moins d'espace, si la même image est utilisée plusieurs fois, Docker garde une copie et la partage avec chaque conteneur.
- Les conteneurs Docker sont plus rapides à démarrer et à arrêter.
- Le Docker Hub qui héberge des milliers d'images Docker prêtes à l'emploi.

## L'intérêt de la structure de fichiers
- L'organisation est claire
	- "srcs" peut contenir tous les dossiers correspondant aux applications demandés dans la partie obligatoire
	- chaque sous-dossier contenu dans "requirements" peut contenir le Dockerfile, les fichiers sources, et les fichiers de configuration de chaque composant de l'application

## Qu'est-ce que Docker Network ?
Docker Network est une fonctionnalité de Docker qui permet aux conteneurs de communiquer entre eux et avec l'extérieur.