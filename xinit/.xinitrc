#!/bin/bash

#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'

lazy(){
    nvim --headless +qall &
    sleep 300
    launch_brave
}

st &
~/.fehbg &
sl &
sxhkd   &
ls &
lazy &
amixer sset 'Master' 90% &

# change caps to shift
xmodmap -e "keycode 66 = ISO_Level3_Shift"

# fix_date &
# pkill iwd

#setxkbmap fr
#dwl
while true; do
    dwm >/dev/null 2>&1
done
