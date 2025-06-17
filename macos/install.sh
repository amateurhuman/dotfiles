#!/bin/sh
#
# macOS-specific setup and defaults
#

# Check if we're on macOS
if [ "$(uname -s)" != "Darwin" ]; then
  echo "  macOS setup script running on non-macOS system, skipping..."
  exit 0
fi

echo "  Setting up macOS defaults..."

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Use AirDrop over every interface. 
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Run the screensaver if we're in the bottom-right hot corner.
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36

# Save screenshots to Downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

echo "  macOS defaults set. Note: Some changes require a restart to take effect."