#!/bin/bash

# init var
  linux="$1"


# cd stow dir
  stow zsh jump kitty sxhkd tmux

  case "$linux" in
    void) stow void-alias
    ;;
    termux) stow termux-alias
    ;;
    ubuntu20) stow ubuntu20-alias
    ;;
    ubuntu18) stow ubuntu18-alias
    ;;
    *) echo default
    ;;
  esac


