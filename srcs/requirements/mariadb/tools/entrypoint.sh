# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/30 20:51:33 by jfremond          #+#    #+#              #
#    Updated: 2023/06/30 20:57:56 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sleep 5

#TODO (BIG TODO) write meaning of options used by mariadbd and mariadb-install-db

#TODO remove these for testing
touch tmp_file
chmod 755 tmp_file

if [ -d /var/lib/mysql/mysql ]; then
	echo "Already set up, starting..."
	exec /usr/bin/mariadbd --user=mysql --skip-networking=0
	exit 1
fi

echo "Installing..."
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --auth-root-authentication-method=normal --basedir=/usr --datadir=/var/lib/mysql --skip-test-db --user=mysql

# Write setup database and users in temporary file
cat << break > tmp_file
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASS');
CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
FLUSH PRIVILEGES;
break

/usr/bin/mariadbd --user=mysql --bootstrap --skip-name-resolve --skip-networking=0 < tmp_file

# Remove temporary file
rm -f tmp_file

exec /usr/bin/mariadbd --user=mysql --skip-networking=0
