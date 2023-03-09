# !/bin/zsh

#!/bin/bash

if [ -d "/data" ] && [ "$(stat -c '%U' /data)" = "$USER" ]; then
  builtin cd /data
  echo "/data $(stat -c '%U' /data) ? ${USER}" >> ~/zsh.log
elif [ -d "$HOME/data" ] && [ "$(stat -c '%U' "$HOME/data")" = "$USER" ]; then
  builtin cd $HOME/data
  echo "/data $(stat -c '%U' $HOME/data) ? ${USER}" >> ~/zsh.log
fi
 

# source ~/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(starship init zsh)"

# SETOPT
# ===== Basics
unsetopt beep         #turn off bell
unsetopt list_beep
set bell-style none

setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt extended_history       # add time to zshhistory like `:1659681839:0;cat hist`
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_ignore_all_dups   # ignore duplicated commands history list


export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

export LISTMAX=20             # Number of completions shown w/o asking
export TIMEFMT=$TIMEFMT       # Format for reporting usage with time
export WATCHFMT=$WATCHFMT     # Format of reports for $watch


alias ls=exa
alias myexls=exa
### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$HOME/.local/share/zinit" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    echo "\033[1;33mInstalling Zinit in $HOME/.local/share/zinit...\033[0m\n"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit






##########################
# OMZ Libs and Plugins   #
##########################

zinit wait lucid for \
    OMZL::completion.zsh \
    # OMZL::compfix.zsh \
    # OMZL::correction.zsh \
	# OMZL::clipboard.zsh \
	# OMZL::history.zsh \
	# OMZL::key-bindings.zsh \
	# OMZL::spectrum.zsh \
	# OMZL::termsupport.zsh \

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# plugin
zinit lucid light-mode wait depth=1 for             \
    atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
        zdharma/fast-syntax-highlighting           \
	atinit"zicompinit; zicdreplay"             \
        zsh-users/zsh-history-substring-search \
    blockf atpull'zinit creinstall -q .'       \
        zsh-users/zsh-completions              \
    atload"_zsh_autosuggest_start"             \
        zsh-users/zsh-autosuggestions          \
    # atload                                   \
    #     romkatv/powerlevel10k                \

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# zinit ice depth=1;
# zinit light romkatv/powerlevel10k
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ENV VARIABLE
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
export DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
export EDITOR=nvim
export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1



# GO SETTINGS
export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"
export GOPATH="$HOME/go/"
export PATH="$GOPATH/bin:$PATH"

if [[ -s $HOME/.config/zsh  ]];then
  for file in $HOME/.config/zsh/*;do
    zi ice silent wait 0.1
    zi snippet $file
  done
fi

if [[ -s /home/mhamdi/.config/zsh_post/zsh_post  ]];then
  zi ice silent wait 0.2
  zi snippet /home/mhamdi/.config/zsh_post/zsh_post
fi
