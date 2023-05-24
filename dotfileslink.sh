#!/bin/zsh

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
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/nvim ~/.config/nvim
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/git ~/.config/git
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/coc ~/.config/coc

		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/.clang-format ~/.clang-format
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/.tmux.conf ~/.tmux.conf
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/.zshrc ~/.zshrc
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/.hushlogin ~/.hushlogin
		ln -sf ~/Google\ Drive/My\ Drive/dotfiles/.latexmkrc ~/.latexmkrc
		echo "mac setup finished"
    ;;
  *)
    # for Linux
		ln -sf ~/dotfiles/nvim ~/.config/nvim
		ln -sf ~/dotfiles/git ~/.config/git
		ln -sf ~/dotfiles/coc ~/.config/coc

		ln -sf ~/dotfiles/.clang-format ~/.clang-format
		ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
		ln -sf ~/dotfiles/.zshrc ~/.zshrc
		ln -sf ~/dotfiles/.hushlogin ~/.hushlogin
		ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
		echo "linux setup finished"
    ;;
esac
