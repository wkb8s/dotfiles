# bits/stdc++.h
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/.atcoder/include/

# online judge tools
export PATH=$PATH:~/Library/Python/3.9/bin/

# homebrew
export PATH=$PATH:/opt/homebrew/bin/ # for M1 mac
export PATH=$PATH:/usr/local/bin/ # for Intel mac

# java
## Intel mac
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
## M1 mac
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# git diff-highlight
export PATH=$PATH:/opt/homebrew/share/git-core/contrib/diff-highlight

# latex style file directory
export TEXINPUTS=~/.latex/

# Auto init enhancd
autoload -Uz compinit
compinit
source ~/.zsh/enhancd/init.sh

# Prompt
precmd() { print "" } # add new line before print prompt
PROMPT='%F{magenta}❯%f '

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
export HISTSIZE=10000
export SAVEHIST=10000

# Alias
alias e='exit'
alias s='ssh waka'
alias ga='git add .'
alias gc='git commit -m'
alias gs='git push'
alias gl='git pull'
alias ll='ls -l'
alias la='ls -a'
alias fzf='fzf --reverse --border'
if type "lsd" > /dev/null 2>&1; then
    alias ls='lsd'
else
		alias ls='ls -F -G --color=auto'
fi
if type "nvim" > /dev/null 2>&1; then
		alias vim='nvim'
fi
if type "bat" > /dev/null 2>&1; then
    alias cat="bat"
		export BAT_THEME="Nord"
fi

# enable zsh plugin
if type "brew" > /dev/null 2>&1; then
		source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

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
o() {
  case ${OSTYPE} in
    darwin*)
      cd ~/Google\ Drive/My\ Drive
      ;;
    *)
      cd
      ;;
  esac
  open `find . | fzf`
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

# replace '^Z' to "fg"
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
