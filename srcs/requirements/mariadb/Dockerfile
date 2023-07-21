	# Download baseImage
FROM alpine:3.17.4

# Upgrade and update alpine
# Install MariaDB
# Allow connexion from all IPs in the network
# Create mysqld directory and give ownership to mysql user
RUN apk update && apk upgrade &&\
    apk add --no-cache mariadb mariadb-client &&\
    sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/my.cnf.d/mariadb-server.cnf &&\
    mkdir -p /run/mysqld/ &&\
    chown -R mysql:mysql /run/mysqld

# Copy script
COPY ./tools/db_setup.sh db_setup.sh

# Execute script
ENTRYPOINT ["sh", "db_setup.sh"]
