#!/bin/bash

# ANDROID
export ANDROID_SDK_HOME="/app/sdk/android-HOME"
export ANDROID_SDK_ROOT="/app/sdk/android"
export GRADLE_USER_HOME="/app/sdk/gradlec"
# export ANDROID_HOME="/app/sdk/android"                        # Deprecated: Don't use it
# export GRADLE_HOME="/app/sdk/gradle/gradle-7.3"               # flutter doesn't need it
# export JAVA_HOME="$HOME/.cache/ltex-ls-15.2.0/jdk-11.0.12+7"  # package manager(xbps) openjdk 17.0.10



# LIBRARY
export ERG_PATH=/home/mhamdi/.erg
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64
# export PYTHONPATH=$PYTHONPATH:/data/github/lyrapdf

declare -a MY_PATHS=(
    "/data/projects/c/ayoub/getbandwith/bin"
    "$HOME/scripts/bin"
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
    "$HOME/.erg/bin"
    "/app/flutter/bin"
    "/app/android-studio/bin"
    # "/app/sdk/gradle/gradle-7.3/bin"                          # flutter doesn't need it
    "/usr/local/cuda-10.1/bin"
    "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
    "$ANDROID_SDK_ROOT/platform-tools"
)

# mkdir -p $ANDROID_SDK_ROOT
# unzip commandlinetools-linux-11076708_latest.zip -d /tmp
# mkdir -p $ANDROID_SDK_ROOT/cmdline-tools
# mv /tmp/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest
# unzip platform-tools-latest-linux.zip -d $ANDROID_SDK_ROOT
# sdkmanager "build-tools;34.0.0" "platforms;android-34" "platform-tools"


# Iterate over the array and append each path to the PATH variable
MY_PATH=""
for _path in "${MY_PATHS[@]}"; do
  if [ -e "$_path" ];then
    MY_PATH="$_path:$MY_PATH"
  fi
done

export PATH=$PATH:$MY_PATH
# export PATH="$PATH"
# export PATH="$MY_PATH"
