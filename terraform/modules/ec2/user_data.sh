#!/bin/bash
set -e

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl unzip

# Install AWS CLI v2
echo "Installing AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws
echo "✅ AWS CLI v2 installed"

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
echo "✅ Docker installed"

# Enable Docker service
sudo systemctl enable docker

# Start Docker daemon
sudo systemctl start docker

# Restart Docker to ensure it's running properly
sudo systemctl restart docker
echo "✅ Docker service started"

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "✅ Docker Compose installed"

# Create app directory
mkdir -p /home/ubuntu/app
sudo chown -R ubuntu:ubuntu /home/ubuntu/app

# Enable and ensure Docker runs on reboot
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "✅ All installations completed successfully!"
echo "Docker version: $(docker --version)"
echo "Docker Compose version: $(docker-compose --version)"
echo "AWS CLI version: $(/usr/local/bin/aws --version)"
