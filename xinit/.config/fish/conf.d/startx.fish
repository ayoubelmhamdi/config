

#startx
if status --is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
     mkdir -p /tmp/ayoub
     echo "1 1" > /tmp/ayoub/cpu
     exec startx -- -keeptty
  end
end
