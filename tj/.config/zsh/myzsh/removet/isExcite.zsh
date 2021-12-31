#!/bin/bash

#  _     _____          _ _       
# (_)___| ____|_  _____(_) |_ ___ 
# | / __|  _| \ \/ / __| | __/ _ \
# | \__ \ |___ >  < (__| | ||  __/
# |_|___/_____/_/\_\___|_|\__\___|
                                

_isArch_______=false
_isTermux_____=false
_isScripts____=false
_isLocal______=false
_isShare______=false
_isGitmux_____=false
_isDownload___=false
_isAppProject_=false


# for android
_isJdk________=false
_isJli________=false
_isGradle_____=false
_isGradlec____=false
_isSDK1_______=false
_isSDK2_______=false
_isAndroidHome=false


# function for shell
_isFunction___=false
_isGOTO_______=false
# Alias
_isAlias______=false



# String Directories
dir_scripts___="$HOME/scripts/my"
dir_local_____="$HOME/.local/bin"
dir_gitmux____="$HOME/.config/zsh/gitmux"
dir_Download__="$HOME/storage/downloads"
dir_appproject="$HOME/storage/downloads/AppProjects"
dir_termux____="$HOME/bin"
dir_arch______="$HOME/arch"
dir_share_____="$HOME/.local/share"

# ANDROID SDK JDK
dir_jdk_______="$PREFIX/jdk/bin"
dir_jli_______="$PREFIX/jdk/lib/jli"
dir_andro_home="$PREFIX/android-sdk"
dir_gradlec___="$PREFIX/android-sdk/gradlec"
dir_sdk2______="$PREFIX/android-sdk/tools/bin"
dir_sdk1______="$PREFIX/android-sdk/platform-tools"
dir_gradle____="$PREFIX/android-sdk/gradle-6.8.3/bin"


# Sting Files
file_alias____="$HOME/.config/zsh/my_alias"
file_function_="$HOME/scripts/my/find/cd_to_dir.sh"
file_goto_____="$HOME/scrIpts/my/find/cd_to_dir.sh"


# TEST IS EXCISTE

[[ -d $dir_scripts___ ]] && _isScripts____=true
[[ -d $dir_local_____ ]] && _isLocal______=true 
[[ -d $dir_gitmux____ ]] && _isGitmux_____=true 
[[ -d $dir_Download__ ]] && _isDownload___=true 
[[ -d $dir_Download__ ]] && _isAppProject_=true 
[[ -d $dir_termux____ ]] && _isTermux_____=true 
[[ -d $dir_arch______ ]] && _isArch_______=true
[[ -d $dir_share_____ ]] && _isShare______=true 

# ANDROID SDK,JDK
[[ -d $dir_jdk_______ ]] && _isJdk________=true 
[[ -d $dir_jli_______ ]] && _isJli________=true 
[[ -d $dir_andro_home ]] && _isAndroidHome=true 
[[ -d $dir_gradlec___ ]] && _isGradlec____=true 
[[ -d $dir_sdk2______ ]] && _isSDK2_______=true 
[[ -d $dir_sdk1______ ]] && _isSDK1_______=true 
[[ -d $dir_gradle____ ]] && _isGradle_____=true 


# function for shell
[[ -f $file_function_ ]] && _isFunction___=true 
[[ -f $file_goto_____ ]] && _isGOTO_______=true 
[[ -f $file_alias____ ]] && _isAlias______=true 
