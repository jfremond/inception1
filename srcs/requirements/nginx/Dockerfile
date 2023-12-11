# Download baseImage
FROM	alpine:3.17.6

# Update and upgrade alpine
# Install nginx and openSSL
# Generate ssl cert and key
RUN apk update && apk upgrade &&\
	apk add --no-cache nginx openssl &&\
	openssl req -newkey rsa:4096 -days 365 -nodes -x509\
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond"\
	-out /etc/ssl/certs/selfsigned.crt\
	-keyout /etc/ssl/private/selfsigned.key

# Copy nginx config
COPY	conf/nginx.conf /etc/nginx/http.d/

# Run nginx in foreground
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
