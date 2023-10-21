#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

echo "started $0"

# ====================
#
# Privacy & Security
#
# ====================

# enable firewall
echo "enable firewall"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# ====================
#
# Keyboard & Trackpad
#
# ====================

# caps lock to control
defaults -currentHost write -g $modifiermapping -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"

# tap to click
defaults write -g com.apple.mouse.tapBehavior -int 1

# speed up pointer speed
defaults write -g com.apple.trackpad.scaling 31

# speed up key repeat speed
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable auto-capitalization
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false


# ====================
#
# Misson Control
#
# ====================

# Hot Corners
# top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
# defaults write com.apple.dock wvous-tr-modifier -int 0

# bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
# defaults write com.apple.dock wvous-br-modifier -int 0

# ====================
#
# Dock
#
# ====================

# disable delay
defaults write com.apple.dock autohide-delay -float 0

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# hide dock automatically
defaults write com.apple.dock autohide -bool true
# defaults delete com.apple.dock autohide # disable

# Wipe all app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# disable dock
# defaults write com.apple.dock autohide-delay -float 3; killall Dock
# defaults delete com.apple.dock autohide-delay; killall Dock # disable

# restart Dock
killall Dock

# ====================
#
# Finder
#
# ====================

# Column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Disable animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Put directories in front when sort by name
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# restart Finder
killall Finder


# ====================
#
# Misc
#
# ====================

# save screencapture in ~/Downloads
defaults write com.apple.screencapture location ~/Downloads

# disable shadow in screencapture
defaults write com.apple.screencapture disable-shadow -bool true

# mute boot sound
echo "mute boot sound"
sudo nvram SystemAudioVolume=" "

# disable window animation(?)
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Disable dialog when running unidentified applications
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Avoid creating `.DS_Store` files on network volumes and USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# disable sleep
echo "disable sleep"
sudo systemsetup -setcomputersleep Off > /dev/null

# disable crash report
defaults write com.apple.CrashReporter DialogType -string "none"

# improve bluetooth audio quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# ====================
#
# Menu bar
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

echo "finished $0"
