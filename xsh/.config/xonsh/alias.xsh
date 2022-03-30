#!/usr/bin/env xonsh

#         _   _               
#  __ _  | | (_)   __ _   ___ 
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/


# cd-ing shortcuts.
aliases['-'] = 'cd -'
aliases['..'] = 'cd ..'
aliases['...'] = 'cd ../..'
aliases['ll'] = lambda args: $[$LC_COLLATE='C' ls --group-directories-first -lAh --color @(args)]
aliases['md'] = lambda args: execx(f'mkdir -p {repr(args[0])} && cd {repr(args[0])}')
aliases['cp'] = ['rsync', '--progress', '--recursive', '--archive']
aliases['xc'] = 'xclip -sel clip'    
aliases['c'] = 'clear'    



# Utilities
aliases['ig'] = '/sbin/grep -i --color=auto'

# swallow by devour /sbin/mpv
aliases['mpv'] = 'devour /sbin/mpv'
aliases['zt'] = 'devour zathura'


# mv, rm, cp
aliases['cp'] = 'cp -ivr'
aliases['mv'] = 'mv -iv'
aliases['rm'] = 'rm -Ivr'
aliases['rmf'] = '/sbin/rm -vrf'
aliases['x'] = 'chmod +x'
aliases['w'] = 'whereis'



# aliases['ag'] = 'ag --follow --hidden -W (math $COLUMNS - 11)'
aliases['ag'] = 'ag --follow --hidden'
aliases['df'] = "df -h"
aliases['grep'] = "/sbin/grep"
# alias ddd='clear ;echo ; du -ah --max-depth 1|sort --sort=human-numeric --human-numeric-sort -r;'




aliases['main'] = "git checkout main ^ /dev/null || git checkout master"
aliases['master'] = "main"
aliases['add'] = 'git add'
aliases['addu'] = 'git add -u'
aliases['branch'] = 'git branch'
aliases['checkout'] = 'git checkout'
aliases['push'] = 'git push '
aliases['pull'] = 'git pull '
aliases['sta'] = 'git status'
aliases['gdiff'] = 'git diff'
aliases['up'] = 'git commit -m "up"'


aliases['ncat'] = '/sbin/cat'
aliases['tarxf'] = 'tar xf'
aliases['tarcf'] = 'tar cf'
aliases['c'] = 'clear && tmux clear-history  >/dev/null 2>&1'







aliases['gc'] = 'git clone --depth=1 --branch=master'
aliases['gc-main'] = 'git clone --depth=1 --branch=main'
aliases['co'] = 'git commit -m'

aliases['log'] = 'git log --oneline'


# xclip
aliases['xc'] = 'xclip -selection clipboard'
aliases['du'] = 'du -h '
aliases['wget'] = 'wget -c'

# nvim alias
# alias v='nvim -u $avim/init.lua'

aliases['e'] = 'nvimdir=~/.config/nvim nvim'
# aliases['v'] = 'nvimdir=~/.config/nvim nvim'
aliases['vv'] ='v -c "Telescope frecency default_text=:CWD:"'

aliases['atmux'] = 'tmux a|| tmux'
aliases['ping'] = 'ping -c 1'

aliases['v'] = lambda args: $[$nvimdir='~/.config/nvim nvim' nvim @(args)]
