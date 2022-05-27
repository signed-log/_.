if [ -f $HOME/.config/zsh/zenv.zsh ]; then
  source $HOME/.config/zsh/zenv.zsh
fi

source $HOME/.local/bin/antigen.zsh

antigen use oh-my-zsh

#Compulsory
antigen bundle git

#Non-default library
antigen bundles <<EOBUNDLES
  buonomo/yarn-completion
  chrissicool/zsh-256color
  zsh-users/zsh-completions
  lukechilds/zsh-better-npm-completion
  lukechilds/zsh-nvm
EOBUNDLES

# OMZ library - Autocomplete
antigen bundles <<EOBUNDLES
  ag
  colored-man-pages
  doctl
  gh
  git-extras
  pip
  pylint
EOBUNDLES
# OMZ - Aliases
antigen bundles <<EOBUNDLES
  suse
  common-aliases
  cp
  firewalld
  git-lfs
  python
  systemadmin
  systemd
  tmux
  urltools
EOBUNDLES
# OMZ - Others
antigen bundles <<EOBUNDLES
  conda
  gpg-agent
  ssh-agent
  keychain
  pipenv
  safe-paste
  sudo
  history-substring-search
EOBUNDLES

#Pinned
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme ohmyzsh/ohmyzsh themes/3den

#Config
#Keychain
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities  id_ed25519_gitit id_ed25519_servers id_ed25519_local

antigen apply


if [ -f $HOME/.config/zsh/zaliases.zsh ]; then
  source $HOME/.config/zsh/zaliases.zsh
fi

autoload -U compinit && compinit
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select

_mkcd() { _path_files -/ }
compdef _mkcd mkcd

[[ -d /opt/asdf-vm ]] && . /opt/asdf-vm/asdf.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/signed/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/signed/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/signed/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/signed/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# if [[ "$HOSTNAME" != "g" ]]; then
#   bindkey '^[OH' beginning-of-line
#   bindkey '^[OF' end-of-line
# fi
export PATH="$PATH:$HOME/.spicetify"
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z.digitalclouds.dev/ecosystem/annexes
zicompinit # <- https://z.digitalclouds.dev/docs/guides/commands
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes @zunit
