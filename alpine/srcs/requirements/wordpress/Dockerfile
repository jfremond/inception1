# Download baseImage
FROM alpine:3.18

# Update and upgrade alpine
RUN apk upgrade -U

# Install wget, PHP and its dependencies
RUN apk add --no-cache wget php81 php81-fpm php-mysqli
#mariadb-client

RUN wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.2.tar.gz && rm wordpress-6.2.tar.gz

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

# Install wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make CLI executable by user
RUN chmod +x wp-cli.phar
# Move it to right place
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy script
COPY ./conf/script.sh script.sh

# Execute script
ENTRYPOINT [ "sh", "script.sh" ]
