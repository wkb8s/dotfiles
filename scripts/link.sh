#!/bin/bash

DOTFILES_DIR="$(cd ./home && pwd)"

# copy history template
if [ ! -e ~/.zsh_history ];then
  echo "created .zsh_history"
  cp home/.zsh_history ~/
fi

for dotfile in "${DOTFILES_DIR}"/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.ssh" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.zsh_history" ]] && continue
    ln -fnsv "$dotfile" "$HOME"
done

# ssh
mkdir -p ~/.ssh
if [ "$(uname)" == "Linux" ] ; then
  if [ ! -e ~/.ssh/id_rsa.pub ];then
    (cd ~/.ssh && ssh-keygen -t rsa)
  fi
fi
if [ "$(uname)" == "Darwin" ] ; then
    ln -fnsv "${DOTFILES_DIR}/.ssh/config" "$HOME/.ssh"
fi


# Linux ssh setting here

# Java
if [ ! -e /Library/Java/JavaVirtualMachines/openjdk.jdk ];then
  # Intel mac
  if [ -e /usr/local/opt/openjdk/libexec/openjdk.jdk ];then
    sudo ln -fnsv /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  fi

  # M1 mac
  if [ -e /opt/homebrew/opt/openjdk/libexec/openjdk.jdk ];then
    sudo ln -fnsv /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  fi
fi

