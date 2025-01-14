#!/bin/bash

echo "Installing dependencies for macOS..."

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Python, Node.js, and Ollama
echo "Installing Python..."
brew install python@3.13
echo "Installing Node.js..."
brew install node@18
echo "Installing Ollama..."
brew install ollama

echo "macOS dependencies installed successfully."
