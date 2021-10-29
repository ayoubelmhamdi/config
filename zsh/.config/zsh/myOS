#!/data/data/com.termux/files/usr/bin/bash
#         ___  ____  
#        / _ \/ ___| 
#       | | | \___ \ 
#       | |_| |___) |
#        \___/|____/ 

             
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    OS="SUSEOS=$(uname -s)"
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    OS="REDHAT"
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS="Linux"
    VER=$(uname -r)
fi
OS="$(echo -e $OS |sed 's/^\([^ ]*\) .*/\1/g')"
# echo $OS



_isTermux=false
_isUbuntu=false
_isDebian=false
_isVoid=false
_isArch=false

[[ "$OS" =~ Linux  ]] && _isTermux=true
[[ "$OS" =~ Ubuntu ]] && _isUbuntu=true
[[ "$OS" =~ Debian ]] && _isDebian=true
[[ "$OS" =~ void   ]] && _isVoid=true
[[ "$OS" =~ Arch   ]] && _isArch=true
# echo "$OS"
