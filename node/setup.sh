#!/bin/sh
#
# Node.js setup
#

echo "  Setting up Node.js..."

# Check if mise is installed
if ! command -v mise &> /dev/null; then
  echo "    Error: mise is not installed. Please install mise first."
  exit 1
fi

# Install Node using mise
echo "    Installing Node.js via mise..."
mise use --global node@lts

# Install global packages
echo "    Installing global Node.js packages..."
npm install -g yarn
npm install -g pnpm

echo "  Node.js setup complete"
