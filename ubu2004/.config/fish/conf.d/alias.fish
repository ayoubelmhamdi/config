set nvimdir "$HOME/.config/nvim/lua"
set packerdir "$HOME/.local/share/nvim/site/pack/packer/start"




alias cat='/bin/cat'

alias ls='clear ; echo ;/bin/ls  --color=always --group-directories-first'
alias nls='/bin/ls --color=always --group-directories-first'
alias la='/bin/ls -a --color=always --group-directories-first'
alias ll='/bin/ls -l --color=always --group-directories-first'


alias xro='apt-get autoremove;apt-get clean; apt-get autoclean; apt-get remove'
alias fix='apt-get --fix-broken'
alias holdpkg='apt-mark hold pkg'
alias unholdpkg='apt-mark unhold pkg'

alias ff='apt-cache show '; # or 'apt-cache policy'
alias lxl='apt-file search' #local xlocate file /bin/usr/wget : output is wget-2-3
