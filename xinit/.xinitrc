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
# should after ALt-shift
setxkbmap -layout us,ara -option grp:alt_shift_toggle
xmodmap -e "keycode 66 = Shift_L"

# fix_date &
# pkill iwd

#setxkbmap fr
#dwl
while true; do
    # dwm >/dev/null 2>&1
    dwm >>/root/dwm.log 2>&1
done
