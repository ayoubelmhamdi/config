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

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

function copy-buffer-to-clipboard() {
  echo -n "$BUFFER" | pbcopy
  zle -M "Copied to clipboard"
}
zle -N copy-buffer-to-clipboard
bindkey '^X^C' copy-buffer-to-clipboard


##########################
# OMZ Libs and Plugins   #
##########################


# PLUGIN CONFIG
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1      # UP/dwon without fuzzy finder
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1 # do no duplicate search
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1          # make prompt faster
export ABBR_EXPAND_AND_ACCEPT_PUSH_ABBREVIATED_LINE_TO_HISTORY=0
export ABBR_EXPAND_PUSH_ABBREVIATED_LINE_TO_HISTORY=0


# # put abbr after zsh-completion to make sure the completion work at least fine and not make abbr fuck up my complition.
# zinit wait:1 lucid atload for olets/zsh-abbr


zinit wait lucid for \
    OMZL::completion.zsh \
    # OMZL::compfix.zsh \
    # OMZL::correction.zsh \
    # OMZL::clipboard.zsh \
    # OMZL::history.zsh \
    # OMZL::key-bindings.zsh \
    # OMZL::spectrum.zsh \


# Plugin
# <condition>..then..<plugin>
zinit wait lucid light-mode depth=1 for \
    atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
        zdharma/fast-syntax-highlighting    \
    atinit"zicompinit; zicdreplay"          \
    atload"                                 \
        bindkey '^[[A' history-substring-search-up;   \
        bindkey '^[[B' history-substring-search-down; \
        bindkey '^P'   history-substring-search-up;   \
        bindkey '^N'   history-substring-search-down" \
        zsh-users/zsh-history-substring-search  \
    atload"zicompinit; zicdreplay" blockf   \
        zsh-users/zsh-completions           \
    wait'1'          \
        olets/zsh-abbr                      \
    wait'1' atload"_zsh_autosuggest_start"          \
        zsh-users/zsh-autosuggestions       \

# complete
bindkey '^@'        forward-word   # key <C-Space>
bindkey '^[[1;5C'   forward-word   # key <C-right>
bindkey '^[[1;5D'   backward-word  # key <C-Left>
bindkey '^B'        backward-char


bindkey '\e[13;5u'  accept-line # ctrl + Enter

# assert default
bindkey "^E"        end-of-line
bindkey "^M"        accept-line
bindkey "^[[P"      delete-char
bindkey "^[[3~"     delete-char


####################################
# kitty

zmodload -i zsh/parameter

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output

bindkey "\e[105;5u" insert-last-command-output # ctrl + I
bindkey "^I"        insert-last-command-output # ctrl + I (maybe kitty)



# ENV VARIABLE
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

export SPACESHIP_EXIT_CODE_SHOW=true

alias vn='NVIM_APPNAME=nvim-nvchad     nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart  nvim' # Kickstart
alias va='NVIM_APPNAME=nvim-astrovim   nvim' # AstroVim

bindkey -e
