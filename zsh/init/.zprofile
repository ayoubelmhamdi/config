#!/bin/bash

# TODO: mouve to xinitrc this lazy func
TMPDIR="${TMPDIR:-$TMP}"
TMPDIR="${TMPDIR:-/tmp}"
mkdir -p $TMPDIR/ayoub $TMPDIR/nvim
# doas chown -R mhamdi /tmp/ayoub /tmp/nvim
echo "1 1" > $TMPDIR/ayoub/cpu
echo " "   > $TMPDIR/ayoub/status
#doas chmod -R 7755 /home/mhamdi/.local/share/zinit
#doas rmmod wl && sudo modprobe wl

if [[ -s $HOME/.config/zprofile  ]];then
  for file in $HOME/.config/zprofile/* $HOME/.config/zsh_post/*;do
    source "$file"
  done
fi


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ ! -f $TMPDIR/first_start ]];then
    touch $TMPDIR/first_start
    # exec startx
    dbus-run-session startx
fi
