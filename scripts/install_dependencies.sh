#!/bin/bash

echo "Detecting platform..."
OS=$(uname -s)

case "$OS" in
    Darwin)
        echo "Running macOS installation script..."
        bash scripts/install_mac.sh
        ;;
    Linux)
        echo "Running Linux installation script..."
        bash scripts/install_linux.sh
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo "Detected Windows. Use PowerShell to run the Windows script."
        echo "Run: pwsh scripts/install_windows.ps1"
        ;;
    *)
        echo "Unsupported platform: $OS"
        exit 1
        ;;
esac
