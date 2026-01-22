#!/bin/zsh

export LINUX=void

#local xlocate file /bin/usr/wget : output is wget-2-3
alias lxl='xbps-query -o' 
alias xl='xlocate'

alias void-sync='sudo ntpdate 0.pool.ntp.org && sleep 1 && ping -c 1 repo-default.voidlinux.org && iu -S -y'
