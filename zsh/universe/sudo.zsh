#!/bin/bash

if ! command -v doas >/dev/null 2>&1;then
  alias doas=""
fi

alias date='doas date'

alias update-grub='doas update-grub'
alias reboot="doas reboot"

# mv, rm, cp
alias rm="doas rm -ivr"
# alias rm='rm -Ivr'
alias trash-list="trash-list --trash-dir=/root/.Trash-0"
alias trash-restore="trash-restore --trash-dir=/root/.Trash-0"
alias rmt='trash_rm'
alias rmf='doas /sbin/rm -vrf'


alias chown='doas chown'
alias chmod='doas chmod'
alias x='doas chmod +x'

alias poweroff='doas poweroff'
alias reboot='doas reboot'
alias zzz='doas zzz'
alias pkill='doas pkill'

alias rmmod='doas rmmod'
alias modprobe='doas modprobe'

alias sv='doas sv'

alias mount="doas mount"
alias umount="doas umount"

# when i use password i do not need to use it every time
# alias sed="doas sed"

# fix doas
# alis ln
alias cp="cp -ivr"
alias mv='mv -iv'
alias ncat='/sbin/cat'
alias cat='bat -p'
