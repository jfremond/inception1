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
## HOW DOES DOCKER-COMPOSE WORK?
## WHAT IS THE DIFFERENCE BETWEEN A DOCKER IMAGE USED W/ DOCKER-COMPOSE AND W/OUT IT?
## WHAT IS THE BENEFIT OF DOCKER COMPARED TO WMs?
## WHAT IS THE PERTINENCE OF THE DIRECTORY STRUCTURE FOR THIS PROJECT?

# DOCKER
## WHAT IS THE DIFFERENCE BETWEEN CMD AND ENTRYPOINT?

# DOCKER NETWORK
## SIMPLE EXPLANATION OF DOCKER NETWORK

# NGINX
## DEMONSTRATE THE USE OF A TLSv1.2/v1.3 CERTIFICATE
nmap --script ssl-enum-ciphers -p 443 jfremond.42.fr
## WHAT IS A SSL/TLS CERTIFICATE?


# WORDPRESS
mysql -u root -p
show databases;
use wordpress;
show tables;


# MARIADB
