#!/bin/bash

#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'

st &
lazy(){
    sleep 1
    sudo chown -R $USER /sys/class/backlight/intel_backlight/brightness &&
    echo 937 > /sys/class/backlight/intel_backlight/brightness &
    sed -E -i 's#nameserver ([0-9]{1,3}\.?){4}#nameserver 1.1.1.1#' /etc/resolv.conf  &
    ~/.fehbg &
    sl &
    sleep 1
    sxhkd   &
    ls &
    amixer sset 'Master' 90% &
    # should fisrt ALt-shift
    setxkbmap -layout us,ara -option grp:alt_shift_toggle
    # change menu to super
    xmodmap -e "keycode 135 = Super_R"
    # change caps to shift
    xmodmap -e "keycode 66 = Shift_L"
    # ALT_R --> Super
    # xmodmap -e "clear mod1"
    # xmodmap -e "clear mod4"
    # xmodmap -e "keycode 108 = Super_R NoSymbol Super_R"
    
    # fix_date &
    # pkill iwd
    
    #setxkbmap fr
    #dwl

    sleep 10
    nvim --headless $HOME/.config/nvim/init.lua +qall
    sleep 200
    launch_brave
}

lazy &

while true; do
    dwm >/dev/null 2>&1
done
