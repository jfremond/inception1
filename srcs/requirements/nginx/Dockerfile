# Download baseImage
FROM debian:buster

# Update and upgrade
RUN apt update -y && apt upgrade -y

# Install NGINX and OpenSSL
RUN apt install nginx -y && apt install openssl -y

# Create directories to store certificates
RUN mkdir -p /etc/nginx/ssl/ /etc/nginx/ssl/certs /etc/nginx/ssl/private

# Generate SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr" \
	-out /etc/nginx/ssl/certs/selfsigned.crt \
	-keyout /etc/nginx/ssl/private/selfsigned.key

# Copy NGINX conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Set permissions 
RUN chmod 755 /var/www/html
# Make user the new owner of the directory
RUN chown -R www-data:www-data /var/www/html

# Launch NGINX in foreground
CMD [ "nginx", "-g", "daemon off;" ]
