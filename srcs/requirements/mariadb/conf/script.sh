# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/04 02:30:53 by jfremond          #+#    #+#              #
#    Updated: 2023/06/14 01:31:26 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Source the environment file
# source /path/to/env_file.env
# env
# printf -- "Installing MariaDB\n"
# if [ -d /var/lib/mysql/mysql ]; then
#     printf -- "MariaDB already installed, skipping\n"
# else
#     # shellcheck disable=2086
#     mariadb-install-db --rpm
#     # initialize mariadb 'offline' (without a running daemon)
#     {
#         # initialize privileges table (disabled when running in bootstrap mode)
#         echo "FLUSH PRIVILEGES;"
#         # delete all root user except the one with localhost as host
#         echo "DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';"
#         # change root password
#         echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
#         # create new user
#         echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#         # give all permissions to the new user
#         echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
#         # apply modifications to the grant table (maybe not necessary)
#         echo "FLUSH PRIVILEGES;"
#     } | mariadbd --bootstrap
# fi

# Check if the database is already created, and if not, create it and set it up.
MYSQL_DATABASE=inception
MYSQL_USER=inception_user
MYSQL_PASSWORD=inception_pass
MYSQL_ROOT_PASSWORD=rootpass
if [  -d /var/lib/mysql/mysql ]; then
	printf -- "MariaDB already installed, skipping\n"
	exec mariadbd
else
	printf -- "Installing MariaDB"
	mkdir -p /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql

	mariadb-install-db --rpm
	# initialize mariadb 'offline' (without a running daemon)
	{
		# initialize privileges table (disabled when running in bootstrap mode)
		echo "FLUSH PRIVILEGES;"
		# delete all root user except the one with localhost as host
		echo "DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';"
		# change root password
		echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
		# create new user
		echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
		# give all permissions to the new user
		echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
		# apply modifications to the grant table (maybe not necessary)
		echo "FLUSH PRIVILEGES;"
		} | mariadbd --bootstrap
fi

# exec mariadbd
