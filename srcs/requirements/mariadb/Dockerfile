# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt-get update -y && apt-get upgrade -y

# Install MariaDB
RUN apt-get install -y mariadb-server

# Copy the MariaDB config
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script
COPY ./conf/script.sh script.sh

# Execute the bash script
ENTRYPOINT [ "bash", "script.sh" ]

# Expose the only allowed port
EXPOSE 3306


# Alpine version

# # Download BaseImage
# FROM alpine:3.17.3

# # Update and upgrade
# RUN apk upgrade -U

# # Install MariaDB
# RUN apk add --no-cache mariadb mariadb-client

# # Create directory that'll contain mysql server pid (mysqld.pid) and unix socket (mysqld.sock)
# # And give ownership to user and group mysql
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# # Copy MariaDB config
# COPY ./conf/my_conf.ini ./etc/my.cnf.d/

# # Copy the script
# COPY ./conf/script.sh .

# # Execute the script
# ENTRYPOINT [ "sh", "script.sh" ]
