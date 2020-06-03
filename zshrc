ZSH_THEME="../../.dotfiles/akm"
DISABLE_AUTO_UPDATE="true"

plugins=(vi-mode)
plugins=(git)

export EDITOR=vim
export LOGNAME=izeal
export USER=izeal
export ZSH=$HOME/.oh-my-zsh

set -o vi
eval "$(rbenv init -)"

source $HOME/.dotfiles/.bash_aliases
source $HOME/.oh-my-zsh/oh-my-zsh.sh
