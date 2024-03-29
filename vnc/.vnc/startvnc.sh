#!/bin/bash

$HOME/.vnc/closevnc.sh
trap '$HOME/.vnc/closevnc.sh' EXIT



# adb reverse tcp:5900 tcp:5900
# usepw : use the password in ~/.vpn/password
# xset r rate 200 30    
#
# xrandr --newmode  "800x1280_60.00"  86.50  800 856 944 1088  1280 1281 1284 1325  -HSync +Vsync
# xrandr --addmode VIRTUAL1 800x1280_60.00
# xrandr --output VIRTUAL1 --mode 800x1280_60.00 --above eDP1
# x11vnc -repeat -multiptr -forever -display :0.0 -clip 800x1280+0+0

xrandr --newmode  "1280x800_60.00"  86.50  800 856 944 1088  1280 1281 1284 1325  -HSync +Vsync
xrandr --addmode VIRTUAL1 1280x800_60.00
xrandr --output VIRTUAL1 --mode 1280x800_60.00 --above eDP1
x11vnc -repeat -multiptr -forever -display :0.0 -clip 1280x800+0+0

echo  "Please enter the following details in another monitor"    
echo  "   DISPLAY=:0 vncviewer -fullscreen 192.168.xxx.xxx"
echo  "   Port (optional): 5900"   
