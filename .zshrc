# Path
export PATH=$PATH:/opt/homebrew/bin/

# Customize to your needs...
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
source ~/.zsh/enhancd/init.sh

# Prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# General
setopt no_beep

# Alias
alias c='cd'
alias e='exit'
alias v='nvim'
alias s='ssh waka'
alias ga='git add .'
alias gc='git commit -m'
alias gs='git push'
alias gl='git pull'
alias ls='ls -F -G --color=auto'
alias ll='ls -l'
alias l='ls -a'
alias la='ls -a'

# Ctags
case ${OSTYPE} in
  darwin*)
    alias ctags="`brew --prefix`/bin/ctags -R -f .tags"
    ;;
  linux*)
    alias ctags='ctags -R -f .tags'
    ;;
esac

# Syntaxhighlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
