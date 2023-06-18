# Download baseImage
FROM	debian:buster

# Update and upgrade Debian
# Install MariaDB
# Allow all ip addresses to connect to db
RUN	apt-get update -y && apt-get upgrade -y &&\
	apt-get install -y mariadb-server &&\
	sed -i 's/bind-address            = 127.0.0.1/bind-address            = */' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script
COPY	./conf/script.sh script.sh

# Execute the bash script
ENTRYPOINT [ "bash", "script.sh" ]
