#!/bin/bash
set -e

# Update system packages
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Install Docker
echo "Installing Docker..."
sudo apt install docker.io -y
echo "✅ Docker installed"

# Install Docker Compose
echo "Installing Docker Compose..."
sudo apt install docker-compose -y
echo "✅ Docker Compose installed"

# Add ubuntu user to docker group
echo "Adding ubuntu user to docker group..."
sudo usermod -aG docker ubuntu

# Add jenkins user to docker group (if jenkins exists)
echo "Adding jenkins user to docker group..."
sudo usermod -aG docker jenkins || true

# Enable and start Docker service
echo "Starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Wait for Docker to be ready
echo "⏳ Waiting for Docker to be ready..."
sleep 10

# Run SonarQube container
echo "🚀 Starting SonarQube container..."
sudo docker run -itd --name sonarqube-server -p 9000:9000 sonarqube:latest

# Wait for container to start
echo "⏳ Waiting for SonarQube to initialize (2-5 minutes)..."
sleep 30

# Verify container is running
echo ""
echo "Verifying SonarQube container status..."
sudo docker ps | grep sonarqube-server

echo ""
echo "✅ SonarQube setup complete!"
echo "🌐 Access at: http://<public-ip>:9000"
echo "📝 Default credentials: admin / admin"
echo "⏳ Note: SonarQube may take 2-5 minutes to fully initialize on first run"
