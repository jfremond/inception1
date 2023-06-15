#!/bin/bash

sleep 10

set -x

echo "Installing..."
cd /var/www/wordpress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER_NAME \
						--dbpass=$DB_USER_PASS \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	# sleep 5
	wp db create
	wp core install	--allow-root \
					--url=$DOMAIN_NAME \
					--title=$SITE_TITLE \
					--admin_user=$WP_ADMIN_NAME \
					--admin_password=$WP_ADMIN_PASS \
					--admin_email=$WP_ADMIN_MAIL \
					--path='/var/www/wordpress'

	wp user create	--allow-root \
					--role=author $WP_USER_NAME $WP_USER_MAIL \
					--user_pass=$WP_USER_PASS \
					--path='/var/www/wordpress'
fi

# To store temporary files and sockets related to PHP processes
mkdir -p /run/php

exec /usr/sbin/php-fpm81 -F