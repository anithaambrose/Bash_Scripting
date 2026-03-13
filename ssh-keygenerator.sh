#!/bin/bash
#
# To generate a new SSH key pair (public and private keys). 
#-t rsa -b 4096: This specifies the RSA algorithm with 4096 bits of encryption strength. 
#-f ~/.ssh/id_rsa: This saves the private key in the specified file path. 
#
#
set -x
echo "Generating SSH key for GitHub..."
ssh-keygen -t rsa -b 4096 -C "anitodevops@gmail.com" -f ~/.ssh/id_rsa -N ""
# Show the public key
cat ~/.ssh/id_rsa.pub
