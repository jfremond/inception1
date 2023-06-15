# Download baseImage
FROM	debian:buster

# Update and upgrade Debian
# nstall MariaDB
RUN	apt-get update -y && apt-get upgrade -y &&\
	apt-get install -y mariadb-server

# Copy the MariaDB config
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

# Copy the script
COPY	./conf/script.sh script.sh

# Execute the bash script
ENTRYPOINT [ "bash", "script.sh" ]
