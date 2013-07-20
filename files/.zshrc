export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"
export DISABLE_AUTO_TITLE=true
export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

plugins=(git virtualenvwrapper git-flow ssh tmuxinator)
source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
