set nvimdir "$HOME/.config/nvim/lua"
set packerdir "$HOME/.local/share/nvim/site/pack/packer/start"

alias xro='xbps-remove -vROo'



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

function i --description 'install app and add to list'
	xbps-install "$argv" && echo "$argv" >> /opt/pkg.list
end

 
 
function is --description 'sync and function i'
	xbps-install -S "$argv" && echo "$argv" >> /opt/pkg.list
end

function ipip --description 'use pip to list install pkg'
  if count $argv -ge 1 >/dev/null
     python3 -m pip install "$argv"
  else
     echo -e "\nsomthing wrong ...\n\n"
  end
end

function inpm --description 'use  npm to list install pkg npm'
  if count $argv -ge 1 >/dev/null
     /usr/bin/npm  install -g "$argv"
  else
     echo -e "\nsomthing wrong ...\n\n"
  end
end



#use pwd in tmux status
# precmd () {
#   [[ $(pgrep tmux| wc -l) >1 ]] && tmux set -qg status-left '[ #[bold]#{pane_current_path} ]    '
# }
# 
# 

# 
# 
# vfzf () {
#         a=$(fzf)
#         if [[ ! -z "$a" ]]
#         then
#                 nvim "$a"
#         else
#                 echo "no args"
#         fi
# }
