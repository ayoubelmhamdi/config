#!/bin/bash
#         _   _               
#  __ _  | | (_)   __ _   ___ 
# / _` | | | | |  / _` | / __|
#| (_| | | | | | | (_| | \__ \
# \__,_| |_| |_|  \__,_| |___/

# Diff Distribution {{{
#_isTermux=false
_isVoid=true
_isArch=false
_istermux=false
_isUbuntu=false
_isDebian=false

  # we're on TERMUX
  if $_istermux; then
    alias i='apt install' # install pkg
  fi

  # we're on UBUNTU
  if $_isUbuntu; then
    alias i='sudo apt install' # install pkg
  fi

  # we're on DEBIAN
  if $_isDebian; then
    alias i='sudo apt install' # install pkg
  fi

  # we're on VOID
  if $_isVoid; then
    #alias f="clear && sudo xbps-query -Rs|awk '{print $2}'|sed  's/-[0-9,_.]*$//'" # find pkg
    # alias f="clear && sudo xbps-query -Rs" # find pkg
    alias xapps='xbps-query -m | sed "s/-[0-9].*//"'  # insalled app
    alias ii='sudo xbps-install' # install pkg
    alias iis='sudo xbps-install -S' # install pkg
    alias iu='sudo xbps-install -Syuv' #upgrage
    alias svinit='init_runit_sv' #i don't now
    alias unlock='sudo xbps-pkgdb -a'  #fix xbps
    alias xrm='sudo xbps-remove -vR'   #remove pkg
    alias xro='sudo xbps-remove -vROo' #remove pkg & dependance
  fi

  # we're on ARCH
  if $_isArch; then
    alias f="pkgfile "				#
    alias i="sudo pacman -S "			#
    alias iy="sudo pacman -Sy --noconfirm"	#
    alias iyy="sudo pacman -Syy --noconfirm"	#
    alias iyyu='sudo pacman -Syyu'			# update only standard pkgs
    alias yua="yay -Sua --noconfirm --noconfirm"	# update only AUR pkgs
    alias yyu="yay -Syu --noconfirm"             	# update standard pkgs and AUR pkgs
    alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
    # get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
  fi

#}}}

# npm and pipe
alias pip-i='pip install'
alias npm-i='npm i -g'

alias xro-pip='pip uninstall'
alias xro-npm='npm uninstall'


  # bare git repo alias for dotfiles
  #alias cgit='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
  ## bare git repo alias for .dotfiles
  #alias cgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  #alias csta="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME status"
  #alias clog="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME log --oneline"
  #alias ccheckout="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout"
  #alias cadd="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME add"
  #alias caddu="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME add -u"
  #alias cc='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME commit -m'
  #alias cpush="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME push"
  #alias cpush-first="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME push --set-upstream origin"
  #alias cpull="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME pull && source $HOME/.alias"
  #alias cdiff="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME diff"
  ## /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME  config --local status.showUntrackedFiles no
  ## /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME  checkout



# alias mk='f(){ clear ; sudo mkdir -p "$1"; la; }; f'
# alias rr='f(){ clear ; sudo rm -r "$1"; la; }; f'
alias ddd='clear ;echo ; du -ah --max-depth 1|sort --sort=human-numeric --human-numeric-sort -r;'




#++++++++++++++++++++++++++++++++++++++++
#		ls			+
#++++++++++++++++++++++++++++++++++++++++
alias nls='/bin/exa  --color=always --group-directories-first'
alias ls='clear ; echo ; ;exa  --color=always --group-directories-first'
alias la='clear ; echo ; ;exa -a --color=always --group-directories-first'
alias ll='clear ; echo ; ;exa -l --color=always --group-directories-first'
alias lt='clear ; echo ; ;exa -aT --color=always --group-directories-first'
alias l.='clear ; echo ; ;exa -a | egrep "^\."'
#++++++++++++++++++++++++++++++++++++++++
#		other			+
#++++++++++++++++++++++++++++++++++++++++
alias sha='shasum -a 256'
alias shut='sudo shutdown -h now'


#++++++++++++++++++++++++++++++++++++++++
#		git			+
#++++++++++++++++++++++++++++++++++++++

# cu config push sh view in top


#	style 2
alias add='git add'
alias addu='git add -u'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push '
alias push-first='git push --set-upstream '
alias status='git status'
alias sta='git status'
alias master='git branch -M master'

alias gdiff='git diff'
alias gr='git remote set-url origin'
alias up='git commit -m "up"'




#++++++++++++++++++++++++++++++++++++++++
#		cd			+
#++++++++++++++++++++++++++++++++++++++++
# navigation
alias ..='cd ..' 
alias ...='cd ../..'



alias ncat='/sbin/cat'
alias cat='bat -p'


#++++++++++++++++++++++++++++++++++++++++
#		grep color		+
#++++++++++++++++++++++++++++++++++++++++
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ig='grep --color=auto -i'

#++++++++++++++++++++++++++++++++++++++++
#	   confirme cp/mv/rm		+
#++++++++++++++++++++++++++++++++++++++++

alias cp="cp -ivr"
alias mv='mv -iv'
alias rm='rm -Ivr'
alias rmf='/sbin/rm -vrf'

#++++++++++++++++++++++++++++++++++++++++
#		size files		+
#++++++++++++++++++++++++++++++++++++++++

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias head='head -n 24'

#++++++++++++++++++++++++++++++++++++++++
#		CPU & RAM		+
#++++++++++++++++++++++++++++++++++++++++
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
#++++++++++++++++++++++++++++++++++++++++
#		 youtube-dl		+
#++++++++++++++++++++++++++++++++++++++++

alias yt='youtube-dl --add-metadata-i'
alias ytv="yt -f bestvideo+bestaudio "
alias yta='yt -x -f bestaudio/best'
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "

#++++++++++++++++++++++++++++++++++++++++
#i	 switch between shells		+
#++++++++++++++++++++++++++++++++++++++++

alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#++++++++++++++++++++++++++++++++++++++++
#	    ARCHIVE EXTRACTION		+
#++++++++++++++++++++++++++++++++++++++++

ex (){
  if [ -f $1 ] ; then
    case $1 in
      *.7z)        7z x         $1   ;;
      *.Z)         uncompress   $1   ;;
      *.bz2)       bunzip2      $1   ;;
      *.deb)       ar x         $1   ;;
      *.gz)        gunzip       $1   ;;
      *.rar)       unar         $1   ;;      
      *.tar)       /sbin/tar xf $1   ;;
      *.tar.bz2)   /sbin/tar xf $1   ;;
      *.tar.gz)    /sbin/tar xf $1   ;;
      *.tar.xz)    /sbin/tar xf $1   ;;
      *.tar.zst)   unzstd       $1   ;;      
      *.tbz2)      tar          $1   ;;
      *.tgz)       tar          $1   ;;
      *.zip)       unzip        $1   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias tarxf='tar xf'


alias sm='scim'
alias c='clear && tmux clear-history  >/dev/null 2>&1;echo'
alias pi='ping google.com'
alias void='~/start-void.sh'







alias gb='git branch'
alias goto='git checkout'
alias newbranch='git checkout -b'


alias gc='git clone --depth=1 --branch=master'
alias gc-main='git clone --depth=1 --branch=main'
alias co='git commit -m'

alias log='git log --oneline'

alias remote='git remote add origin'
alias storage='cd /storage/sdcard0/Download/sc'
alias ytm="youtube-dl --extract-audio --audio-format mp3 "
alias sc='scim'
alias flatex='tlmgr search -- global'
alias ilatex='tlmgr install'
alias topdf='latex -output-format=pdf'


# accepte not corect command   sort /.*\%5v/  
alias lq='la'
alias ecit='exit'

alias runvnc='vncserver-start'
alias stopvnc='vncserver-stop'




##### .dotfiles
alias vzshrc='v ~/.zshrc'
alias valiasrc='v ~/.config/zsh/my_alias'
alias vrangerc='v ~/.config/ranger/rc.conf'
alias pssh="sshpass -p root ssh -o UserKnownHostsFile=\/dev\/null -o StrictHostKeyChecking=no"



alias x="chmod +x"
# alias p="ping google.com -c 1"
alias newbranch="git checkout -b "
alias checkout='git checkout -m '
alias master='git checkout -m master '
alias initialise-git='git commit -m "initialisation"'
alias upstream-git='/usr/bin/git push --set-upstream '

# xclip
alias xc='xclip -selection clipboard'
alias du='du -h '
alias wget 'wget -c'
alias xl='xlocate'

# nvim alias
# alias v='nvim -u $avim/init.lua'
alias v='nvim'
alias vv='v -c "Telescope frecency default_text=:CWD:"'
alias time='/usr/bin/time -p'
alias lookatme='lookatme --style vim'
alias p='lookatme --style vim'
alias atmux='tmux a|| tmux'
