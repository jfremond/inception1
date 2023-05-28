# Download baseImage
FROM alpine:3.18

# Update and upgrade alpine
RUN apk upgrade -U

# Install nginx and openSSL
RUN apk add --no-cache nginx openssl

# Generate ssl cert and ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond" \
	-out /etc/ssl/certs/selfsigned.crt \
	-keyout /etc/ssl/private/selfsigned.key

# Copy nginx config
COPY conf/nginx.conf /etc/nginx/http.d/

# Run nginx in foreground
CMD [ "nginx", "-g", "daemon off;" ]