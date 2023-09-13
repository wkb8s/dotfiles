#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

brew update
brew upgrade
# brew upgrade --cask --greedy
brew bundle --global
brew bundle cleanup --global --force
brew cleanup
