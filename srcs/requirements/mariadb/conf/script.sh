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