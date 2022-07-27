#!/bin/bash

#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'

funbrave(){
    sleep 20
    launch_brave
}

st &
~/.fehbg &
sl &
sxhkd   &
nvim --headless -c 'qall' &
ls &
funbrave &



fix_date &
# pkill iwd

#setxkbmap fr
#dwl
while true; do
    dwm >/dev/null 2>&1
done
