#!/bin/bash
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
_st(){
  exec st &
}

_sl(){
  sl &
}

_brightness(){
  if [ -f "$HOME/.config/brightness/brightness-kernel" ];then
    # cat "$HOME/.config/brightness/xbps-install -Sy gtkbrightness-kernel" | sudo tee /sys/class/backlight/intel_backlight/brightness &
    xbacklight -set "$(cat "$HOME/.config/brightness/brightness-kernel")"
  fi
}

_feh(){
  ~/.fehbg &
}

_sxhkd(){
  sxhkd > /tmp/log.xshkd.log  &
}

_ls(){
  ls /data ~ &
}

_amixer(){
  amixer sset 'Master' 90% &
}


_ramdisk(){
  exec firefox-ram 5kc8rznt.default-default &
  sleep 3
  exec shm "$HOME"/.local/share/nvim/site/pack &&
    exec shm "$HOME"/.config/nvim
}

_xscreenoff(){
  # turn off screen after 300 seconds
  xset s 300
}

_xmodmap(){
  xmodmap ~/.Xmodmap
}

_numlock(){
  exec numlockx on &
}


_start_sound(){
  echo "=====$(date)=========" >> /tmp/log.pipewire.log
  exec pipewire &
  if [ $? -eq 0 ];then
    sleep 3
    exec pulseaudio &
    if [ $? -eq 0 ];then
      sleep 3
      exec pipewire-pulse &
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

xinit_lazy(){
  sleep 1
  _st
  _brightness
  _feh
  _ls
  _amixer
  _start_sound
  _ramdisk
  _xscreenoff
  _xmodmap
  _numlock
}


xinit_lazy &
while true; do
    # exec dwm >/dev/null 2>&1
    # exec gnome-shell
    #exec metacity
    exec i3
done
