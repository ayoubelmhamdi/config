#!/bin/bash
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
xinit_lazy(){
    $HOME/scripts/bin/sl &
    sleep 1
    if [ -f "$HOME/.config/brightness/brightness-kernel" ];then
        # cat "$HOME/.config/brightness/xbps-install -Sy gtkbrightness-kernel" | sudo tee /sys/class/backlight/intel_backlight/brightness &
        xbacklight -set $(cat "$HOME/.config/brightness/brightness-kernel")
    fi
    sudo sed -E -i 's#nameserver ([0-9]{1,3}\.?){4}#nameserver 1.1.1.1#' /etc/resolv.conf  &
    ~/.fehbg &
    sxhkd > /tmp/log.xshkd.log  &
    ls /data ~ &
    amixer sset 'Master' 90% &
    # should fisrt ALt-shift
    
    # fix_date &
    # pkill iwd
    
    #setxkbmap fr
    #dwl

    # Sound
    exec pipewire &
    sleep 2
    exec pulseaudio &
    sleep 2
    exec pipewire-pulse &
    exec firefox-ram 5kc8rznt.default-default

    sleep 10
    nvim --headless $HOME/.config/nvim/init.lua +qall &

}

#setxkbmap -layout us,ara -option grp:alt_shift_toggle
### change menu to super
##xmodmap -e "keycode 135 = Super_R"
### change caps to shift
##xmodmap -e "keycode 66 = Shift_L"
### ALT_R --> Super
### xmodmap -e "clear mod1"
### xmodmap -e "clear mod4"
### xmodmap -e "keycode 108 = Super_R NoSymbol Super_R"

# turn off screen after 300 seconds
xset s 300
xmodmap ~/.Xmodmap
exec st &
exec numlockx on &
xinit_lazy &

while true; do
    # exec dwm >/dev/null 2>&1
    # exec gnome-shell
    #exec metacity
    exec i3
done
