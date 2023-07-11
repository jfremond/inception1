# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    db_setup.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/30 20:51:33 by jfremond          #+#    #+#              #
#    Updated: 2023/07/11 15:58:39 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Set up database if not already set
# --user=mysql -> Run mariadbd daemon as mysql (default user)
# --skip-networking=0 -> listen for TCP/IP conections
if [ -d /var/lib/mysql/mysql ]; then
	echo "Already set up, starting..."
	exec /usr/bin/mariadbd --user=mysql --skip-networking=0
	exit 1
fi

# Install directory that'll contain mysql database and give ownership to user mysql
echo "Installing..."
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# --auth-root-authentication-method=normal -> Create a root@localhost that authenticates with a password
# --basedir=/usr -> Path to the MariaDB installation directory
# --datadir=/var/lib/mysql -> Directory where the data is stored
# --skip-test-db -> Don't install the test database
# --user=mysql -> Run mariadbd daemon as mysql (default user)
/usr/bin/mariadb-install-db --auth-root-authentication-method=normal --basedir=/usr --datadir=/var/lib/mysql --skip-test-db --user=mysql

# Write setup database and users in temporary file
# Initialize privileges table
# Delete root if not localhost
# Give a password to root
# Create a second user and give it a password
# Give all rights to the second user
# Apply modifications to the privileges table
cat << break > tmp_file
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User = 'root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASS');
CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
FLUSH PRIVILEGES;
break

# --user=mysql -> Run mariadbd daemon as mysql (default user)
# --bootstrap -> Initialize the server and set up the necessary system tables and data
# --skip-name-resolve -> Only use IP addresses for connections
# --skip-networking=0 -> listen for TCP/IP conections
/usr/bin/mariadbd --user=mysql --bootstrap --skip-name-resolve --skip-networking=0 < tmp_file

# Remove temporary file
rm -f tmp_file

# --user=mysql -> Run mariadbd daemon as mysql (default user)
# --skip-networking=0 -> listen for TCP/IP conections
exec /usr/bin/mariadbd --user=mysql --skip-networking=0
