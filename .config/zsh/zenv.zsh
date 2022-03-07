#PATH
export SPICETIFY_INSTALL="/home/signed/spicetify-cli"
export PATH=$HOME/.cargo/bin:$SPICETIFY_INSTALL:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export GDB_HISTFILE="$HOME/.gdb_history"

export VISUAL=nvim
export EDITOR=nvim

export DISABLE_AUTO_TITLE='true'

#Conditionals

if [ -f "/usr/bin/bat" ]; then
#  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

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
fi

DOTNET_CLI_TELEMETRY_OPTOUT=1

#Plugin config
export VSCODE=code-insiders
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim' 'nvim' 'emacs')
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/home/signed/.local/lib/python3.9/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/home/signed/.local/lib/python3.9/site-packages/pdm/pep582'
fi

if [[ -f "$HOME/.config/zsh/special-${HOSTNAME}.zsh" ]]; then
  source "$HOME/.config/zsh/special-${HOSTNAME}.zsh"
fi
