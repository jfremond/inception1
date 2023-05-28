# Download baseImage
FROM alpine:3.18

# Update and upgrade alpine
RUN apk upgrade -U

# Install MariaDB
RUN apk add --no-cache mariadb mariadb-client 

# COPY ./tools/caca.sh caca.sh
COPY ./tools/my.cnf a
# ENTRYPOINT [ "sh", "caca.sh" ]