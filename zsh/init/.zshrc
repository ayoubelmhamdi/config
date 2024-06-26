#!/bin/zsh
# if touch "/data" ; then
#   builtin cd /data
# elif touch "$HOME/data" ; then
#   builtin cd $HOME/data
# fi
#
eval "$(starship init zsh &!)"
fpath=(~/.config/fpath $fpath)

# source ~/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# SETOPT
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


### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

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

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# # plugin
zinit wait lucid light-modedepth=1 for    \
    atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting       \
    atinit"zicompinit; zicdreplay"           \
    zsh-users/zsh-history-substring-search \
    atload"zicompinit; zicdreplay" blockf  \
    zsh-users/zsh-completions              \
    atload"_zsh_autosuggest_start"         \
    zsh-users/zsh-autosuggestions          \

# prevent /etc/zshrc to call


# TODOL move to zprofile path env

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

# alias ls="command ls"
unalias ls 2>/dev/null


if [[ -s $HOME/.config/zsh  ]];then
    for file in $HOME/.config/zsh/* $HOME/.config/zsh_post/*;do
        zi ice lucid wait
        zi snippet "$file"
    done
fi

venv(){
    # . "/home/mhamdi/miniconda3/etc/profile.d/conda.sh"
    # we can not use the original python miniconda to create venv but we should
    # have the `conda create -n colab python3.7` to use it as pyenv python==3.7
    # conda activate
    # conda activate py36

    unset PIP_TARGET
    unset PYTHONPATH
    python3 --version
    python3 -m venv venv

    version="$(python3 --version)"
    if   [[ "$version" == "Python 3.12"* ]]; then pyenv="py312"; pylib="python3.12";
    elif [[ "$version" == "Python 3.11"* ]]; then pyenv="py311"; pylib="python3.11";
    elif [[ "$version" == "Python 3.10"* ]]; then pyenv="py310"; pylib="python3.10";
    elif [[ "$version" == "Python 3.6"*  ]]; then pyenv="py306"; pylib="python3.6" ;
    else exit 1;fi

    cat >> ./.envrc << EOL
#!/bin/bash

# $(python3 --version)

unset PIP_TARGET
unset PYTHONPATH
source venv/bin/activate

export PYTHONPATH="\$PYTHONPATH:/data/local_tmp/pyenvs/${pyenv}/venv/lib/${pylib}/site-packages"
export PATH="\$PATH:/data/local_tmp/pyenvs/${pyenv}/venv/bin"
EOL

    direnv allow .
}

alias vn='NVIM_APPNAME=nvim-nvchad     nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart  nvim' # Kickstart
alias va='NVIM_APPNAME=nvim-astrovim   nvim' # AstroVim

bindkey -e
