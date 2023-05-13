# Download baseImage
FROM alpine:3.17.3

# Update and upgrade alpine
RUN apk upgrade -U

# Install nginx and openSSL
RUN apk add --no-cache nginx openssl

# Create directories to respect nginx organization
RUN mkdir -p /etc/nginx/ssl /etc/nginx/ssl/certs /etc/nginx/ssl/private

# Generate ssl cert and ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond" \
	-out /etc/nginx/ssl/certs/selfsigned.crt \
	-keyout /etc/nginx/ssl/private/selfsigned.key

# Copy nginx config
COPY conf/nginx.conf /etc/nginx/http.d/

# Copy html page (will be removed when wordpress is done)
COPY tools/index.html /var/www/localhost/htdocs

# Run nginx in foreground
CMD [ "nginx", "-g", "daemon off;" ]