# # Download baseImage
# FROM debian:buster

# # Update and upgrade
# RUN apt update -y && apt upgrade -y

# # Install wget, PHP (and its dependencies), and MariaDB client
# RUN apt install -y wget

# RUN apt install -y php7.3\
# 	php-fpm\
# 	php-mysql\
# 	mariadb-client

# # Install wordpress in specific directory
# RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

# # Decompress wordpress and delete tar archive
# RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# # Copy PHP config
# COPY ./conf/www.conf /etc/php7.3/fpm/pool.d/www.conf

# # Allow root in new directory wordpress
# RUN chown -R root:root /var/www/wordpress

# # Install wordpress CLI
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# # Make CLI executable by user
# RUN chmod +x wp-cli.phar
# # Move it to right place
# RUN mv wp-cli.phar /usr/local/bin/wp

# # Copy script
# COPY ./conf/script.sh script.sh

# # Execute script
# ENTRYPOINT [ "bash", "script.sh" ]

FROM debian:buster

EXPOSE 9000

# update packages and installing all dependences for wordpress
RUN apt-get update -y &&\
    apt-get install -y curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /var/run && \
    mkdir /run/php && \
    mkdir -p /var/www/html/

# COPY ./conf/wp-config.php /etc/
# RUN  ls -l /var/www/html
COPY ./conf/script.sh  /etc/script.sh
RUN  chmod -R 755 /var/www/html/
# RUN  chmod 755 /var/www/html/wp-config.php

# Wordpress-cli install guide :  https://make.wordpress.org/cli/handbook/guides/installing/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

CMD [ "sh", "/etc/script.sh" ]