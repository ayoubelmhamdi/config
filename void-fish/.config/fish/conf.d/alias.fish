set nvimdir "$HOME/.config/nvim/lua"
set packerdir "$HOME/.local/share/nvim/site/pack/packer/start"



alias cat='/bin/bat -p'

alias ls='clear ; echo ;/bin/exa  --color=always --group-directories-first'
alias nls='/bin/exa --color=always --group-directories-first'
alias la='/bin/exa -a --color=always --group-directories-first'
alias ll='/bin/exa -l --color=always --group-directories-first'


alias xro='xbps-remove -vROo'
alias fix='xbps-pkgdb -a'
alias holdpkg='xbps-pkgdb -m hold'
alias unholdpkg='xbps-pkgdb -m unhold'

alias ff='xbps-query -RS'
alias lxl='xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
