# VERSION DEBIAN BUSTER #
FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

RUN apt install vim -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/selfsigned.crt -keyout /etc/nginx/ssl/selfsigned.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond"

RUN mkdir -p /var/run/nginx

RUN mkdir -p /var/www/

RUN chmod 777 /var/www/

COPY ./conf/nginx.conf /etc/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY index.html /var/www/html

EXPOSE 443

# CMD [ "nginx", "-g", "daemon off;" ]

# VERSION APLINE #
