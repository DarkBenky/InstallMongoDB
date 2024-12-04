#!/bin/bash

# MongoDB 8.0 Installation Script for Ubuntu

set -e  # Exit immediately if a command exits with a non-zero status

echo "Starting MongoDB 8.0 installation..."

# Install prerequisite packages
echo "Installing prerequisite packages: gnupg and curl..."
sudo apt-get install -y gnupg curl

# Import the MongoDB public GPG key
echo "Importing MongoDB public GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Add the MongoDB repository to the sources list
echo "Adding MongoDB 8.0 repository to sources list..."
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Update the package database
echo "Updating package database..."
sudo apt-get update

# Install MongoDB packages
echo "Installing MongoDB packages: mongodb-mongocli and mongodb-org..."
sudo apt-get install -y mongodb-mongocli mongodb-org

# Start MongoDB service
echo "Starting MongoDB service..."
sudo systemctl start mongod

# Enable MongoDB service to start on boot
echo "Enabling MongoDB service to start on boot..."
sudo systemctl enable mongod

# Verify that MongoDB has started successfully
echo "Checking MongoDB service status..."
sudo systemctl status mongod --no-pager

# Print success message
echo "MongoDB 8.0 installation completed successfully!"
