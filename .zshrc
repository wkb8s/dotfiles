# Path
export PATH=$PATH:/opt/homebrew/bin/

# Auto init enhancd
autoload -Uz compinit
compinit
source ~/.zsh/enhancd/init.sh

# Prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# vi-mode
# bindkey -v

# General
setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt share_history

setopt hist_reduce_blanks
setopt hist_ignore_all_dups
set autochdir # not working

DIRSTACKSIZE=100
HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

# Alias
alias e='exit'
alias s='ssh waka'
alias ga='git add .'
alias gc='git commit -m'
alias gs='git push'
alias gl='git pull'
alias ls='ls -F -G --color=auto'
alias ll='ls -l'
alias l='ls'
alias la='ls -a'
alias fzf='fzf --reverse --border'
alias vim='nvim'

# Syntaxhighlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ctags and tmux
case ${OSTYPE} in
  darwin*)
    alias ctags="`brew --prefix`/bin/ctags -R -f .tags"
    if [ "$TMUX" = "" ]; then
	tmux;
    fi
    ;;
  *)
    alias ctags='ctags -R -f .tags'
    ;;
esac


# Functions

# auto_ls
# function chpwd(){
#     if [[ $(pwd) != ~/Google\ Drive/My\ Drive ]]; then;
#         ls
#     fi
# }
# autoload chpwd

c() {
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive
      ;;
    *)
      cd
      ;;
  esac
  dir=$(fd . -H --ignore-file ~/.config/git/ignore --type d | fzf) &&
  cd "$dir"
}

vc() {
  nvim `find . -type f | fzf`
}

v() {
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive/My\ Drive
      ;;
    *)
      cd
      ;;
  esac
  nvim `fd . -H --ignore-file /Users/wakabayashidaiki/.config/git/ignore --type f | fzf`
}

o() {
  case ${OSTYPE} in
    darwin*)
#      cd ~/Google\ Drive/My\ Drive
      ;;
    *)
      cd
      ;;
  esac
  open `find . -type f | fzf`
}

od() {
  local dir
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive/My\ Drive
      ;;
    *)
      cd
      ;;
  esac
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  open "$dir"
}

r() {
  case ${OSTYPE} in
    darwin*)
      mv $1 ~/Google\ Drive/My\ Drive/trash
      ;;
    *)
      ;;
  esac
}

# set up login directory
case ${OSTYPE} in
  darwin*)
    cd ~/Google\ Drive/My\ Drive
    ;;
  *)
    ;;
esac
