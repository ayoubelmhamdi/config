#         _   _               
#  __ _  | | (_)   __ _   ___ 
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function ig       ; /sbin/grep -i --color=auto $argv ; end

# swallow by devour /sbin/mpv
alias mpv='devour /sbin/mpv'
alias zt='devour zathura'


# mv, rm, cp
alias cp="cp -ivr"
alias mv='mv -iv'
alias rm='rm -Ivr'
alias rmf='/sbin/rm -vrf'
alias x='chmod +x'

alias w=whereis




#alias ls='clear ; echo ; ;exa  --color=always --group-directories-first'
#alias nls='exa    --color=always --group-directories-first'
#alias la='exa -a --color=always --group-directories-first'
#alias ll='exa -l --color=always --group-directories-first'


alias ag='ag --follow --hidden -W (math $COLUMNS - 11)'
alias df="df -h"
alias grep="/sbin/grep"
# alias ddd='clear ;echo ; du -ah --max-depth 1|sort --sort=human-numeric --human-numeric-sort -r;'




alias main="git checkout main ^ /dev/null || git checkout master"
alias master="main"
alias add='git add'
alias addu='git add -u'
alias branch='git branch'
alias checkout='git checkout'
alias push='git push '
alias pull='git pull '
alias sta='git status'
alias gdiff='git diff'
alias up='git commit -m "up"'


alias ncat='/sbin/cat'
alias tarxf='tar xf'
alias tarcf='tar cf'
alias c='clear && tmux clear-history  >/dev/null 2>&1;echo'







alias gc='git clone --depth=1 --branch=master'
alias gc-main='git clone --depth=1 --branch=main'
alias co='git commit -m'

alias log='git log --oneline'


# xclip
alias xc='xclip -selection clipboard'
alias du='du -h '
alias wget 'wget -c'
alias xl='xlocate'

# nvim alias
# alias v='nvim -u $avim/init.lua'
alias which='command -v'
alias e='nvimdir=~/.config/nvim nvim'
alias v='nvimdir=~/.config/nvim nvim'
alias vv='v -c "Telescope frecency default_text=:CWD:"'
alias atmux='tmux a|| tmux'

alias ping='ping -c 1'
# typos
abbr gti git
abbr yearn yarn
abbr py python
abbr -a -- - 'cd -'

