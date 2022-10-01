#!/bin/sh

lazy(){
    sleep 1
    cp ~/.cache/cheatcheat /tmp/cheatcheat
    #sudo chmod -R 7755 /home/mhamdi/.local/share/zinit
    sudo mkdir -p /tmp/ayoub
    sudo chown -R 1002:users /tmp/ayoub
    echo "1 1" | tee /tmp/ayoub/cpu
    echo " "   | tee /tmp/ayoub/status
    sudo rmmod wl && sudo modprobe wl
    sudo chown -R $USER /tmp/nvim
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]];
then 
    lazy &
    startx &

fi
