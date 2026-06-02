#!/bin/zsh


# TODO: mouve to xinitrc this lazy func
export TMPDIR="${TMPDIR:-/tmp}"
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


# TODO:
# try to see if dbus not pollution the /tmp directories
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/dbus-1"
# not work for me?


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ ! -f $TMPDIR/first_start ]]; then
    touch "$TMPDIR/first_start"
    #2exec startx
    #1dbus-run-session startx
fi
