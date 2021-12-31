#!/bin/bash

function o (){
if [ "$#" -eq 0 ]; then
  clear && exa
elif [ -d "$1" ]; then
  exa "$1"
else
  if [[ "$1"=="-a" ]] ;then
    clear && exa -a
  elif [[ "$1"=="-ah" ]] ;then
    clear && exa -a
  elif [[ "$1"=="-lh" ]] ;then
    clear && exa -lh
  elif [[ "$1"=="-l" ]] ;then
    clear && exa -lh
  elif [ -f "$1" ] ; then
    case $1 in
      *.vim)   nvim        "$1"   ;;
      *.pdf)   zathura     "$1"   ;;
      *.odt)   libreoffice "$1"   ;;
      *.doc)   libreoffice "$1"   ;;
      *.docx)  libreoffice "$1"   ;;
      *.md)    glow        "$1"   ;;
      *.txt)   glow        "$1"   ;;
      *.jpg)   sxiv        "$1"   ;;
      *.png)   sxiv        "$1"   ;;
      *.gif)   sxiv        "$1"   ;;
      *.mp4)   mpv         "$1"   ;;
      *.md)    glow        "$1"   ;;
      *.txt)   cat         "$1"   ;;
      *.py)    cat         "$1"   ;;
      *.dart)  cat         "$1"   ;;
      *.lua)   cat         "$1"   ;;
      *.h)     cat         "$1"   ;;
      # *.l)     exa         "$1"   ;;
      # "-a")    exa         "$1"   ;;
    
      *) echo "'$1' cannot be extracted via o()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
fi
}

function touch-safe {
    for f in "$@"; do
      [ -d $f:h ] || mkdir -p $f:h && command touch $f;
    done
}
alias touch=touch-safe




# glow find
function glow_codes(){
  glow `fd . "$1"|fzf` | echo "it's not pick any file";
}

# xbps search query
function xbps_search(){
  pkg="$1"
  # clear
  if [[ "$#" == 1 ]]; then
      xbps-query -Rs "$pkg" | grep --color=auto -i "$pkg"
  else
    shift 1
     xbps-query -Rs  "$pkg" | grep --color=auto -i "$@"
  fi
}
alias f=xbps_search 

function get_cwd(){
  #NOTE: use star * outside "" not inside qoute
  cwd=$(pwd)

  if [[ "$cwd" == "$HOME" ]];then #parent
    cwd="%B%F{3}~"
  elif [[ "$cwd" == "$HOME"* ]];then #parent
    cwd="%B%F{3}~/${cwd##${HOME}/}"
  else
    sources=(
    "$wiki"
    "$HOME/scripts"
    "$HOME/stow-dotfiles"
    "$HOME/.config/nvim"
    "$c_project/master"
    "$c_project/ecart_type"
    )

    for s in "${sources[@]}"; do
      project=$(basename $s)
      if [[ "$cwd" == "$s" ]];then #parent
        cwd="%B%F{3}${project} %B%F{1}>%B%F{2}>%B%F{3}>"
      elif [[ "$cwd" == "$s"* ]];then # shild
        cwd="%B%F{3}${project}:%B%F{7}${cwd##${s}/} %B%F{1}>%B%F{2}>%B%F{3}>"
      fi
    done
  fi


  echo "${cwd}"
}


function findin(){
  local dir
  local var
  dir="$1"
  var=$(fd . "$dir"|fzf)
  [ -z "$var" ] && nvim $dir || nvim $var
}
# install pkg and save it's name to /opt/pkg.list
# it install nosync test   pkg
# ist install sync   test   pkg
# i install nosync stable pkg
# is nstall sync   stable pkg


function i(){
	xbps-install "$@" && echo "$@" >> /opt/pkg.list
}

function is(){
	xbps-install -S "$@" && echo "$@" >> /opt/pkg.list
}



# pip is alias to <...> pip and not load function
# so i ovverire alias then i use function

unset pip
alias pip='pip'
unalias pip
function pip(){
  if [[ ( "$1" == "install" || "$1" == "i" ) && "$#" == 2 ]]; then
    python3 -m pip install "$2"
    echo "$3" >> /opt/pip.list
  else
    echo -e "pip not use /opt/pip.list ...\n\n"
    python3 -m pip install "$@"
  fi
}

alias npm=npm
unalias npm
# function npm(){
#   # TODO: use if $1== install or uninstall or fund..
#   if [[ "$#" == 2 || "$#" == 3 ]]; then
#     if [[ "$2" == "-g" ]]; then
#       # npm install -g pkg
#       /usr/bin/npm  install -g "$3"  && echo "$3" >> /opt/npm.list
#     else
#       # npm install pkg
#       /usr/bin/npm install -g "$@"  && echo "$@" >> /opt/npm.list
#     fi
#   else
#     echo -e "npm not use /opt/npm.list ...\n\n"
#     /usr/bin/npm "$@"
#   fi
# }

function npm(){
  if [[ "$#" == 1 ]]; then
    # npm xxx;
    /usr/bin/npm "$@"
  elif [[ "$#" == 2 ]];then 
    if [[ "$1" == "i"|| "$1" = "install"  ]]; then
      #npm i/install xxx
      if [[ "$2" != "-g" ]]; then
         /usr/bin/npm  install  "$2"  && echo "$2" >> /opt/npm.list
      else
        echo "ERROR: npm install -g null"
      fi
    elif [[ "$1" == "-g" ]]; then
      # npm -g xxx
      echo "ERROR: npm install -g null"
    else
      # npm gaggs xxxx
      /usr/bin/npm "$@"
    fi
  elif [[ "$#" == 3 ]];then 
    if [[ "$1" == "i"|| "$1" = "install"  ]]; then
      #npm i/install -g xxx
      if [[ "$2" == "-g" ]]; then
         /usr/bin/npm  install  -g "$3"  && echo "$3" >> /opt/npm.list
      else
        /usr/bin/npm "$@"
      fi
    else
      # npm gaggs xxxx xxx
      /usr/bin/npm "$@"
    fi
  else
    # npm xxx xxx xxx;
    # npm xxx xxxx xxxx xxxx
    /usr/bin/npm "$@"
  fi
}



#use pwd in tmux status
precmd () {
  [[ $(pgrep tmux| wc -l) >1 ]] && tmux set -qg status-left '[ #[bold]#{pane_current_path} ]    '
}

# edit wiki
#TODO: if '@$'!= 1 dont use this function (bug with fzf)
use_repo () {  
  alias v='nvim -u $avim/init.lua'
  alias cat='/bin/cat2'
          
  var=$(fd . "$2"|fzf) 
  [[ "$1" == "v" ]]   && [ $var ] && v $var
  [[ "$1" == "cat" ]] && [ $var ] && cat $var
  #    
}

alias vrepo='use_repo v'
alias crepo='use_repo cat'




# edit wiki
#TODO: if '@$'!= 1 dont use this function (bug with fzf)
rg_repo(){
  orgin_pwd=$(pwd)
  cd '$1'
  rg "$2"
  sleep 10
  cd $orgin_pwd
}
alias rgdir='rg_repo'


mk(){
  mkdir $1 && cd $_
}

# curl_cheat(){
#   curl cheat.sh/"${1}"
# }

# alias sheat="curl_cheat"
# loot at cheatsheet in ~/bin

function xev(){
        /usr/bin/xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# Git functions
_fzf_pic(){
  git status | grep -E " *modified" | awk '{print $2}' | fzf
}

com(){
  git add -u
  git commit -a
  git push
}

headapp(){
  head $(which $1)
}


e(){
  if [[ "$@" != 0 ]]; then
    nvim "$@"
  else
    exec nvim -c 'Telescopefy'
  fi
}


zt (){
  zathura $@ > /dev/null &!;
}

xlb(){
  xlocate "$1" | grep "/$1$"
}


vfzf () {
        a=$(fzf)
        if [[ ! -z "$a" ]]
        then
                nvim "$a"
        else
                echo "no args"
        fi
}
