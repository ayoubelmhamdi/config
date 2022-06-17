setxkbmap -model pc105 -layout us,ara -option grp:alt_shift_toggle

# alt_L to Ctrl_R
#xmodmap -pke | grep Alt_R
# xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
# xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
# Map CapsLock to shift
# xmodmap -e "keycode 66 = Shift_L NoSymbol Shift_L"
# xmodmap -e "keycode 166 = Prior"
# xmodmap -e "keycode 167 = Next"
