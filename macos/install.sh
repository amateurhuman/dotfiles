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

# =============================================================================
# FINDER SETTINGS
# =============================================================================

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# =============================================================================
# FILE SYSTEM SETTINGS
# =============================================================================

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# =============================================================================
# SECURITY SETTINGS
# =============================================================================

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable firewall
echo "  Configuring security settings..."
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist 2>/dev/null || true

# Check FileVault status
echo "  Checking FileVault encryption..."
if fdesetup status | grep -q "FileVault is On"; then
  echo "    FileVault already enabled"
elif fdesetup status | grep -q "FileVault is Off, but will be enabled after the next restart"; then
  echo "    FileVault will be enabled after restart"
else
  echo "    WARNING: FileVault is not enabled. Consider running: sudo fdesetup enable -user \"$USER\""
fi

# =============================================================================
# INPUT SETTINGS
# =============================================================================

# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# =============================================================================
# DOCK SETTINGS
# =============================================================================

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Dock configuration
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36

# Run the screensaver if we're in the bottom-right hot corner
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# =============================================================================
# SCREENSHOT SETTINGS
# =============================================================================

# Save screenshots to Downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

echo "  macOS defaults set. Note: Some changes require a restart to take effect."