#!/bin/bash

# To make sure MariaDB database is launched
# sleep 10;

# Autoconfigure wordpress database if not already done
# if [ ! -f /var/www/wordpress/wp-config.php ]; then
# wp config create	--allow-root \
# 					--dbname=$MYSQL_DATABASE \
# 					--dbuser=$MYSQL_USER \
# 					--dbpass=$MYSQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'

# Autoconfigure website if not already done
# sleep 2
# wp core install	--allow-root \
# 				--url=$DOMAIN_NAME \
# 				--title=$SITE_TITLE \
# 				--admin_user=$ADMIN_USER \
# 				--admin_password=$ADMIN_PASSWORD \
# 				--admin_email=$ADMIN_EMAIL \
# 				--path='/var/www/wordpress'

# Create one USER
# wp user create	--allow-root \
# 				--role=author $USER1_LOGIN $USER1_EMAIL \
# 				--user_pass=$USER1_PASSWORD \
# 				--path='/var/www/wordpress' >> /log.txt
# fi

# Create /run/php folder doesn't exist create it
# if [ ! -d /run/php ]; then
# 	mkdir ./run/php
# fi

# Start php-fpm
# /usr/sbin/php-fpm81 -F

# Generate config file
sleep 10

set -x

echo "Installing..."
cd /var/www/wordpress
wp db create
wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title=$SITE_TITLE \
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_EMAIL \
				--path='/var/www/wordpress'

# wp user create	--allow-root \
# 				--role=author $USER1_LOGIN $USER1_EMAIL \
# 				--user_pass=$USER1_PASSWORD \
# 				--path='/var/www/wordpress' >> /log.txt

mkdir -p /run/php

exec /usr/sbin/php-fpm81 -F