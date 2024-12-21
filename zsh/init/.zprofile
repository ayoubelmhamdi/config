#!/bin/bash

# TODO: mouve to xinitrc this lazy func
init_zsh(){
    sleep 0.1
    TMPDIR="${TMPDIR:-$TMP}"
    TMPDIR="${TMPDIR:-/tmp}"
    mkdir -p $TMPDIR/ayoub $TMPDIR/nvim
    # doas chown -R mhamdi /tmp/ayoub /tmp/nvim
    echo "1 1" | tee $TMPDIR/ayoub/cpu
    echo " "   | tee $TMPDIR/ayoub/status
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

set_env_var_and_path

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ ! -f /tmp/first_start ]];then
    touch /tmp/first_start
    init_zsh
    # exec startx
    dbus-run-session startx
fi
