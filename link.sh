#!/bin/bash

echo "started $0"

DOTFILES_DIR="$(cd ./home && pwd)"

for dotfile in "${DOTFILES_DIR}"/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.config/coc" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

ln -fnsv ./home/.config/coc/ultisnips "$HOME"

echo "finished $0"
