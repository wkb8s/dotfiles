# yabai
yabai --start-service

# skhd
skhd --start-service

# fzf: install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# python
pip3 install numpy
pip3 install pandas
pip3 install matplotlib
pip3 install pip-review

# atcoder
## atcoder-cli
npm install -g atcoder-cli
## online-judge-tools
pip3 install online-judge-tools

# wallpaper
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/waka/.wallpaper/nord-lake.png"'

# disable sleep
sudo pmset disable sleep 1
# sudo pmset disable sleep 0

# ssh
mkdir ~/.ssh
cp ssh/* ~/.ssh

sudo reboot
