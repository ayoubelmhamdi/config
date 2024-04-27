#!/bin/bash

#sdkmanager --update
#yes | sdkmanager --licenses
#sdkmanager --install "build-tools;34.0.0" "platforms;android-34" "platform-tools"

export ANDROID_SDK_HOME="/data/sdk/androidHome"
export ANDROID_SDK_ROOT="/data/sdk/android"
export GRADLE_USER_HOME="/data/sdk/gradle"
export GRADLE_HOME="/data/sdk/gradle/gradle-8.7"
export PATH="$PATH:/data/sdk/flutter/bin:/data/sdk/android-studio/bin:/data/sdk/gradle/gradle-8.7/bin:/data/sdk/android/cmdline-tools/latest/bin:/data/sdk/android/platform-tools"
# export ANDROID_HOME="/app/sdk/android"         # Deprecated: Don't use it


# LIBRARY
# export ERG_PATH=/home/mhamdi/.erg
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64
# export PYTHONPATH=$PYTHONPATH:/data/github/lyrapdf

declare -a MY_PATHS=(
    "/data/projects/c/ayoub/getbandwith/bin"
    "$HOME/scripts/bin"
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
    "$HOME/.erg/bin"
    "/usr/local/cuda-10.1/bin"
)


MY_PATH=""
for _path in "${MY_PATHS[@]}"; do
  if [ -e "$_path" ];then
    MY_PATH="$_path:$MY_PATH"
  fi
done

export PATH=$PATH:$MY_PATH
