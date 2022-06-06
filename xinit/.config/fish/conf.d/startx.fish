

#startx
if status --is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
     mkdir -p /tmp/ayoub
     echo "1 1" > /tmp/ayoub/cpu
     echo " " > /tmp/ayoub/status
     echo 'start dwm'
     startx -- -keeptty >/dev/null 2>&1
  end
end
