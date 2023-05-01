# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 22:15:42 by jfremond          #+#    #+#              #
#    Updated: 2023/05/01 23:24:32 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Start MySQL
service mysql start;

# Create a database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create a user with a password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges to this user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modify MySQL database
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Reload the database
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start MySQL in safe mode
exec mysqld_safe;