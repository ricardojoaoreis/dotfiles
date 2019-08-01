#!/bin/sh
set -e

# install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Updating homebrew bundle"
brew bundle --global
brew bundle cleanup --global --force

# Defaults. References: 
# https://gist.github.com/MatthewEppelsheimer/2269385
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh

# Show the ~/Library folder
chflags nohidden ~/Library

# Set Dark Mode
defaults write "Apple Global Domain" AppleInterfaceStyle -string "Dark"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Set dock size
defaults write com.apple.dock tilesize -int 51

# Don't rearrange automatically based on most recently used
defaults write com.apple.dock mru-spaces -bool false

# Show hidden files on Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# View as list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Delete text input app
defaults delete com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.textinput"

# Show volume indicator on menu
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 1

# Set menu apps
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Displays.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu"

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable snap-to-grid for desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Restart Dock and Finder
for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" > /dev/null 2>&1
done