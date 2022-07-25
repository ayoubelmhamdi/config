#!/bin/bash

#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
exec st &
exec ~/.fehbg &
exec sl &
exec sxhkd   &
exec nvim --headless -c 'qall' &
exec launch_brave &
exec ls &



fix_date &
pkill iwd

echo 'sleep 5'
sleep 5

#setxkbmap fr
#dwl
while true; do
    dwm >/dev/null 2>&1
done
