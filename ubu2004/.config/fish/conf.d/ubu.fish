function f --description 'search for xbps app'

  set n (count $argv)
  set pkg $argv[1]
  set color $argv[2]
  set lastpkg $argv[2..]

  if test $n = 1 
    apt-cache search $pkg | grep --color=auto -i $pkg
  else
    apt-cache search $pkg | grep --color=auto -iE "$color|$pkg"
  end
end

function i --description 'install app and add to list'
	apt-get install $argv && echo $argv >> /opt/applist/apt.list
end

function iu --description 'install app and add to list'
  apt-get update
  apt-get upgrade
	apt-get dist-upgrade 
end
 
 
function is --description 'sync and function i'
  apt-get update
	apt-get install $argv && echo $argv >> /opt/applist/apt.list
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
