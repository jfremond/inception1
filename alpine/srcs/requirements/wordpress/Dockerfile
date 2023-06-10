# Download baseImage
FROM alpine:3.17.3

# Update and upgrade alpine
RUN apk upgrade -U

# Install wget, PHP and its dependencies
RUN apk add --no-cache wget php81 php81-fpm php-mysqli php81-cli php81-phar 

# (2 last ones nedded for wp-cli) 
RUN apk add --no-cache mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www

RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

# Change where PHP-FPM is listening
RUN sed -i 's/127.0.0.1:9000/wordpress:9000/' /etc/php81/php-fpm.d/www.conf

# Install wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make CLI executable by user
RUN chmod +x wp-cli.phar

# Move it to right place
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy script
COPY ./conf/script.sh script.sh
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php 

# Execute script
ENTRYPOINT [ "sh", "script.sh" ]
