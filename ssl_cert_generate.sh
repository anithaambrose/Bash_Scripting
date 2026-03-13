#!/bin/bash 
#
#  openssl req -x509: This generates a self-signed SSL certificate. 
#  -newkey rsa:2048: This creates a new RSA key with 2048 bits. 
#  -keyout and -out: These specify the file paths to save the private key and certificate. 
#
#
set -x
DOMAIN="google.com" 
CERT_DIR="/etc/ssl/certs" 
KEY_DIR="/etc/ssl/private" 
 
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_DIR/$DOMAIN.key -out $CERT_DIR/$DOMAIN.crt 

