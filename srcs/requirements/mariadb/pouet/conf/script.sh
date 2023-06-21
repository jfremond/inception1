# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/04 02:30:53 by jfremond          #+#    #+#              #
#    Updated: 2023/06/15 09:48:37 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Start MySQL
service mysql start;

# Create our database if it doesn't already exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create a user that can manipulate the database
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER_NAME}\`@'localhost' IDENTIFIED BY '${DB_USER_PASS}';"

# Grant all privileges to newly created user
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER_NAME}\`@'%' IDENTIFIED BY '${DB_USER_PASS}';"

# Change root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"

# Take changes into account
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p$DB_ROOT_PASS shutdown

# Restarting the MySQL server in safe mode
exec mysqld_safe
