#         _   _               
#  __ _  | | (_)   __ _   ___ 
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/


# Utilities

# Source

source $HOME/scripts/app/cdf
alias b=cd_book
alias lsblk='echo;lsblk --output LABEL,FSUSE%,NAME,MOUNTPOINT'
# alias ip=/usr/local/bin/ip
alias cu='curl -LO'
alias c=clear
alias nv='devour neovide --nofork'
alias history='history 0|fzf'


function ig () {
 command grep -i --color=auto $@ 
}


# server http
# alias live='setsid /root/.cargo/bin/live-server -h localhost -p 8001 >/dev/null 2>&1'

# swallow by devour /sbin/mpv
alias mpv='devour /sbin/mpv'
alias time='/usr/bin/time'


# mv, rm, cp
alias rm="rm -ivr"
alias cp="cp -ivr"
alias mv='mv -iv'
# alias rm='rm -Ivr'
alias trash-list="trash-list --trash-dir=/root/.Trash-0"
alias trash-restore="trash-restore --trash-dir=/root/.Trash-0"
alias rmt='trash_rm'
alias rmf='command rm -vrf'
alias x='chmod +x'

alias w=whereis




#alias ls='clear ; echo ; ;exa  --color=always --group-directories-first'
#alias nls='exa    --color=always --group-directories-first'
#alias la='exa -a --color=always --group-directories-first'
#alias ll='exa -l --color=always --group-directories-first'


alias df="df -h"
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
alias gdiff='git diff'
alias up='git commit -m "up"'


alias ncat='/sbin/cat'
alias tarxf='tar xvf'
alias untar='tar xvf'
alias tarcf='tar cvf'
alias viewtar='tar -tf'
# alias c='clear && tmux clear-history  >/dev/null 2>&1;echo'







alias gc='git clone --depth=1'
alias gc-main='git clone --depth=1 --branch=main'
alias co='git commit -m'

alias log='git log --oneline'


# xclip
alias xc='xclip -selection clipboard'
alias du='du -h '
alias wget='wget -c'

# nvim alias
# alias v='nvim -u $avim/init.lua'
alias which='command -v'
#alias e='nvimdir=~/.config/nvim nvim'
# alias v='nvim'
alias vv='v -c "Telescope frecency default_text=:CWD:"'
alias atmux='tmux a|| tmux'

alias ping='ping -c 1'
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


alias cd..="cd .." # Typo addressed.
alias -- -="cd -"
alias cd_='cd $_'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='../../../../..'

