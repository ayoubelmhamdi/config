#!/bin/sh

# TODO: mouve to xinitrc this lazy func
init_zsh(){
    sleep 0.1
    mkdir -p /tmp/ayoub /tmp/nvim
    # doas chown -R mhamdi /tmp/ayoub /tmp/nvim
    echo "1 1" | tee /tmp/ayoub/cpu
    echo " "   | tee /tmp/ayoub/status
    #doas chmod -R 7755 /home/mhamdi/.local/share/zinit
    #doas rmmod wl && sudo modprobe wl
}

set_env_var_and_path(){
  # GO SETTINGS
  export CGO_ENABLED=1
  export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"

  if [[ -s $HOME/.config/zprofile  ]];then
    for file in $HOME/.config/zprofile/* $HOME/.config/zsh_post/*;do
      source "$file"
    done
  fi
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  set_env_var_and_path
  init_zsh &
  exec startx
fi

# Ensure XDG_RUNTIME_DIR is set
if test -z "$XDG_RUNTIME_DIR"; then
    #export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
    :
fi
