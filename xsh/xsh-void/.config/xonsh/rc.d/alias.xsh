aliases['ls'] = lambda args: $[$LC_COLLATE='C' clear; echo;exa --color=always --group-directories-first -h @(args)]
aliases['nll'] = lambda args: $[$LC_COLLATE='C' clear; echo;exa --color=always --group-directories-first -h @(args)]
aliases['la'] = lambda args: $[$LC_COLLATE='C' clear; echo;exa --color=always --group-directories-first -a @(args)]
aliases['ll'] = lambda args: $[$LC_COLLATE='C' clear; echo;exa --color=always --group-directories-first -lAh @(args)]

aliases['cat'] = '/bin/bat -p'



aliases['xro'] = 'xbps-remove -vROo'
aliases['fix'] = 'xbps-pkgdb -a'
aliases['holdpkg'] = 'xbps-pkgdb -m hold'
aliases['unholdpkg'] = 'xbps-pkgdb -m unhold'

aliases['ff'] = 'xbps-query -RS'
aliases['lxl'] = 'xbps-query -o' #local xlocate file /bin/usr/wget : output is wget-2-3
aliases['xl'] = 'xlocate'


#aliases['...'] = 'cd ../..'
#aliases['ll'] = lambda args: $[$LC_COLLATE='C' ls --group-directories-first -lAh --color @(args)]
#aliases['md'] = lambda args: execx(f'mkdir -p {repr(args[0])} && cd {repr(args[0])}')
#aliases['cp'] = ['rsync', '--progress', '--recursive', '--archive']
