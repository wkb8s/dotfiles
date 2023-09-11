#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================

# speed up pointer speed
defaults write -g com.apple.trackpad.scaling 31

# speed up key repeat speed
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable auto-capitalization
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock
#
# ====================

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# hide dock automatically
defaults write com.apple.dock autohide -bool true
# defaults delete com.apple.dock autohide # disable

# disable dock
defaults write com.apple.dock autohide-delay -float 3; killall Dock
# defaults delete com.apple.dock autohide-delay; killall Dock # disable

# ====================
#
# Finder
#
# ====================

# Disable animation
# defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
# defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
# defaults write com.apple.finder ShowPathbar -bool true

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
# defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# for app in "Dock" \
# 	"Finder" \
# 	"SystemUIServer"; do
# 	killall "${app}" &> /dev/null
# done
