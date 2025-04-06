#!/bin/bash

SUDO="sudo"
if command -v doas >/dev/null 2>&1;then
  SUDO="doas"
fi

alias ntpdate="$SUDO ntpdate"
alias date="$SUDO date"

alias update-grub="$SUDO update-grub"
alias reboot="$SUDO reboot"

# mv, rm, cp
alias rm="$SUDO rm -ivr"
# alias rm="rm -Ivr"
alias trash-list="trash-list --trash-dir=/root/.Trash-0"
alias trash-restore="trash-restore --trash-dir=/root/.Trash-0"
alias rmt="trash_rm"
alias rmf="$SUDO /sbin/rm -vrf"


alias chown="$SUDO chown"
alias chmod="$SUDO chmod"
alias x="$SUDO chmod +x"

alias poweroff="$SUDO poweroff"
alias reboot="$SUDO reboot"
alias zzz="$SUDO zzz"
alias pkill="$SUDO pkill"

alias rmmod="$SUDO rmmod"
alias modprobe="$SUDO modprobe"

alias sv="$SUDO sv"

alias mount="$SUDO mount"
alias umount="$SUDO umount"
