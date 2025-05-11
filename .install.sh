#!/bin/zsh

# Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools ..."
xcode-select --install

# Install Homebrew
echo "Installing Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Tap Homebrew Formulae
echo "Tapping Homebrew Formulae ..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Install Formulae
echo "Installing Homebrew Formulae ..."
brew install sketchybar
brew install skhd
brew install yabai
brew install jq
brew install switchaudio-osx
brew install nowplaying-cli

# Running Packages
echo "Running Packages ..."
brew services start sketchybar
yabai --start-service
skhd --start-service