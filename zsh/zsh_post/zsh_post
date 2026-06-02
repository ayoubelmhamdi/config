#!/usr/bin/zsh

#
# after compinit and user zsh config
#

#if command -v pazi &>/dev/null; then
#  eval "$(pazi init zsh)" # or 'bash'
#fi



if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null)"
fi


# move it into ~/.zprofile
# if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
#     if command -v dbus-launch >/dev/null 2>&1; then
#         eval "$(dbus-launch --sh-syntax --exit-with-session)"
#     fi
# fi
