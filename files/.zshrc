#
# ZSH Configuration
#
# First load files from a ~/.zshrc.before.d directory then load files from
# ~/.zshrc.after.d directory.
#

BEFORE_DIR="$HOME/.zshrc.before.d"
AFTER_DIR="$HOME/.zshrc.after.d"

# Before - Usually Exports and Path additions
if [ -d $BEFORE_DIR ]; then
    if [ "$(ls -A $BEFORE_DIR)" ]; then
        for f in $BEFORE_DIR/*; do
            source $f;
        done
    fi
fi

# Oh-My-Zsh configuration
plugins=(git git-flow virtualenvwrapper ssh tmuxinator)
source $ZSH/oh-my-zsh.sh

# After Oh-My-Zsh has been sourced
if [ -d $AFTER_DIR ]; then
    if [ "$(ls -A $AFTER_DIR)" ]; then
        for f in $AFTER_DIR/*; do
            source $f;
        done
    fi
fi
