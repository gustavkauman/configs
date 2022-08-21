# Fix path 
export PATH=$HOME/.cargo/bin:$HOME/bin:$PATH

# Path to oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set the theme
# ZSH_THEME="robbyrussell"

# Plugins
plugins=(zsh-autosuggestions)

# Load oh my zsh
# source $ZSH/oh-my-zsh.sh

# Set prompt
PROMPT=" %{$fg[cyan]%}%c%{$reset_color%} "

# Really handy .gitignore tool
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# ===============================
# User configuration
# ===============================

# History and autocompletion settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredumps
export ZSH_AUTOSUGGEST_HISTORY_IGNORE='(ls*|l*|la*|ll|lll|cd ..*|clear|bg|fg|exit|* --help|)'

# ===============================
# Alias
# ===============================

alias ll='ls -lah'
alias grep='grep --color=auto'
alias vim='nvim'
alias gs='git status'
alias c='cargo'
alias e='nvim'
alias g='git'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ruby specifics
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.2
