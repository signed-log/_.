if [ -f $HOME/.config/zsh/zenv.zsh ]; then
  source $HOME/.config/zsh/zenv.zsh
fi

source /usr/share/zsh/share/antigen.zsh

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
  archlinux
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
  gpg-agent
  ssh-agent
  keychain
  vscode
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
zstyle :omz:plugins:keychain identities 4283F127DD1E0E2EA976F3C0273140E170D76BA6 id_ed25519_gitit id_ed25519_servers id_ed25519_local

antigen apply


if [ -f $HOME/.config/zsh/zaliases.zsh ]; then
  source $HOME/.config/zsh/zaliases.zsh
fi

autoload -U compinit && compinit
zstyle ':completion:*' rehash true


