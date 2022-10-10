#!/bin/bash
# adb kill-server
pkill x11vnc
# xrandr --output VIRTUAL1 --off
# xrandr --delmode VIRTUAL1 "800x1280_60.00"
# xrandr --rmmode "800x1280_60.00"

xrandr --output VIRTUAL1 --off
xrandr --delmode VIRTUAL1 "1280x800_60.00"
xrandr --rmmode "1280x800_60.00"
