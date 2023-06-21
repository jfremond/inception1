sleep 5

touch tmp_mdb
chmod 755 tmp_mdb

if [ -d /var/lib/mysql/mysql ]; then
	echo "Already set up, starting..."
	exec /usr/bin/mysqld --user=mysql --skip_networking=0 --console $@
	exit 1
fi

echo "Installing..."
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --auth-root-authentication-method=normal --basedir=/usr --datadir=/var/lib/mysql --skip-test-db --user=mysql

cat << break > tmp_mdb
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';
SET PASSWORD FOR 'estoffel'@'localhost' = PASSWORD('$DB_ROOT_PASS');
CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
FLUSH PRIVILEGES;
break

/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp_mdb

rm -f tmp_mdb

exec /usr/bin/mysqld --user=mysql --skip_networking=0 --console $@