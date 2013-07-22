export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="chris"
export DISABLE_AUTO_TITLE=true
export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/opt/boxen/homebrew/bin:$PATH  # Add homebrew bin to PATH
PATH=/opt/boxen/homebrew/Cellar/python/2.7.3-boxen2/share/python:$PATH  # Add python bin to path

plugins=(git virtualenvwrapper git-flow ssh tmuxinator)
source $ZSH/oh-my-zsh.sh

# If Boxen env exists source it
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# If ~/.autoenv/activate.sh exists source it
[ -f $HOME/.autoenv/activate.sh ] && source $HOME/.autoenv/activate.sh
