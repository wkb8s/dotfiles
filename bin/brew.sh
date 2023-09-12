#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

brew update && brew upgrade && brew cleanup
brew bundle cleanup --global --force
brew bundle --global
