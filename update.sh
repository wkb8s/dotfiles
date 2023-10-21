#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

echo "started $0"

# brew
brew update
brew upgrade
# brew upgrade --cask --greedy
brew bundle --global
brew bundle cleanup --global --force
brew cleanup

# python
pip3 install --upgrade pip
if type "pip-review" > /dev/null 2>&1; then
  pip-review --auto
else
  echo "pip-review not exist!"
fi

# cleanup cashes
echo "cleanup cashes"
sudo rm -rf /System/Library/Caches/* /Library/Caches/* ~/Library/Caches/*
sudo rm -r /private/var/vm/sleepimage

echo "finished $0"
