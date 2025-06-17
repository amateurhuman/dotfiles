#!/usr/bin/env bash
#
# Homebrew installation and package setup
#

set -e

echo "  Installing Homebrew and packages..."

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null 2>&1; then
  echo "    Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for current session
  if [[ $(uname -m) == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "    Homebrew already installed"
fi

# Update Homebrew
echo "    Updating Homebrew..."
brew update --quiet
echo "    Homebrew updated"
