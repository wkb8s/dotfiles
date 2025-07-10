#!/bin/bash

# zsh
if !(type "zsh" > /dev/null 2>&1); then
  if [ "$(uname)" == "Linux" ] ; then
    sudo apt-get install zsh
  fi
fi

if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi

# gcc
if !(type "gcc" > /dev/null 2>&1); then
  if [ "$(uname)" == "Linux" ] ; then
    sudo apt install build-essential
  fi
  exit 0
fi

# curl
if !(type "curl" > /dev/null 2>&1); then
  if [ "$(uname)" == "Linux" ] ; then
    sudo apt install curl
  fi
  exit 0
fi

# Homebrew
if !(type "brew" > /dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  source ~/.zshrc
fi
if !(type "brew" > /dev/null 2>&1); then
  echo "brew not found"
  exit 1
fi

# atcoder-cli
if [ "$(uname)" == "Darwin" ] ; then
  if !(type "acc" > /dev/null 2>&1); then
    npm install -g atcoder-cli
    source ~/.zshrc
  fi
  if !(type "acc" > /dev/null 2>&1); then
    echo "atcoder-cli not found"
    exit 1
  fi
fi

# github-copilot
if [ ! -e $HOME/.vim/pack/github/start/copilot.vim ];then
  git clone https://github.com/github/copilot.vim.git \
    ~/.config/nvim/pack/github/start/copilot.vim
fi
if [ ! -e $HOME/.vim/pack/github/start/copilot.vim ];then
  echo "github-copilot not found"
  exit 1
fi

# Tmux-plugin-manager
if [ ! -d ~/.tmux/plugins/tpm ];then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ ! -d ~/.tmux/plugins/tpm ];then
  echo "tpm not found"
  exit 1
fi

# enhancd
if [ ! -d ~/.zsh ];then
  mkdir ~/.zsh
fi
if [ ! -d ~/.zsh/enhancd ];then
  git clone https://github.com/b4b4r07/enhancd ~/.zsh/enhancd
fi
if [ ! -d ~/.zsh/enhancd ];then
  echo "enhancd not found"
  exit 1
fi

echo "Installed all!"
