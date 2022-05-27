if [ -f $HOME/.config/zsh/zenv.zsh ]; then
  source $HOME/.config/zsh/zenv.zsh
fi

# Git
zi snippet OMZP::git
zi snippet OMZL::git.zsh
zi cdclear -q

# Git [Addons]
zi snippet OMZP::git-extras
zi snippet OMZP::gh
zi snippet OMZP::git-lfs

if [[ $OSVER == *"SUSE"* ]]; then
  zi snippet OMZP::suse
fi

# GPG/SSH/Security
zi snippet OMZP::gpg-agent
zi snippet OMZP::ssh-agent
zi snippet OMZP::keychain
zi snippet OMZP::safe-paste
zi snippet OMZP::firewalld

# Python
zi snippet OMZP::pip
zi snippet OMZP::pipenv
zi snippet OMZP::python
zi snippet OMZP::pylint
zi snippet OMZP::conda

# Sysadmin
zi snippet OMZP::sudo
zi snippet OMZP::cp
zi snippet OMZP::systemd
zi snippet OMZP::systemadmin
zi snippet OMZP::tmux

# Other
zi snippet OMZP::urltools
zi snippet OMZP::common-aliases
zi snippet OMZP::ag
zi snippet OMZP::colored-man-pages
zi snippet OMZP::history-substring-search

# OOB (Out-of-band)
zi light buonomo/yarn-completion
zi load chrissicool/zsh-256color
zi load zsh-users/zsh-completions
zi light lukechilds/zsh-better-npm-completion
zi light lukechilds/zsh-nvm
zi light zsh-users/zsh-syntax-highlighting

zi snippet OMZT::3den

#Config
#Keychain
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_ed25519_gitit id_ed25519_servers id_ed25519_local id_ecdsa

antigen apply


if [ -f $HOME/.config/zsh/zaliases.zsh ]; then
  source $HOME/.config/zsh/zaliases.zsh
fi

autoload -Uz compinit && compinit

# Zstyle
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select

# Setopt
setopt pushd_ignore_dups
setopt auto_pushd
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks



[[ -d /opt/asdf-vm ]] && . /opt/asdf-vm/asdf.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/stig124/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/stig124/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/stig124/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/stig124/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [[ "$HOSTNAME" != "g" ]]; then
  bindkey '^[OH' beginning-of-line
  bindkey '^[OF' end-of-line
fi
export PATH="$PATH:$HOME/.spicetify"
