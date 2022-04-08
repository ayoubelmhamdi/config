#!/bin/bash

kitty sh -c 'nvim --listen ~/.cache/nvim/server.pipe &'
exec st &
exec ~/.fehbg &
exec sl &
exec sxhkd &
#dwl
while true; do
    dwm >/dev/null 2>&1
done
