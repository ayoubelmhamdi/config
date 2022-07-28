#!/bin/zsh
export nvimdir="$HOME/.config/nvim"
export packerdir="$HOME/.local/share/nvim/site/pack/packer/start"


alias cat='/bin/bat -p'

alias ls='clear ;/bin/exa --icons --color=always --group-directories-first'
alias nls='/bin/exa --icons --color=always --group-directories-first'
alias la='/bin/exa -a --icons --color=always --group-directories-first'
alias ll='/bin/exa -l --icons --color=always --group-directories-first'


#local xlocate file /bin/usr/wget : output is wget-2-3
alias lxl='xbps-query -o' 
alias xl='xlocate'
