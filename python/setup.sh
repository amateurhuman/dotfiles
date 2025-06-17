#!/bin/sh
#
# Python setup
#

echo "  Setting up Python..."

# Check if mise is installed
if ! command -v mise &> /dev/null; then
  echo "    Error: mise is not installed. Please install mise first."
  exit 1
fi

# Install Python using mise  
echo "    Installing Python via mise..."
mise use --global python@latest

echo "  Python setup complete"
