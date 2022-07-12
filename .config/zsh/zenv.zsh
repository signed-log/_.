# PATH
export SPICETIFY_INSTALL="$HOME/spicetify-cli"
export PATH=$HOME/.cargo/bin:$SPICETIFY_INSTALL:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export GDB_HISTFILE="$HOME/.gdb_history"

export VISUAL=nvim
export EDITOR=nvim

export DISABLE_AUTO_TITLE='true'
export MONITOR=all

# Conditionals

OSVER=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

if [ -f "/usr/bin/most" ]; then
  export PAGER=most
  export DELTA_PAGER=most
fi

if [ -d "/opt/cuda/bin" ]; then
  export PATH="/opt/cuda/bin:$PATH"
fi

if [ -d "$HOME/dotnet" ]; then
  export PATH=$PATH:$HOME/dotnet
  export DOTNET_ROOT=$HOME/dotnet
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
fi

#Plugin config
export VSCODE=code-insiders

# NVM
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim' 'nvim' 'emacs')

if [[ -f "$HOME/.config/zsh/special-${HOSTNAME}.zsh" ]]; then
  source "$HOME/.config/zsh/special-${HOSTNAME}.zsh"
fi
