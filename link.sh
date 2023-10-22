#!/bin/bash

echo "started $0"

DOTFILES_DIR="$(cd ./home && pwd)"

for dotfile in "${DOTFILES_DIR}"/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue
    ln -fnsv "$dotfile" "$HOME"
done

mkdir -p ~/.ssh
ln -fnsv  "${DOTFILES_DIR}/.ssh/config" "$HOME/.ssh"

echo "finished $0"
