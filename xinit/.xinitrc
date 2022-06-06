#!/bin/bash

#kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
exec st &
exec ~/.fehbg &
exec sl &
sxhkd   &

fix_date &
pkill iwd

#setxkbmap fr
#dwl
while true; do
    dwm >/dev/null 2>&1
done
