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

function is_exist() {
    command -v "$1" >/dev/null
}


alias ag="ag --vimgrep"
alias cp="cp -ivr"
alias mv='mv -iv'
alias ncat='/sbin/cat'
# alias cat='bat -p'


alias pipu="pip install --upgrade pip"
alias proj='builtin cd "$(shuff-projects)"'
alias y='yt-dlp'
alias ls='normalls'
alias cal='cal -m'
alias vc='dvim c'
alias nnn='NNN_FIFO="${TMPDIR:-/tmp}/nnn.fifo" NVIM_APPNAME=nvim-ayoub nnn'
alias py='python3'
alias unstow='stow -D'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

alias upip='pip install -U pip'
alias fg='fg 2>/dev/null|| true'
alias termuxsd='termux -t sd'

alias stat="stat -c '%a  user:%U group:%G'"
alias lsblk='echo;lsblk --output LABEL,FSUSE%,NAME,MOUNTPOINT,UUID'
alias cu='curl -LO'
alias c='printf "\033c"; clear ; pidof tmux 1>/dev/null && tmux clear-history || true'
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
alias PAGER="NVIM_APPNAME=nvim-ayoub nvim -c 'setf markdown|set noswapfile| setlocal buftype=nofile'  -"
alias which='command -v'


alias lxl='xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
alias xl='xlocate'



alias liber=libreoffice
alias lb=libreoffice



alias -- -="builtin cd -"
alias cd_='builtin cd $_'
alias ..='builtin cd ..'
alias ...='builtin cd ../..'
alias ....='builtin cd ../../..'


is_exist inxi && alias sysinfo="inxi -Fxxxz" # we need to check the inxi if exist
is_exist unbuffer && alias jq="unbuffer jq"
is_exist doas && alias sudo=doas
is_exist openvpn && alias openvpn='sudo openvpn --data-ciphers AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:AES-128-CBC --config'
[ -f /home/mhamdi/scripts/tools/cat ] && alias cat=/home/mhamdi/scripts/tools/cat


\=() {
  math-eval "$@"
}

function jqv(){
  jq "$@" | NVIM_APPNAME=nvim-ayoub nvim +Man! +"setf json foldlevel=99 nornu buftype=nofile noswapfile"
}
