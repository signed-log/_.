#PATH
export SPICETIFY_INSTALL="/home/stig124/spicetify-cli"
export PATH=$SPICETIFY_INSTALL:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export GDB_HISTFILE="$HOME/.gdb_history"

export VISUAL=emacs
export EDITOR=emacs

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

#Plugin config
export VSCODE=code-insiders
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim' 'nvim' 'emacs')
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/home/stig124/.local/lib/python3.9/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/home/stig124/.local/lib/python3.9/site-packages/pdm/pep582'
fi
