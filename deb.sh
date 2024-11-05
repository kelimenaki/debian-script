#!/bin/bash

# Define directories
DOWNLOADS_DIR="$HOME/Downloads"

# Check if Downloads directory exists
if [ ! -d "$DOWNLOADS_DIR" ]; then
    echo "Downloads directory not found. Exiting."
    exit 1
fi

# Function to install .deb files
install_deb() {
    DEB_FILES=("$DOWNLOADS_DIR"/*.deb)

    if [ -e "${DEB_FILES[0]}" ]; then
        echo "Installing .deb files..."
        sudo dpkg -i "$DOWNLOADS_DIR"/*.deb
        sudo apt-get install -f -y  # Fix any dependency issues
    else
        echo "No .deb files found in $DOWNLOADS_DIR."
    fi
}

# Run the installation functions
install_deb

echo "Installation process completed."

