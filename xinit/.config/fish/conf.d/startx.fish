

#startx
if status --is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
     date --set='12 may 2021 05:05:05'
     ayoub2 &!
     vim --headless -c 'qall' &
     mkdir -p /tmp/ayoub
     echo "1 1" > /tmp/ayoub/cpu
     echo " " > /tmp/ayoub/status
     exec startx -- -keeptty
  end
end
