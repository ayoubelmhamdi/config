#!/bin/sh

# TODO: mouve to xinitrc this lazy func
# lazy(){
#     sleep 0.1
#     cp -u ~/.cache/cheatcheat /tmp/cheatcheat
#     sudo mkdir -p /tmp/ayoub /tmp/nvim
#     sudo chown -R mhamdi /tmp/ayoub /tmp/nvim
#     echo "1 1" | tee /tmp/ayoub/cpu
#     echo " "   | tee /tmp/ayoub/status
#     #sudo chmod -R 7755 /home/mhamdi/.local/share/zinit
#     #sudo rmmod wl && sudo modprobe wl
# }

set_env_var_and_path(){
  # GO SETTINGS
  export CGO_ENABLED=1
  export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"

  if [[ -s $HOME/.config/zprofile  ]];then
    for file in $HOME/.config/zprofile/*;do
      source "$file"
    done
  fi
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  set_env_var_and_path
  # lazy &
  exec startx
fi
