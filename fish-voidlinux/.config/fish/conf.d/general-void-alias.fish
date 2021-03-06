set nvimdir "$HOME/.config/nvim/lua"
set packerdir "$HOME/.local/share/nvim/site/pack/packer/start"



alias cat='/bin/bat -p'

alias ls='clear ;/bin/exa --icons --color=always --group-directories-first'
alias nls='/bin/exa --icons --color=always --group-directories-first'
alias la='/bin/exa -a --icons --color=always --group-directories-first'
alias ll='/bin/exa -l --icons --color=always --group-directories-first'


alias lxl='xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
alias xl='xlocate'

# Defined via `source`
function ff --wraps='xbps-query -RS' --description 'alias ff=xbps-query -RS'
  xbps-query -RS $argv | awk '/homepage/ {print $2}'
end
