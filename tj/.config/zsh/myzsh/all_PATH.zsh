#!/bin/bash
#  ____   _  _____ _   _ 
# |  _ \ / \|_   _| | | |
# | |_) / _ \ | | | |_| |
# |  __/ ___ \| | |  _  |
# |_| /_/   \_\_| |_| |_|



# mes scripts
# NOTE: we need star in $var/* for grep all sub dirs
directory0="$HOME/scripts"
  # first for
if [ -d "$directory0" ]; then PATH="$PATH:$directory0"
  for directory1 in $directory0/* ; do
    # secend for
    if [ -d "$directory1" ]; then PATH="$PATH:$directory1" 
      for directory2 in $directory1/* ; do
        # thired for
        if [ -d "$directory2" ]; then PATH="$PATH:$directory2" 
          for directory3 in $directory2/* ; do
            if [ -d "$directory3" ]; then PATH="$PATH:$directory3" ; fi
          done
        fi
      done
    fi
  done
fi


PATH=$PATH:"/opt/app/my-build/bin"
# run arch in termux
PATH=$PATH:"$HOME/arch"
# run open-url/open file in termux
PATH=$PATH:"$HOME/bin"
# git-fuzzy
PATH=$PATH:/opt/app/git-fuzzy/bin

# apps:python,go...
PATH=$PATH:"$HOME/.local/bin"
PATH=$PATH:"$HOME/go/bin"
#emacs
PATH=$PATH:"$HOME/.emacs.d/bin"

# java 
# PATH=$PATH:"/opt/sdk/jdk-18/bin"

# android sdk
PATH=$PATH:"/opt/sdk/gradle/gradle-7.1.1/bin"
PATH=$PATH:"/opt/sdk/kotlin-native-linux-1.4.32/bin"
PATH=$PATH:"/opt/sdk/gradle/gradle-6.5/bin"

PATH=$PATH:"/opt/sdk/android/platform-tools"

PATH=$PATH:"/opt/sdk/android/cmdline-tools/4.0/bin"
PATH=$PATH:"/opt/sdk/android/cmdline-tools/4.0"
PATH=$PATH:"/opt/sdk/android/tools/bin"
PATH=$PATH:"/opt/sdk/android/tools"

# PATH=$PATH:"/opt/sdk/android/tools-2/bin"
# PATH=$PATH:"/opt/sdk/android/tools-2"

PATH=$PATH:"/opt/sdk/flutter/bin"
PATH=$PATH:"/opt/sdk/flutter/.pub-cache/bin"
PATH=$PATH:"$HOME/bin/depot_tools"

# gitmux for git in tmux
PATH=$PATH:"$HOME/.config/zsh/gitmux"
# latex 
PATH=$PATH:"/opt/texlive/2021/bin/x86_64-linux"


# remove duplique path
# PATH export with awk
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')


export PATH
