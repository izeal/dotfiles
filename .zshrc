ZSH=~/.oh-my-zsh
ZSH_THEME="../../dotfiles/akm"
plugins=(vi-mode)
export EDITOR=vim

# Change to your login
export LOGNAME=izeal
export USER=izeal


set -o vi


export ZSH=$HOME/.oh-my-zsh

source $HOME/.bash_aliases

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# ZSH_THEME="amuse" # favorite them by Ivan Filenko
DISABLE_AUTO_UPDATE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh



