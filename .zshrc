# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# gcc
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/wakabayashidaiki/Google\ Drive/My\ Drive/learn/atcoder/include/

# online judge tools
export PATH=$PATH:~/Library/Python/3.9/bin/

# Path
export PATH=$PATH:/opt/homebrew/bin/

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Auto init enhancd
autoload -Uz compinit
compinit
source ~/.zsh/enhancd/init.sh

# Prompt
# use pure prompt
# fpath+=($HOME/.zsh/pure)
# autoload -U promptinit; promptinit
# prompt pure
# use simplest prompt
precmd() { print "" } # add new line before print prompt
PROMPT='%F{magenta}❯%f '

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
export HISTSIZE=10000
export SAVEHIST=10000

# Alias
alias e='exit'
alias s='ssh waka'
alias ga='git add .'
alias gc='git commit -m'
alias gs='git push'
alias gl='git pull'
# alias ls='ls -F -G --color=auto'
alias ll='ls -l'
# alias l='ls'
alias la='ls -a'
alias fzf='fzf --reverse --border'
alias vim='nvim'

case ${OSTYPE} in
  darwin*)
		alias ls='lsd'
    ;;
  *)
    ;;
esac

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

# bat command color
export BAT_THEME="Nord"

# Functions

# auto_ls
# function chpwd(){
#     if [[ $(pwd) != ~/Google\ Drive/My\ Drive ]]; then;
#         ls
#     fi
# }
# autoload chpwd

# c() {
#   case ${OSTYPE} in
#     darwin*)
#       cd ~/Google\ Drive/My\ Drive
#       ;;
#     *)
#       cd
#       ;;
#   esac
#   dir=$(fd . -H --ignore-file ~/.config/git/ignore --type d | fzf) &&
#   cd "$dir"
# }

# v() {
#   case ${OSTYPE} in
#     darwin*)
#       # cd ~/Google\ Drive/My\ Drive
#       ;;
#     *)
#       # cd
#       ;;
#   esac
#   nvim `fd . -H --ignore-file /Users/wakabayashidaiki/.config/git/ignore --type f | fzf`
# }

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

# set up login directory
# case ${OSTYPE} in
#   darwin*)
#     cd ~/Google\ Drive/My\ Drive
#     ;;
#   *)
#     ;;
# esac

# ctrl-z to return vim
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

# zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit plugin
# zinit ice depth=1
# zinit light romkatv/powerlevel10k

# powerlevel10k
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
