# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt update -y && apt upgrade -y

# Install wget, PHP (and its dependencies), and MariaDB client
RUN apt install -y wget\
	php7.3 php-fpm php-mysql\
	mariadb-client

# Install wordpress in specific directory
RUN wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www

# Decompress wordpress and delete tar archive
RUN cd /var/www && tar -xvf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz

# Allow root in new directory wordpress
RUN chown -R root:root /var/www/wordpress

# Copy PHP config
COPY conf/www.conf /etc/php7.3/fpm/pool.d/www.conf

# Install wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make CLI executable by user
RUN chmod +w wp-cli.phar
# Move it to right place
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy script
COPY conf/script.sh .



# Execute script
ENTRYPOINT [ "bash", "script.sh" ]