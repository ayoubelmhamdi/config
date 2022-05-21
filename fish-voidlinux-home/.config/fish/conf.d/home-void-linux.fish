#need sudo

function i --description 'install app and add to list'
	sudo xbps-install $argv && echo $argv >> /opt/applist/xbps.list
end

function iu --description 'install app and add to list'
	sudo xbps-install -Su 
end
 
 
function is --description 'sync and function i'
	sudo xbps-install -S $argv && echo $argv >> /opt/applist/xbps.list
end
