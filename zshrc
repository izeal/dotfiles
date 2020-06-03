ZSH=~/.oh-my-zsh
ZSH_THEME="../../.dotfiles/akm"
plugins=(vi-mode)
export EDITOR=vim

# Change to your login
export LOGNAME=izeal
export USER=izeal

set -o vi

export ZSH=$HOME/.oh-my-zsh

source $HOME/.dotfiles/.bash_aliases

eval "$(rbenv init -)"

DISABLE_AUTO_UPDATE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
