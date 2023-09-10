# yabai
yabai --start-service

# skhd
skhd --start-service

# fzf: install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# enhancd
git clone https://github.com/b4b4r07/enhancd ~/.zsh
