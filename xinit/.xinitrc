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

start_sound(){
  echo "=====$(date)=========" >> /tmp/log.pipewire.log
  exec pipewire  >> /tmp/log.pipewire.log 2>&1 &
  if [ $? -eq 0 ];then
    sleep 3
    exec pulseaudio --start  >> /tmp/log.pipewire.log 2>&1 &
    if [ $? -eq 0 ];then
      sleep 3
      exec pipewire-pulse  >> /tmp/log.pipewire.log 2>&1 &
      if [ $? -ne 0 ];then
        echo 'pipewire-pulse not start' >> /tmp/log.pipewire.log
      fi
    else
      echo 'pulseaudio not start' >> /tmp/log.pipewire.log
    fi
  else
    echo 'pipewire not start' >> /tmp/log.pipewire.log
  fi
}

ping_status(){
  ping-status &
}


xinit_lazy(){
  ping_status # NOTE: work when put it first not last started
  sleep 1
  start_st
  start_sxhkd
  set_brightness
  start_feh
  first_ls
  set_volume
  start_sound
  screen_sleep
  remap_keyboard
  enable_numlock
  # firefox_ramdisk
}


xinit_lazy &
while true; do
    # exec dwm >/dev/null 2>&1
    # exec gnome-shell
    #exec metacity
    exec i3
done
