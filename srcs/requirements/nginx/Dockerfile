#VERSION DEBIAN BUSTER #
FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl /etc/nginx/ssl/certs /etc/nginx/ssl/private

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond" \
	-out /etc/nginx/ssl/certs/selfsigned.crt \
	-keyout /etc/nginx/ssl/private/selfsigned.key

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

# VERSION APLINE #
