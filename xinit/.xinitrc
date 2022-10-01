#!/bin/bash
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
xinit_lazy(){
    sl &
    sleep 1
    echo 937 | sudo tee /sys/class/backlight/intel_backlight/brightness &
    sudo sed -E -i 's#nameserver ([0-9]{1,3}\.?){4}#nameserver 1.1.1.1#' /etc/resolv.conf  &
    ~/.fehbg &
    sleep 1
    sxhkd   &
    ls &
    amixer sset 'Master' 90% &
    # should fisrt ALt-shift
    
    # fix_date &
    # pkill iwd
    
    #setxkbmap fr
    #dwl

    sleep 10
    nvim --headless $HOME/.config/nvim/init.lua +qall
    nvim --headless $HOME/.config/nvim/init.lua +qall
    sleep 200
    launch_brave
}

setxkbmap -layout us,ara -option grp:alt_shift_toggle
Xmodmap ~/.Xmodmap
### change menu to super
##xmodmap -e "keycode 135 = Super_R"
### change caps to shift
##xmodmap -e "keycode 66 = Shift_L"
### ALT_R --> Super
### xmodmap -e "clear mod1"
### xmodmap -e "clear mod4"
### xmodmap -e "keycode 108 = Super_R NoSymbol Super_R"

xmodmap ~/.Xmodmap &
st &
xinit_lazy &

while true; do
    dwm >/dev/null 2>&1
done
