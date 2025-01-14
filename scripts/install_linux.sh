#!/bin/bash

echo "Installing dependencies for Linux..."

# Update package manager
echo "Updating package manager..."
sudo apt update -y || sudo yum update -y || echo "Unsupported package manager"

# Install Python
echo "Installing Python..."
sudo apt install -y python3.13 python3.13-venv || sudo yum install -y python3.13 || echo "Install Python manually."

# Install Node.js
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs || sudo yum install -y nodejs || echo "Install Node.js manually."

# Install Ollama
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install | sh || echo "Ollama installation failed."

echo "Linux dependencies installed successfully."
