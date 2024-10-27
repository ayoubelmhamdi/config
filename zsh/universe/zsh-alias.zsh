#!/usr/bin/zsh
#
#         _   _
#  __ _  | | (_)   __ _   ___
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/


# Utilities

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


# alias tmux='command tmux a 2>/dev/null || command tmux' # use one termux on every termials
alias proj='builtin cd "$(shuff-projects)"'
alias ls='normalls'
alias cal='cal -m'
alias vc='dvim c'
alias nnn='NNN_FIFO="${TMPFILE:-/tmp}/nnn.fifo" NVIM_APPNAME=nvim-ayoub nnn'
alias py='python3'
alias unstow='stow -D'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

alias upip='pip install -U pip'
alias fg='fg 2>/dev/null|| true'
alias termuxsd='termux -t sd'

alias stat="stat -c '%a  user:%U group:%G'"
alias lsblk='echo;lsblk --output LABEL,FSUSE%,NAME,MOUNTPOINT,UUID'
alias cu='curl -LO'
alias c=clear
alias history='history 0|fzf'
alias time='/usr/bin/time'
alias df="echo ;df -x squashfs -x tmpfs -x devtmpfs -h"

alias main="git checkout main ^ /dev/null || git checkout master"
alias master="main"
alias add='git add'
alias addu='git add -u'
alias branch='git branch'
alias checkout='git checkout'
alias push='git push '
alias pull='git pull '
alias sta='git status -s'
alias up='git commit -m "up"'
alias gc='git clone --depth=1'
alias co='git commit -m'

alias lg='git log --oneline'




alias untar='tar xvf'
alias vzip='zip -sf'


# xclip
alias xc='xclip -selection clipboard'
alias xo='xclip -o -sel clip'


alias du='du -h '
alias wget='wget -c'

# nvim alias
alias pager="NVIM_APPNAME=nvim-ayoub nvim -c 'setf markdown|set noswapfile| setlocal buftype=nofile'  -"
alias which='command -v'


alias lxl='xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
alias xl='xlocate'


alias sysinfo="inxi -Fxxxz" # we need to check the inxi if exist

alias liber=libreoffice
alias lb=libreoffice



alias -- -="builtin cd -"
alias cd_='builtin cd $_'
alias ..='builtin cd ..'
alias ...='builtin cd ../..'
alias ....='builtin cd ../../..'

if command -v unbuffer >/dev/null;then
  alias jq="unbuffer jq"
else
  alias jq="jq"
fi



if command -v doas >/dev/null;then
  alias sudo=doas
fi

if command -v openvpn >/dev/null;then
  alias openvpn='sudo openvpn --data-ciphers AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:AES-128-CBC --config'
fi


\=() {
  math-eval "$@"
}

function jqv(){
  command jq $@ | NVIM_APPNAME=nvim-ayoub nvim +Man! +"setf json foldlevel=99 nornu buftype=nofile noswapfile"
}
