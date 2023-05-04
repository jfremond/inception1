# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt update -y && apt upgrade -y

# Install MariaDB
RUN apt install mariadb-server -y

# Copy the MariaDB config
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script
COPY conf/script.sh .

ENTRYPOINT [ "bash", "script.sh" ]
