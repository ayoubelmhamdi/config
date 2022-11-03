#!/bin/sh

lazy(){
    sleep 0.1
    cp -u ~/.cache/cheatcheat /tmp/cheatcheat
    sudo mkdir -p /tmp/ayoub /tmp/nvim
    sudo chown -R mhamdi /tmp/ayoub /tmp/nvim
    echo "1 1" | tee /tmp/ayoub/cpu
    echo " "   | tee /tmp/ayoub/status
    #sudo chmod -R 7755 /home/mhamdi/.local/share/zinit
    #sudo rmmod wl && sudo modprobe wl
}

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]];
then 
    export A=2
    f1(){
        echo 'zprofile'
    }
    lazy &
    exec startx

fi


