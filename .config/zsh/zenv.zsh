export SPICETIFY_INSTALL="$HOME/.spicetify"
export PATH=$HOME/.emacs.d/bin:$HOME/.cargo/bin:$SPICETIFY_INSTALL:$HOME/.local/bin:$HOME/.local/bin/misc/:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export GDB_HISTFILE="$HOME/.gdb_history"
export ZSH_CACHE_DIR="$HOME/.local/share"
# export DOOMDIR="${XDG_CONFIG_HOME:-${HOME}/.config}/doom"

export VISUAL=nvim
export EDITOR=nvim

export DISABLE_AUTO_TITLE='true'
export MONITOR=all

if command -v batman >/dev/null 2>&1 && command -v bat >/dev/null 2>&1; then
  export MANPAGER="batman"
fi

# Conditionals

OSVER=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)

if command -v most >/dev/null 2>&1; then
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

# Really specific config

if [[ -f "$HOME/.config/zsh/special-${HOSTNAME}.zsh" ]]; then
  source "$HOME/.config/zsh/special-${HOSTNAME}.zsh"
fi

# GPG SSH AGENT

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
