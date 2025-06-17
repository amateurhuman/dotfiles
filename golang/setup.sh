#!/bin/sh
#
# Go setup
#

echo "  Setting up Go..."

# Check if mise is installed
if ! command -v mise &> /dev/null; then
  echo "    Error: mise is not installed. Please install mise first."
  exit 1
fi

# Install Go using mise
echo "    Installing Go via mise..."
mise use --global go@latest

echo "  Go setup complete"
