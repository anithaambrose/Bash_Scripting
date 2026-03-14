#!/bin/bash
#
#
# Define the list of software packages to install.
# dpkg -l: Lists installed packages on a Debian-based system. 
# apt-get install -y: Installs the package if it's not already installed. 
#
PACKAGES=("git" "docker.io" "nginx")

# Install each package
for PACKAGE in "${PACKAGES[@]}"; do
	if ! dpkg -l | grep -q "$PACKAGE"; then
		sudo apt-get install -y $PACKAGE
		echo "$PACKAGE installed successfully."
	else
		echo "$PACKAGE is already installed."
	fi
done
