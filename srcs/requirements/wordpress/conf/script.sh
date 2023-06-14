#!/bin/bash

sleep 10

set -x

echo "Installing..."
cd /var/www/wordpress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	# sleep 5
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
fi

# To store temporary files and sockets related to PHP processes
mkdir -p /run/php

exec /usr/sbin/php-fpm81 -F