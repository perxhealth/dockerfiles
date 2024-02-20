#! /bin/bash
set -e

# Generate a self signed certificate for use by this container only
export KEY_PATH=/app/ssl/server.key
export CRT_PATH=/app/ssl/server.crt
mkdir -p /app/ssl
bash generate-self-signed-cert.sh

# Start nginx with cert in place
printf "\nStarting nginx in the foreground...\n"
exec nginx -g 'daemon off;'
