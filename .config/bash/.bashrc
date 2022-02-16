#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/stig124/.sdkman"
[[ -s "/home/stig124/.sdkman/bin/sdkman-init.sh" ]] && source "/home/stig124/.sdkman/bin/sdkman-init.sh"

source /home/stig124/.config/broot/launcher/bash/br
export PATH="$PATH:$HOME/.spicetify"
