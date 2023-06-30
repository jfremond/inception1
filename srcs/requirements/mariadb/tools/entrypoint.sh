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

# Set up database if not already setup
# --user=mysql ->
# --skip-networking=0 ->
if [ -d /var/lib/mysql/mysql ]; then
	echo "Already set up, starting..."
	exec /usr/bin/mariadbd --user=mysql --skip-networking=0
	exit 1
fi

# Install directory that'll contain mysql database and give ownership to user mysql
echo "Installing..."
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# --auth-root-authentication-method=normal -> 
# --basedir=/usr ->
# --datadir=/var/lib/mysql ->
# --skip-test-db ->
#--user=mysql ->
mariadb-install-db --auth-root-authentication-method=normal --basedir=/usr --datadir=/var/lib/mysql --skip-test-db --user=mysql

# Write setup database and users in temporary file
#
#
#
#
#
cat << break > tmp_file
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User = 'root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASS');
CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
break

# --user=mysql -> 
# --bootstrap -> 
# --skip-name-resolve -> 
# --skip-networking=0 ->
/usr/bin/mariadbd --user=mysql --bootstrap --skip-name-resolve --skip-networking=0 < tmp_file

# Remove temporary file
rm -f tmp_file

# --user=mysql ->
# --skip-networking=0 ->
exec /usr/bin/mariadbd --user=mysql --skip-networking=0
