#!/bin/sh
#
# Homebrew installation and package setup
#

echo "  Installing Homebrew and packages..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "    Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ $(uname -m) == 'arm64' ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "    Homebrew already installed"
fi

# Update Homebrew recipes
echo "    Updating Homebrew..."
brew update

# Install all our dependencies with bundle
if [ -f "$HOME/.Brewfile" ]; then
  echo "    Installing packages from Brewfile..."
  brew bundle check --global || brew bundle --global
else
  echo "    Warning: No Brewfile found at $HOME/.Brewfile"
fi

echo "  Homebrew setup complete"