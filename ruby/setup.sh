#!/bin/sh
#
# Ruby setup
#

echo "  Setting up Ruby..."

# Check if mise is installed
if ! command -v mise &> /dev/null; then
  echo "    Error: mise is not installed. Please install mise first."
  exit 1
fi

# Install Ruby using mise
echo "    Installing Ruby via mise..."
mise use --global ruby@latest

# Install bundler
echo "    Installing bundler..."
gem install bundler

echo "  Ruby setup complete"
