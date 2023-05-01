#Download baseImage
FROM alpine:3.17.3

# Update and upgrade alpine
RUN apk upgrade -U

# Install MariaDB
RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /run/mysqld

# etc/my.cnf.d/mariadb-server.cnf
COPY conf/mariadb-server.cnf etc/my.cnf.d/mariadb-server.cnf
COPY conf/config.sh config.sh

# Setup MariaDB
ENTRYPOINT [ "sh", "config.sh" ]
