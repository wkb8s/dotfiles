#!/bin/sh

##########
# set up #
##########

# setup neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

# link
case ${OSTYPE} in
  darwin*)
    # for Mac
		ln -sf ~/Google\ Drive/My\ Drive/src/.dotfiles/nvim ~/.config/nvim
		ln -sf ~/Google\ Drive/My\ Drive/src/.dotfiles/.clang-format ~/.clang-format
		ln -sf ~/Google\ Drive/My\ Drive/src/.dotfiles/.tmux.conf ~/.tmux.conf
		ln -sf ~/Google\ Drive/My\ Drive/src/.dotfiles/.zshrc ~/.zshrc
		ln -sf ~/Google\ Drive/My\ Drive/src/.dotfiles/.hushlogin ~/.hushlogin
    ;;
  linux*)
    # for Linux
		ln -sf ~/.dotfiles/nvim ~/.config/nvim
		ln -sf ~/.dotfiles/.clang-format ~/.clang-format
		ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
		ln -sf ~/.dotfiles/.zshrc ~/.zshrc
		ln -sf ~/.dotfiles/.hushlogin ~/.hushlogin
    ;;
esac
