# for root

function i --description 'install app and add to list'
	xbps-install $argv && echo $argv >> /opt/applist/xbps.list
end

function iu --description 'install app and add to list'
	xbps-install -Su 
end
 
 
function is --description 'sync and function i'
	xbps-install -S $argv && echo $argv >> /opt/applist/xbps.list
end
