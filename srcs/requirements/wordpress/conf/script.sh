# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/04 09:41:13 by jfremond          #+#    #+#              #
#    Updated: 2023/05/07 23:09:10 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# #!/bin/bash

# To make sure MariaDB database is launched
sleep 10;

# Autoconfigure wordpress database if not already done
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

# Autoconfigure website if not already done
sleep 2
wp core install	--url=$DOMAIN_NAME \
				--title=$SITE_TITLE \
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_EMAIL \
				--allow-root \
				--path='/var/www/wordpress'

# Create one USER
wp user create	--allow-root \
				--role=author $USER1_LOGIN $USER1_EMAIL \
				--user_pass=$USER1_PASSWORD \
				--path='/var/www/wordpress' >> /log.txt
fi

# Create /run/php folder doesn't exist create it
if [ ! -d /run/php ]; then
	mkdir ./run/php
fi

# Start php-fpm
/usr/sbin/php-fpm7.3 -F -R
