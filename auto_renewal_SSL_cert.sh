#!/bin/bash
#
# Define the location of the SSL certificate and private key.
#
##############################################################
#
# openssl x509 -enddate: Extracts the expiry date of the SSL certificate.
# date --date="$EXPIRY_DATE" +%s: Converts the expiry date to seconds for comparison.
# systemctl reload nginx: Reloads the Nginx service to apply the new certificate if needed
#
##############################################################
set -x
CERT_FILE="/etc/ssl/certs/google.com.crt"
KEY_FILE="/etc/ssl/private/google.com.key"
NGINX_CONF="/etc/nginx/nginx.conf"

# Check if certificate is about to expire (within 30 days)
EXPIRY_DATE=$(openssl x509 -enddate -noout -in $CERT_FILE | sed "s/^.*=\(.*\)$/\1/")
EXPIRY_DATE_SECONDS=$(date --date="$EXPIRY_DATE" +%s)
CURRENT_DATE_SECONDS=$(date +%s)
DAYS_LEFT=$((($EXPIRY_DATE_SECONDS - $CURRENT_DATE_SECONDS) / 86400))

if [ $DAYS_LEFT -lt 30 ]; then
	#Reload Nginx configuration to apply new certificate.
	sudo systemctl reload nginx
	echo "SSL certificate renewed and Nginx reloaded."
else
	echo "No certificate renewal needed. Expiry in $DAYS_LEFT days."
fi
