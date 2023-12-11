# Download baseImage
FROM alpine:3.17.6

# Update and upgrade alpine
# Install wget, PHP and its dependencies
# Install MariaDB client
# Download and install wordpress
# Change where PHP-FPM is listening
# Install wordpress CLI
# Make it executable and move it to right place
RUN apk update && apk upgrade &&\
	apk add --no-cache wget php81 php81-fpm php-mysqli php81-cli php81-phar php81-iconv &&\
	apk add --no-cache mariadb-client &&\
	wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www &&\
	cd /var/www && tar -xzf wordpress-6.2.tar.gz && rm wordpress-6.2.tar.gz &&\
	sed -i 's/127.0.0.1:9000/wordpress:9000/' /etc/php81/php-fpm.d/www.conf &&\
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

# Copy script
COPY ./tools/wp_setup.sh wp_setup.sh

# Execute script
ENTRYPOINT [ "sh", "wp_setup.sh" ]
