# Fix path 
export PATH=$HOME/.bin:$HOME/.cargo/bin:$HOME/.composer/vendor/bin:$HOME/bin:/usr/local/bin:$PATH:$HOME/.config/composer/vendor/bin

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(zsh-autosuggestions)

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

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

alias vim='nvim'
alias gs='git status'
alias c='cargo'
alias e='nvim'
alias g='git'
alias get_idf='. ~/dev/dtu/esp/esp-idf/export.sh'
alias sail='./vendor/bin/sail'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
