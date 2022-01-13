export _TJ_PROFILE=0

if [[ $_TJ_PROFILE -eq 1 ]]; then
  zmodload zsh/datetime
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=$(mktemp zsh_profile.XXXXXXXX)
  echo "Logging to $logfile"
  exec 3>&2 2>$logfile

  setopt XTRACE
fi

# Set the shell to zsh
export SHELL=/bin/zsh

# Something for me to see where aliases get defined
# Use 256 colors
# export TERM=xterm-256color
export LANG=en_US.UTF8

## Import locations
export ZSH_CUSTOM="~/.config/zsh/custom/"
export ZSH_ENV_HOME=$HOME/

export XDG_CONFIG_HOME=$HOME/.config/

## ZSH options
setopt functionargzero
setopt hist_ignore_space

## ZSH environment options

## My "Plugins"
sources=(
  'autojump'
  'git'
)

for s in "${sources[@]}"; do
  source $HOME/.config/zsh/include/${s}.zsh
done

	# 'tmux.zsh'
sources=(
	'all_PATH'
	'color'
	'export_Dirs'
	'export_Linux'
	'my_function'
	'fzf.zsh'
	'keyboard'
	'my_alias'
	'zsh-keybinding'
)
for s in "${sources[@]}"; do
  source $HOME/.config/zsh/myzsh/${s}.zsh
done

## ZSH plugins
fpath=($XDG_CONFIG_HOME/zsh/submods/gcloud-zsh-completion/src/ $fpath)

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
function git_clone_or_update() {
  git clone "$1" "$2" 2>/dev/null && print 'Update status: Success' || (cd "$2"; git pull)
}

source $XDG_CONFIG_HOME/antigen.zsh

antigen bundle 'zsh-users/zsh-syntax-highlighting'
antigen bundle 'zsh-users/zsh-autosuggestions'
antigen bundle 'zsh-users/zsh-completions'

antigen bundle 'zsh-users/zsh-history-substring-search'

# source $HOME/.antigen/bundles/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh

antigen bundle 'agkozak/zsh-z'

# antigen theme spaceship-prompt/spaceship-prompt
# antigen theme robbyrussell

antigen apply


bindkey '^ ' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[P' delete-char


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'


export LC_ALL=en_US.UTF-8

# {{{1 Functions
# {{{2 Alias paths
alias_paths=( )
alias_with_path () {
    # BASE_PATH=`pwd -P`
    FILE_PATH="$0"

    # alias_paths+="$BASE_PATH/$FILE_PATH: Aliases $1"
    alias_paths+="File: $FILE_PATH ->    $1"
    \alias $1
}
# alias alias=alias_with_path
# }}}
# {{{2 Extract Stuff
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
# }}}
# }}}
# {{{1 Language specific configuration
# {{{2 Go
if [ -d /usr/local/go/bin/ ]; then
  export GOPATH=~/go
  export GOBIN="$GOPATH/bin"
  export PATH="/usr/local/go/bin:$GOBIN:$PATH"
elif [ -d ~/.go/bin/ ]; then
  export GOPATH="$HOME/.gopath"
  export GOROOT="$HOME/.go"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOPATH/bin:$PATH"
fi

# }}}
# {{{2 Haskell
export HASKELLPATH="$HOME/.cabal/bin"
export PATH=$PATH:$HASKELLPATH
# }}}


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export HISTFILE=/mega/repo/dotfiles/zsh_history

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



if [[ -d "$XDG_CONFIG_HOME/bin" ]]; then
  export PATH="$XDG_CONFIG_HOME/bin:$PATH"
fi


# Required for deoplete stuff
zmodload zsh/zpty
zmodload zsh/complist
zstyle ':completion:*' menu select

export GCLOUD_HOME="$HOME/Downloads/google-cloud-sdk"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$GCLOUD_HOME/path.zsh.inc" ]; then
    . "$GCLOUD_HOME/path.zsh.inc";
fi

# The next line enables shell command completion for gcloud.
if [ -f "$GCLOUD_HOME/completion.zsh.inc" ]; then
    . "$GCLOUD_HOME/completion.zsh.inc";
fi

export PATH="$HOME/.local/bin/:$PATH"
if hash nvim 2>/dev/null; then
  export EDITOR=nvim

  # Use nvim as manpager `:h Man`
  export MANPAGER='nvim +Man!'
else
  export EDITOR=vim
fi




if [[ $_TJ_PROFILE -eq 1 ]]; then
  unsetopt XTRACE
  exec 2>&3 3>&-
fi



  export VISUAL="nvim"
  export EDITOR="nvim"
 
 
 # ANDROID SDK {{
 # 
 # cmdline-tools /4.0 ==>  you can't rename this folder to Anothername
 # also you must locate under $ANDROID_HOME
 # first you must and accepte licenses
 # yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses 
 # sdkmanager --sdk_root=${ANDROID_HOME} --version
 # echo "sdk.dir=${PREFIX}/android-sdk" >> local.properties
 # mkdir /root/android-sdk/
 # dont do this in termux
 # sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools"
 # ./gradlew assembleDebug
 
 #}}
 
###############################################################
#  TODO: use "\r" + sleep 5 seconds to view answer            #
###############################################################
word=$(grep -v "^#" $wiki/learn.txt | shuf -n 1   | awk -F ';' '{ print $2 }');
printf "\n$word\n\n"
 

# latex
#
#  TODO: move to subdir
##
PATH="/root/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/root/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/root/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/root/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/root/perl5"; export PERL_MM_OPT;

# plugin and complition for cht.sh 


# PROMPT
# must setopt PROMPT_SUBST uafter $PROMPT
# without it,i can not use function in prompte
# also i cant using single quote
export PROMPT='$(get_cwd)%f%b '
setopt PROMPT_SUBST
