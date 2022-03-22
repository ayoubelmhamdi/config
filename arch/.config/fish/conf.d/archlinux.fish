function f --description 'search for xbps app'

  set n (count $argv)
  set pkg $argv[1]
  set color $argv[2]
  set lastpkg $argv[2..]

  if test $n = 1 
    pacman -Ss $pkg | grep --color=auto -i $pkg
  else
    pacman -Ss $pkg | grep --color=auto -iE "$color|$pkg"
  end
end

function i --description 'install app and add to list'
	pacman -S $argv && echo $argv >> /opt/applist/pacman.list
end

function iu --description 'install app and add to list'
	pacman -Syu 
end
 
 
function is --description 'sync and function i'
	pacman -Sy $argv && echo $argv >> /opt/applist/pacman.list
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
