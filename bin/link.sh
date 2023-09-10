#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for dotfile in "${SCRIPT_DIR}"/.??* ; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

# tex style files
# ln -fnsv ".latex/*.sty" "/usr/local/texlive/2022/texmf-dist"
sudo ln -fnsv ".latex/*.sty" "/usr/local/texlive/2023/texmf-dist"
mktexlsr
