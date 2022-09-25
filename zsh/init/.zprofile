#!/bin/sh

lazy(){
    sleep 1
    cp ~/.cache/cheatcheat /tmp/cheatcheat
    mkdir -p /tmp/ayoub
    echo "1 1" > /tmp/ayoub/cpu
    echo " " > /tmp/ayoub/status
    sudo rmmod wl && sudo modprobe wl
    sudo chown -R $USER /tmp/nvim/undodir
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]];
then 
    lazy &
    startx &

fi


# echo " " > /tmp/chrono
# echo " " > /tmp/cliptxt
# echo " " > /tmp/iscro
# echo " " > /tmp/istrash
# echo " " > /tmp/ison
