# Fix path 
export PATH=$HOME/.composer/vendor/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="/home/gustav/.oh-my-zsh"

# Plugins
plugins=(zsh-autosuggestions)

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

# ===============================
# User configuration
# ===============================

# History and autocompletion settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredumps
export ZSH_AUTOSUGGEST_HISTORY_IGNORE='(ls|l|la|ll|lll|cd ..|clear|bg|fg|exit|* --help|)'
