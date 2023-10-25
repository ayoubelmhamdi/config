#!/usr/bin/zsh
#
#         _   _
#  __ _  | | (_)   __ _   ___
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/


# Utilities

# testin aliases
alias fg='fg 2>/dev/null|| true'
alias termux='command termux'
alias termuxsd='command termux -t sd'

# TODO: mouve to cd
source $HOME/scripts/app/cdf
alias b=cd_book

alias stat="stat -c '%a  user:%U group:%G'"

alias lsblk='echo;lsblk --output LABEL,FSUSE%,NAME,MOUNTPOINT,UUID'
# alias ip=/usr/local/bin/ip
alias cu='curl -LO'
alias c=clear
alias history='history 0|fzf'

alias nv='devour neovide --nofork'


function ig () {
 command grep -i --color=auto $@
}


# server http
# alias live='setsid /root/.cargo/bin/live-server -h localhost -p 8001 >/dev/null 2>&1'

# swallow by devour /sbin/mpv
# alias mpv='devour /sbin/mpv'
alias time='/usr/bin/time'




#alias ls='clear ; echo ; ;exa  --color=always --group-directories-first'
#alias nls='exa    --color=always --group-directories-first'
#alias la='exa -a --color=always --group-directories-first'
#alias ll='exa -l --color=always --group-directories-first'


alias df="echo ;df -x squashfs -x tmpfs -x devtmpfs -h"
# alias ddd='clear ;echo ; du -ah --max-depth 1|sort --sort=human-numeric --human-numeric-sort -r;'



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


alias untar='tar xvf'
# alias vtar='tar -tf'
# alias c='clear && tmux clear-history  >/dev/null 2>&1;echo'


# function ls(){
#   clear 
#   /bin/exa --icons --color=always --group-directories-first "$@"
# }
# function nls(){
#   /bin/exa --icons --color=always --group-directories-first "$@"
# }
# function la(){
#   /bin/exa -a --icons --color=always --group-directories-first "$@"
# }
# function ll(){
#   /bin/exa -l --icons --color=always --group-directories-first "$@"
# }
#





alias gc='git clone --depth=1'
alias co='git commit -m'

alias log='git log --oneline'
alias lg='git lg'
# alias gdiff="git diff | sed -E 's#^(.{40}).*#\1...#' | PAGER='bat -p' delta"
# alias show_full="git show |  PAGER='bat -p' delta"
# alias gdiff="    git diff | PAGER='bat -p' delta"

show(){
  local file="${1:-}"
  if [ -z "$file" ];then
    git show | sed -E 's#^(.{40}).*#\1...#' | PAGER='bat -p' delta
  else
    git show $file | sed -E 's#^(.{40}).*#\1...#' | PAGER='bat -p' delta
  fi
}

gdiff(){
  local file="${1:-}"
  if [ -z "$file" ];then
    git diff | sed -E 's#^(.{40}).*#\1...#' | PAGER='bat -p' delta
  else
    git diff $file | sed -E 's#^(.{40}).*#\1...#' | PAGER='bat -p' delta
  fi
}

# xclip
alias xc='xclip -selection clipboard'
alias du='du -h '
alias wget='wget -c'

# nvim alias
# alias v='nvim -u $avim/init.lua'
alias pager="nvim -c 'setf markdown|set noswapfile| setlocal buftype=nofile'  -"
alias which='command -v'
#alias e='nvimdir=~/.config/nvim nvim'
# alias v='nvim'
alias vv='v -c "Telescope frecency default_text=:CWD:"'
alias atmux='tmux a|| tmux'

#alias ping='ping -c 1'
alias df_device="df -h -kHl | grep -v 'cgroup\|tmp'"
# # typos
# abbr gti git
# abbr yearn yarn
# abbr py python
# abbr -a -- - 'cd -'



# alias cat='bat -p'
#
# alias ls='clear ;exa --icons --color=always --group-directories-first'
# alias nls='exa   --icons --color=always --group-directories-first'
# alias la='exa -a --icons --color=always --group-directories-first'
# alias ll="exa -abghHlS --icons --git --group-directories-first"


alias lxl='xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
alias xl='xlocate'


alias sysinfo="inxi -Fxxxz"

alias liber=libreoffice
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


alias cd..="builtin cd .." # Typo addressed.
alias -- -="builtin cd -"
alias cd_='builtin cd $_'
alias ..='builtin cd ..'
alias ...='builtin cd ../..'
alias ....='builtin cd ../../..'

alias cg=cd_git_root

if command -v unbuffer >/dev/null;then
  alias ujq="unbuffer jq"
fi

function jqv(){
  command jq $@ | nvim +Man! +"setf json"
}

if command -v doas >/dev/null;then
  alias sudo=doas
fi

if command -v openvpn >/dev/null;then
  alias openvpn='sudo openvpn --data-ciphers AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:AES-128-CBC --config'
fi
