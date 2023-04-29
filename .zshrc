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
alias v='nvim'
alias ls='ls -F -G --color=auto'
alias ll='ls -l'
alias la='ls -a'

# Syntaxhighlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
