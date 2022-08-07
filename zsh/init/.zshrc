# !/bin/zsh

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

# IMPORTANT:
# Ohmyzsh plugins and libs are loaded first as some these sets some defaults which are required later on.
# Otherwise something will look messed up
# ie. some settings help zsh-autosuggestions to clear after tab completion
# me: https://stackoverflow.com/questions/36192523/zsh-prompt-customization
# setopt promptsubst

# Loading tmux first, to prevent jumps when tmux is loaded after .zshrc
# It will only be loaded on first start
# zinit ice atinit"
#         ZSH_TMUX_FIXTERM=true;
#         ZSH_TMUX_AUTOCONNECT=true;"
        # ZSH_TMUX_AUTOSTART=true;
# zinit snippet OMZP::tmux

zinit lucid light-mode depth=1 for             \
    zdharma/fast-syntax-highlighting           \
	atinit"zicompinit; zicdreplay"             \
        zsh-users/zsh-history-substring-search \
    blockf atpull'zinit creinstall -q .'       \
        zsh-users/zsh-completions              \
    atload"_zsh_autosuggest_start"             \
        zsh-users/zsh-autosuggestions          \
    # atload                                     \
    #     romkatv/powerlevel10k                  \

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

zinit ice depth=1;
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ENV VARIABLE
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
export EDITOR=nvim
export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1



# GO SETTINGS
export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"
export GOPATH="$HOME/go/"
export PATH="$GOPATH/bin:$PATH"

if command -v pazi &>/dev/null; then
  eval "$(pazi init zsh)" # or 'bash'
fi
if [[ -s $HOME/.config/zsh  ]];then 
    for file in $HOME/.config/zsh/*;do
        zi ice silent wait
        zi snippet $file
    done
fi
