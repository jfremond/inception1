# # **************************************************************************** #
# #                                                                              #
# #                                                         :::      ::::::::    #
# #    script.sh                                          :+:      :+:    :+:    #
# #                                                     +:+ +:+         +:+      #
# #    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
# #                                                 +#+#+#+#+#+   +#+            #
# #    Created: 2023/05/04 02:30:53 by jfremond          #+#    #+#              #
# #    Updated: 2023/06/14 01:31:26 by jfremond         ###   ########.fr        #
# #                                                                              #
# # **************************************************************************** #

# #!/bin/sh

# # Source the environment file
# # source /path/to/env_file.env
# # env
# # printf -- "Installing MariaDB\n"
# # if [ -d /var/lib/mysql/mysql ]; then
# #     printf -- "MariaDB already installed, skipping\n"
# # else
# #     # shellcheck disable=2086
# #     mariadb-install-db --rpm
# #     # initialize mariadb 'offline' (without a running daemon)
# #     {
# #         # initialize privileges table (disabled when running in bootstrap mode)
# #         echo "FLUSH PRIVILEGES;"
# #         # delete all root user except the one with localhost as host
# #         echo "DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';"
# #         # change root password
# #         echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
# #         # create new user
# #         echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# #         # give all permissions to the new user
# #         echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
# #         # apply modifications to the grant table (maybe not necessary)
# #         echo "FLUSH PRIVILEGES;"
# #     } | mariadbd --bootstrap
# # fi

# # Check if the database is already created, and if not, create it and set it up.
# MYSQL_DATABASE=inception
# MYSQL_USER=inception_user
# MYSQL_PASSWORD=inception_pass
# MYSQL_ROOT_PASSWORD=rootpass
# if [  -d /var/lib/mysql/mysql ]; then
# 	printf -- "MariaDB already installed, skipping\n"
# 	exec mariadbd
# else
# 	printf -- "Installing MariaDB"
# 	mkdir -p /var/lib/mysql
# 	chown -R mysql:mysql /var/lib/mysql

# 	mariadb-install-db --rpm
# 	# initialize mariadb 'offline' (without a running daemon)
# 	{
# 		# initialize privileges table (disabled when running in bootstrap mode)
# 		echo "FLUSH PRIVILEGES;"
# 		# delete all root user except the one with localhost as host
# 		echo "DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';"
# 		# change root password
# 		echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
# 		# create new user
# 		echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# 		# give all permissions to the new user
# 		echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
# 		# apply modifications to the grant table (maybe not necessary)
# 		echo "FLUSH PRIVILEGES;"
# 		} | mariadbd --bootstrap
# fi

# # exec mariadbd
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/04 02:30:53 by jfremond          #+#    #+#              #
#    Updated: 2023/05/08 12:58:15 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Start MySQL
service mysql start;

# Create our database if it doesn't already exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Create a user that can manipulate the database
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant all privileges to newly created user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Change root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Take changes into account
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Restarting the MySQL server in safe mode
exec mysqld_safe


# Lancer mysql en arriere plan (& apres la commande) et attendre qu'il soit lance (demande a Google)
# mysqld &
# Installer base de donnees (cherche la commande)
# Config root (en SQL)
# Config nouvel user (en SQL)
# Change les droits de /var/lib/mysql
# Kill procssus en arriere plan et le lancer en premier plan (recupere id processus avec "$!" ou pid_file = "")