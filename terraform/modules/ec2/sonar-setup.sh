#!/bin/bash
set -e

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl unzip

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

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "✅ Docker Compose installed"

# Create sonarqube directory
mkdir -p /home/ubuntu/sonarqube
cd /home/ubuntu/sonarqube

# Create docker-compose.yml for SonarQube
cat > docker-compose.yml << 'EOFCOMPOSE'
version: '3.8'

services:
  sonarqube:
    image: sonarqube:latest
    ports:
      - "9000:9000"
    environment:
      - SONARQUBE_JDBC_URL=jdbc:postgresql://db:5432/sonarqube
      - SONARQUBE_JDBC_USERNAME=sonar
      - SONARQUBE_JDBC_PASSWORD=sonar
    volumes:
      - sonarqube_data:/opt/sonarqube/data
      - sonarqube_logs:/opt/sonarqube/logs
      - sonarqube_extensions:/opt/sonarqube/extensions
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      - POSTGRES_USER=sonar
      - POSTGRES_PASSWORD=sonar
      - POSTGRES_DB=sonarqube
    volumes:
      - postgresql_data:/var/lib/postgresql/data

volumes:
  sonarqube_data:
  sonarqube_logs:
  sonarqube_extensions:
  postgresql_data:
EOFCOMPOSE

# Fix permissions
sudo chown -R ubuntu:ubuntu /home/ubuntu/sonarqube

# Start SonarQube with Docker Compose
echo "🚀 Starting SonarQube..."
docker-compose up -d

echo "✅ SonarQube is starting (access at http://<public-ip>:9000)"
echo "⏳ Default credentials: admin / admin"
