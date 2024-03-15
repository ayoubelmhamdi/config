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

# # plugin
# zinit lucid light-mode wait depth=1 for    \
#   atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
#     zdharma/fast-syntax-highlighting       \
#   atinit"zicompinit; zicdreplay"           \
#     zsh-users/zsh-history-substring-search \
#   blockf atpull'zinit creinstall -q .'   \
#     zsh-users/zsh-completions              \
#   atload"_zsh_autosuggest_start"         \
#     zsh-users/zsh-autosuggestions          \
#   # atload                                   \
#   #     romkatv/powerlevel10k                \
#
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



va(){
    unset PIP_TARGET;
    unset PYTHONPATH;
    # source venv/bin/activate;  # commented out by conda initialize
}

venv(){
    . "/home/mhamdi/miniconda3/etc/profile.d/conda.sh"
    # we can not use the original python miniconda to create venv but we should
    # have the `conda create -n colab python3.7` to use it as pyenv python==3.7
    conda activate
    # conda activate py36

    #1 eval "$(pyenv init -)"
    #1 eval "$(pyenv virtualenv-init -)"
    #1 pyenv local 3.10.0

    unset PIP_TARGET
    unset PYTHONPATH
    python3 --version
    python3 -m venv venv
    #1 rm -f ./.python-version # don't remove this file before creating the venv
    #1 #source venv/bin/activate
    echo -e 'unset PIP_TARGET;\nunset PYTHONPATH;\nsource venv/bin/activate;' > ./.envrc
    direnv allow .
}
