# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt-get update -y && apt-get upgrade -y

# Install wget, PHP (and its dependencies), and MariaDB client
RUN apt-get install -y wget

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# Install wordpress in specific directory
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

# Decompress wordpress and delete tar archive
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# Copy PHP config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Allow root in new directory wordpress
RUN chown -R root:root /var/www/wordpress

# Install wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make CLI executable by user
RUN chmod +x wp-cli.phar
# Move it to right place
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy script
COPY ./conf/script.sh script.sh

# Execute script
ENTRYPOINT [ "bash", "script.sh" ]
