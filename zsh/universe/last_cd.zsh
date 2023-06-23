#!/usr/bin/env zsh

##1#!/usr/bin/env zsh
##1
##1FILE_LAST_DIR="/tmp/last_open_dir"
##1DIR_LAST_DIR=""
##1
##1if [ -f "$FILE_LAST_DIR" ];then
##1  TMPDIR="$(cat "$FILE_LAST_DIR")"
##1  if [ -d "$TMPDIR" ];then
##1    DIR_LAST_DIR="TMPDIR"
##1  else
##1    if touch "$FILE_LAST_DIR";then
##1      if touch "/data" ; then
##1        DIR_LAST_DIR="/data"
##1      elif touch "$HOME/data" ; then
##1        DIR_LAST_DIR="$HOME/data"
##1      else
##1        echo "can not use cd"
##1        echo "pwd: $(pwd)"
##1      fi
##1    else
##1      echo "can not use cd"
##1      echo "pwd: $(pwd)"
##1    fi
##1  fi
##1else
##1  if touch "$FILE_LAST_DIR";then
##1    if touch "/data" ; then
##1      DIR_LAST_DIR="/data"
##1    elif touch "$HOME/data" ; then
##1      DIR_LAST_DIR="$HOME/data"
##1    else
##1      echo "can not use cd"
##1      echo "pwd: $(pwd)"
##1    fi
##1  else
##1    echo "can not use cd"
##1    echo "pwd: $(pwd)"
##1  fi
##1fi
##1
##1# builtin cd "$DIR_LAST_DIR"

