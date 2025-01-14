Write-Host "Installing dependencies for Windows..."

# Install Python
Write-Host "Installing Python..."
winget install -e --id Python.Python.3.13

# Install Node.js
Write-Host "Installing Node.js..."
winget install -e --id OpenJS.NodeJS.LTS

# Install Ollama
Write-Host "Installing Ollama..."
Invoke-WebRequest -Uri https://ollama.com/install -OutFile ollama-installer.exe
Start-Process -FilePath ollama-installer.exe -Wait

Write-Host "Windows dependencies installed successfully."
