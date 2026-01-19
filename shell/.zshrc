# Fix path 
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.dotnet/tools:$PATH

if [[ "$(uname -r)" = *"WSL"* ]]; then
    export PATH=/opt/nvim-linux-x86_64/bin:$PATH
fi

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

# ===============================
# Functions
# ===============================

# Really handy .gitignore tool
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# Set Java version
function jdk() { 
	version=$1
	export JAVA_HOME=$(/usr/libexec/java_home -v "$version")
	java -version; 
}

function no() {
    curl -sL https://naas.isalman.dev/no | jq -r .reason ; 
}

# ===============================
# User configuration
# ===============================

# History and autocompletion settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredumps
export ZSH_AUTOSUGGEST_HISTORY_IGNORE='(ls*|l*|la*|ll|lll|cd ..*|clear|bg|fg|exit|* --help|)'

# Locale
export LANG="en_US.UTF-8"

# ===============================
# GPG configuration
# ===============================

if [[ "$(uname -r)" != *"WSL"* ]]; then # GPG is run through Windows on WSL
	export GPG_TTY=$(tty)
	# SSH with GPG
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
fi

# ===============================
# Alias
# ===============================

alias ll='ls -lh'
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
if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ];
then
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh

    RUBIES+=(
        /opt/rubies
    )

    chruby ruby-3.1.2
fi

# nvm
if [[ "$(uname -r)" == "Darwin" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# pnpm
if [[ "$(uname -r)" == "Darwin" ]]; then
    export PNPM_HOME="/Users/gkauman/Library/pnpm"
else
    export PNPM_HOME="/home/gkauman/.local/share/pnpm"
fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# DotNet root
export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"

bindkey '\e[1;5C' forward-word        # ctrl right
bindkey '\e[1;5D' backward-word       # ctrl left
