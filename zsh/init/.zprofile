#!/bin/sh

# TODO: mouve to xinitrc this lazy func
init_zsh(){
    sleep 0.1
    sudo mkdir -p /tmp/ayoub /tmp/nvim
    sudo chown -R mhamdi /tmp/ayoub /tmp/nvim
    echo "1 1" | tee /tmp/ayoub/cpu
    echo " "   | tee /tmp/ayoub/status
    #sudo chmod -R 7755 /home/mhamdi/.local/share/zinit
    #sudo rmmod wl && sudo modprobe wl
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

set_env_var_and_path
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  init_zsh &
  exec startx
fi
