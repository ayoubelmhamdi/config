#!/bin/zsh
 #  _________  _   _ ____   ____ 
 # |__  / ___|| | | |  _ \ / ___|
 #   / /\___ \| |_| | |_) | |    
 #  / /_ ___) |  _  |  _ <| |___ 
 # /____|____/|_| |_|_| \_\\____|
 


 #  TODO: isExcite modifile
 . $HOME/.config/zsh/zsh-init
#. $HOME/.config/zsh/tmux.zsh
 . $HOME/.oh-my-zsh/oh-my-zsh.sh
 
 . $HOME/.config/zsh/zsh_config
 . $HOME/.config/zsh/zsh-keybinding.zsh
 . $HOME/.config/zsh/fzf.zsh
 
 . $HOME/.config/zsh/isExcite
 . $HOME/.config/zsh/myOS
 . $HOME/.config/zsh/color.zsh
 
 
 . $HOME/.config/zsh/keyboard.zsh
 . $HOME/.config/zsh/all_PATH
 . $HOME/.config/zsh/export_Linux
 . $HOME/.config/zsh/export_Dirs
 
 . $HOME/.config/zsh/my_alias
 . $HOME/.config/zsh/my_function
 
 

 VISUAL="nvim"
 EDITOR="nvim"
 
 
 # ANDROID SDK {{
 # 
 # cmdline-tools /4.0 ==>  you can't rename this folder to Anothername
 # also you must locate under $ANDROID_HOME
 # first you must and accepte licenses
 # yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses 
 # sdkmanager --sdk_root=${ANDROID_HOME} --version
 # echo "sdk.dir=${PREFIX}/android-sdk" >> local.properties
 # mkdir $HOME/android-sdk/
 # dont do this in termux
 # sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools"
 # ./gradlew assembleDebug
 
 #}}
 
###############################################################
#  TODO: use "\r" + sleep 5 seconds to view answer            #
###############################################################
 echo; shuf -n 1 $wiki/learn.txt ; echo
 
 # . $HOME/.config/zsh/ayoub_zsh

alias luamake=/root/.cache/lua-language-server/3rd/luamake/luamake

# latex
#
#  TODO: move to subdir
#
PATH="/root/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/root/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/root/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/root/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/root/perl5"; export PERL_MM_OPT;

# plugin and complition for cht.sh 
eval "$(jump shell)"
