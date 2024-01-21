#!/bin/bash

# shellcheck disable=2181,2086,2093
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
start_st(){
  exec st &
}

start_sl(){
  sl &
}

start_flameshot(){
  sleep 10 && flameshot screen -c
}

set_brightness(){
  if [ -f "$HOME/.config/brightness/brightness-kernel" ];then
    # cat "$HOME/.config/brightness/xbps-install -Sy gtkbrightness-kernel" | sudo tee /sys/class/backlight/intel_backlight/brightness &
    xbacklight -set "$(cat "$HOME/.config/brightness/brightness-kernel")"
  fi
}

start_feh(){
  ~/.fehbg &
}

start_sxhkd(){
  sxhkd > /tmp/log.xshkd.log  &
}

first_ls(){
  ls /data ~ &
}

_enable_execution(){
  mount -o remount,exec /tmp
}

set_volume(){
  amixer sset 'Master' 90% &
}


firefox_ramdisk(){
  exec firefox-ram 5kc8rznt.default-default &
  sleep 3
  exec shm "$HOME"/.local/share/nvim/site/pack &&
    exec shm "$HOME"/.config/nvim
}

screen_sleep(){
  # turn off screen after 300 seconds
  xset s 300
}

remap_keyboard(){
  xmodmap ~/.Xmodmap
}

enable_numlock(){
  numlockx on &
}

# start_sound(){
#   # /home/mhamdi/scripts/bin/sound-switch &
#   :
# }

ping_status(){
  ping-status &
}

start_NetworkManager(){
  nm-applet &
}

status_dwmblocks(){
  dwmblocks
  xsetroot -name "Faild;"
}

xinit_lazy(){
  ping_status # NOTE: work when put it first not last started
  sleep 1
  start_st
  start_sxhkd
  set_brightness
  # start_feh
  first_ls
  set_volume
  pipewire &
  dwmblocks 2>/tmp/dwmblocks.log &
  status_dwmblocks &
  get_bandwith_stream &
  setxkbmap -layout us,ara -option grp:lalt_lshift_toggle -option caps:escape &
  screen_sleep
  remap_keyboard
  enable_numlock
  # start_flameshot
  start_NetworkManager
  # firefox_ramdisk
}

xinit_lazy

#dwm >> /tmp/dwm.log 2>&1
while true; do
    # exec dwm >/dev/null 2>&1
    # exec gnome-shell
    #exec metacity
    dwm >> /tmp/dwm.log 2>&1
    # exec i3 --shmlog-size=26214400
done
