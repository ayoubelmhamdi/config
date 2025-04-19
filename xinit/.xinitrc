#!/bin/bash

# this is a magic to initialise dbus.
eval $(dbus-launch --sh-syntax)

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
doas_exist() {
    command -v doas >/dev/null
}
firefox_ramdisk(){
  exec firefox-ram 5kc8rznt.default-default &
  sleep 3
  exec shm "$HOME"/.local/share/nvim/site/pack &&
  exec shm "$HOME"/.config/nvim
}

lazy(){
    while ! pgrep st; do
        sleep 0.1
    done
    sleep 0.9
    "$@"
}


if [ -f "$HOME/.config/brightness/brightness-kernel" ];then
    # xbps-install -Sy xbacklight
    xbacklight -set "$(cat "$HOME/.config/brightness/brightness-kernel")" &
fi

# Daemons
st &
# lazy flameshot screen -c &
# ~/.fehbg &
sxhkd > /tmp/log.xshkd.log  &
ping-status &
nm-applet &

lazy ping-status & # NOTE: work when put it first not last started
lazy pipewire &
lazy /home/mhamdi/scripts/bin/get_bandwith_stream &
lazy xsetroot -name "Faild;" &
lazy dwmblocks 2>/tmp/dwmblocks.log &

# setting
amixer sset 'Master' 90% &
xset s 300 # turn off screen after 300 seconds
xmodmap ~/.Xmodmap
setxkbmap -layout us,ara -option grp:lalt_lshift_toggle -option caps:ctrl_modifier
numlockx on

doas_exist && lazy doas ntpdate 0.pool.ntp.org &
doas_exist && (doas modprobe -r wl && doas modprobe wl) &

lazy slock &


while true; do
    # exec dwm >/dev/null 2>&1
    # exec gnome-shell
    #exec metacity
    # dbus-run-session dwm >>/tmp/dwm.log 2>&1 # does not work for dwm
    # exec dwm
    # exec dbus-run-session dwm
    exec dwm

    # dwm >> /tmp/dwm.log 2>&1
    # exec i3 --shmlog-size=26214400
    # dbus-run-session i3 --shmlog-size=26214400
done
