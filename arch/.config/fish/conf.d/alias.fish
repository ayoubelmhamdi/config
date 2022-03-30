set nvimdir "$HOME/.config/nvim/lua"
set packerdir "$HOME/.local/share/nvim/site/pack/packer/start"


alias cat='/bin/bat -p'

alias ls='clear ; echo ;/bin/exa  --color=always --group-directories-first'
alias nls='/bin/exa --color=always --group-directories-first'
alias la='/bin/exa -a --color=always --group-directories-first'
alias ll='/bin/exa -l --color=always --group-directories-first'


alias xro='pacman -Qdtq | pacman -Rs -;pacman -Sc;pacman -Scc; pacman -Rs'
alias fix='rm -f /var/lib/pacman/db.lck' # todo
#alias holdpkg='xxx' # modify IgnorePkg array: /etc/pacman.conf
#alias unholdpkg='xxx' # modify IgnorePkg array: /etc/pacman.conf

alias ff='pacman -[S|Q]i'
#local xlocate file /bin/usr/wget : output is wget-2-3
alias lxl='pacman -Ql'
alias xl='pkgfile'
#alias xl='pkgfile -l' # all file
#alias xl='pkgfile -s' 
