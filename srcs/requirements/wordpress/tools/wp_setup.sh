# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp_setup.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/01 02:44:25 by jfremond          #+#    #+#              #
#    Updated: 2023/08/07 19:50:41 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

sleep 3

set -x

echo "Installing..."
cd /var/www/wordpress
# Generate a wp-config file
# Create a new database
# Run the standard WordPress installation process
# Create a new user
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER_NAME \
						--dbpass=$DB_USER_PASS \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

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

# mkdir -p /run/php

# Run PHP-FPM in foreground
exec /usr/sbin/php-fpm81 -F
