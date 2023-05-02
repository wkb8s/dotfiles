# Path
export PATH=$PATH:/opt/homebrew/bin/

# Customize to your needs...
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto init enhancd
# autoload -Uz compinit
# compinit
# source ~/.zsh/enhancd/init.sh

# Prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# General
setopt no_beep
set autochdir # not working ... (;;)

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

# Syntaxhighlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ctags
case ${OSTYPE} in
  darwin*)
    alias ctags="`brew --prefix`/bin/ctags -R -f .tags"
    if [ "$TMUX" = "" ]; then tmux; fi
    ;;
  linux*)
    alias ctags='ctags -R -f .tags'
    ;;
esac


# Useful function
c() {
  local dir
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive/My\ Drive
      ;;
    linux*)
      cd
      ;;
  esac
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

vv() {
  nvim `find . -type f | fzf`
}

v() {
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive/My\ Drive
      ;;
    linux*)
      cd
      ;;
  esac
  nvim `find . -type f | fzf`
}

# set up login directory
case ${OSTYPE} in
  darwin*)
    cd ~/Google\ Drive/My\ Drive
    ;;
  linux*)
    ;;
esac
