#!/bin/bash

brew update
brew upgrade
# brew upgrade --cask --greedy
brew bundle --global
brew bundle cleanup --global --force
brew cleanup

npm install -g npm@latest

# python
pip3 install --upgrade pip
if type "pip-review" > /dev/null 2>&1; then
  pip-review --auto
else
  pip3 install pip-review
fi
pip3 install numpy
pip3 install pandas
pip3 install matplotlib
pip3 install online-judge-tools
