#!/bin/bash

# Uninstall all docker packages
sudo apt-get remove docker docker-engine docker.io

# Update mirror index
sudo apt-get update

# Install needed packages
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release vim git

# Add docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add stable directory
echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update mirror index
sudo apt-get update

# Install docker
sudo apt-get install -y docker-ce

# Init docker service
sudo systemctl start docker
sudo systemctl enable docker

# Create container
cd mywebserver
sudo docker build -t my-apache2 .
sudo docker run -dit --name my-running-app -p 8080:80 my-apache2

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Change permissions
sudo chmod +x /usr/local/bin/docker-compose

############# setup of containerized cms ###########
cd ..
cd dk_wordpress
sudo docker-compose up -d

### SSL generation
# Go to cerbot page at https://certbot.eff.org/instructions and select Apache with Ubuntu 20, then follow instructions

# Get a prompt inside container
sudo docker exec -it c739cb0fb6ae /bin/bash

# Update system
apt update

# Install snap
apt install snapd
