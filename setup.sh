#!/bin/bash

set -e

echo "🚀 Starting setup..."

# ---------------------------
# 1. Update system
# ---------------------------
echo "🔄 Updating package list..."
sudo apt update -y
sudo apt upgrade -y

# ---------------------------
# 2. Install OpenJDK 17
# ---------------------------
echo "☕ Installing OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

# Verify Java
java -version

# ---------------------------
# 3. Install Maven
# ---------------------------
echo "📦 Installing Maven..."
sudo apt install -y maven

# Verify Maven
mvn -v

# ---------------------------
# 4. Install Docker
# ---------------------------
echo "🐳 Installing Docker..."

# Remove older versions if any
sudo apt remove docker docker-engine docker.io containerd runc -y || true

# Install required packages
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set permissions
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service
sudo service docker start

# Enable non-root usage of Docker
sudo groupadd docker || true
sudo usermod -aG docker $USER

# ---------------------------
# 5. Build and run the project
# ---------------------------
echo "🏗️ Building Spring Boot App..."

mvn clean package -DskipTests

echo "🐳 Starting containers via Docker Compose..."
docker compose down -v --remove-orphans
docker compose build
docker compose up -d

echo "✅ Setup complete!"
echo "🌐 Access the app at: http://localhost:8080"
echo "🔁 You may need to restart WSL or log out/in for Docker permissions to take effect."

