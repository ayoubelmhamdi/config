#!/usr/bin/env zsh

grg() {
  local RG="/bin/rg"
  [ -x "$RG" ] || RG="rg"

  # Split leading options from the rest (pattern + optional files).
  # This is "good enough" for typical grep-like usage: grg [opts] PATTERN [FILE...]
  local -a opts rest
  while [ $# -gt 0 ]; do
    case "$1" in
      --) shift; break ;;
      -*) opts+=("$1"); shift ;;
      *)  break ;;
    esac
  done
  rest=("$@")

  # Need at least a pattern
  if [ ${#rest[@]} -lt 1 ]; then
    printf "usage: grg [rg-options] PATTERN [FILE...]\n" >&2
    return 2
  fi

  # If no FILE... part:
  # - If stdin is a terminal, behave like `grep PATTERN` (wait/read stdin).
  # - If stdin is piped, also read stdin.
  if [ ${#rest[@]} -eq 1 ]; then
    "$RG" --vimgrep --color=auto --no-heading --line-number "${opts[@]}" "${rest[0]}" -
  else
    "$RG" --vimgrep --color=auto --no-heading --line-number "${opts[@]}" "${rest[@]}"
  fi
}


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

