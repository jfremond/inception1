# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt-get update -y && apt-get upgrade -y

# Install MariaDB
RUN apt-get install mariadb-server -y

# Copy the MariaDB config
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script
COPY ./conf/script.sh script.sh

# Execute the bash script
ENTRYPOINT [ "bash", "script.sh" ]

# Expose the only allowed port
EXPOSE 3306
