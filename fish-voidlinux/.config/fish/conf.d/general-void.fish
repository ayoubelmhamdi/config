function f --description 'search for xbps app'

  set n (count $argv)
  set pkg $argv[1]
  set color $argv[2]
  set lastpkg $argv[2..]

  if test $n = 1 
    xbps-query -Rs $pkg | grep --color=auto -i $pkg
  else
    xbps-query -Rs $pkg | grep --color=auto -iE "$color|$pkg"
  end
end


function ipip --description 'use pip to list install pkg'
  if count $argv -ge 1 >/dev/null
     python3 -m pip install $argv && echo $argv >> /opt/applist/pip.list
  else
     echo -e "\nsomthing wrong ...\n\n"
  end
end

function inpm --description 'use  npm to list install pkg npm'
  if count $argv -ge 1 >/dev/null
     /usr/bin/npm  install -g $argv && echo $argv >> /opt/applist/npm.list
  else
     echo -e "\nsomthing wrong ...\n\n"
  end
end
