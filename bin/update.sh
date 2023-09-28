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

pip3 install --upgrade pip
if type "pip-review" > /dev/null 2>&1; then
  pip-review --auto
else
  echo "pip-review not exist!"
fi
