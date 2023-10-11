#!/bin/zsh

export LINUX=void

alias cat='/bin/bat -p'

function ls(){
  clear 
  /bin/exa --icons --color=always --group-directories-first "$@"
}
function nls(){
  /bin/exa --icons --color=always --group-directories-first "$@"
}
function la(){
  /bin/exa -a --icons --color=always --group-directories-first "$@"
}
function ll(){
  /bin/exa -l --icons --color=always --group-directories-first "$@"
}


#local xlocate file /bin/usr/wget : output is wget-2-3
alias lxl='xbps-query -o' 
alias xl='xlocate'
