#!/bin/sh
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]];
then 
  # echo " " > /tmp/chrono
  # echo " " > /tmp/cliptxt
  # echo " " > /tmp/iscro
  # echo " " > /tmp/istrash
  # echo " " > /tmp/ison

  cp ~/.cache/cheatcheat /tmp/cheatcheat
  # wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
  mega-sync &!
  startx 
  # if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
  #  bicon.bin
  # fi
fi

