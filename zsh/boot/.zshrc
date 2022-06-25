#!/bin/zsh

### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$HOME/.local/share/zinit" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    echo "\033[1;33mInstalling Zinit in $HOME/.local/share/zinit...\033[0m\n"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

#####################
# PROMPT            #
#####################
# export STARSHIP_CONFIG=~/.config/dotfiles/starship.toml
# zinit ice as"program"  atpull"%atclone" \
#         atload'eval $(starship init zsh)'
# zinit light starship/starship
zinit ice depth=1; zinit light romkatv/powerlevel10k

##########################
# OMZ Libs and Plugins   #
##########################

# IMPORTANT:
# Ohmyzsh plugins and libs are loaded first as some these sets some defaults which are required later on.
# Otherwise something will look messed up
# ie. some settings help zsh-autosuggestions to clear after tab completion

setopt promptsubst

# Loading tmux first, to prevent jumps when tmux is loaded after .zshrc
# It will only be loaded on first start
zinit ice atinit"
        ZSH_TMUX_FIXTERM=true;
        ZSH_TMUX_AUTOCONNECT=true;"
        # ZSH_TMUX_AUTOSTART=true;
zinit snippet OMZP::tmux

zinit wait lucid for \
	OMZL::clipboard.zsh \
	OMZL::compfix.zsh \
	OMZL::completion.zsh \
	OMZL::correction.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
	OMZL::git.zsh \
	OMZL::grep.zsh \
	OMZL::history.zsh \
	OMZL::key-bindings.zsh \
	OMZL::spectrum.zsh \
	OMZL::termsupport.zsh \
    atload"
        alias gcd='gco dev'
    " \
	OMZP::fzf \
    atload"
        alias dcupb='docker-compose up --build'
    " \
	OMZP::docker-compose \
	as"completion" \
    OMZP::docker/_docker \
    djui/alias-tips \
    # hlissner/zsh-autopair \
    # chriskempson/base16-shell \

#####################
# PLUGINS           #
#####################
# @source: https://github.com/crivotz/dot_files/blob/master/linux/zplugin/zshrc

# IMPORTANT:
# These plugins should be loaded after ohmyzsh plugins

zinit wait lucid for \
    light-mode atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    light-mode atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
        zdharma/fast-syntax-highlighting \
    light-mode blockf atpull'zinit creinstall -q .' \
    atinit"
        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
        zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
        zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
    " \
        zsh-users/zsh-completions \
    bindmap"^R -> ^H" atinit"
        zstyle :history-search-multi-word page-size 10
        zstyle :history-search-multi-word highlight-color fg=red,bold
        zstyle :plugin:history-search-multi-word reset-prompt-protect 1
    " \
        zdharma/history-search-multi-word \
    reset \
    atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
            \${P}sed -i \
            '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
            \${P}dircolors -b LS_COLORS > c.zsh" \
    atpull'%atclone' pick"c.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    	trapd00r/LS_COLORS

    # atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down' \
    #     zsh-users/zsh-history-substring-search

# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
# zinit light zsh-users/zsh-autosuggestions

# zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
# zinit light zsh-users/zsh-history-substring-search
# atload"
#     bindkey '^[[A' history-substring-search-up;
#     bindkey '^[[B' history-substring-search-down;
#     bindkey -M vicmd 'k' history-substring-search-up;
#     bindkey -M vicmd 'j' history-substring-search-down;
# " \

# zinit ice wait"0b" lucid bindmap'^R -> ^H' atinit'zstyle ":history-search-multi-word" page-size "10"; zstyle ":history-search-multi-word" highlight-color "fg=red,bold";'
# zinit load zdharma/history-search-multi-word
#

# TAB COMPLETIONS
# zinit ice wait"0b" lucid blockf
# zinit light zsh-users/zsh-completions

# Find a way to change after syntax is loaded
# FAST_THEME_NAME=spa
# zinit ice wait"0c" lucid atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay"
# zinit light zdharma/fast-syntax-highlighting


#####################
# PROGRAMS          #
#####################

# # A fork of `z' by rupa deadwyler with much improved zsh/bash completion and better results. The data file format and core algorithm are compatible with those of the original.
# zinit wait'1' lucid light-mode for \
#     pick"z.sh" \
#     knu/z \
#     as'command' atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' pick"bin/n" \
#     tj/n \
#     from'gh-r' as'command' atinit'export PATH="$HOME/.yarn/bin:$PATH"' mv'yarn* -> yarn' pick"yarn/bin/yarn" bpick'*.tar.gz' \
#     yarnpkg/yarn \
#

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
# set -o emacs
# setopt vi
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt always_to_end          # cursor moved to the end in full completion
setopt hist_verify            # show command with history expansion to user before running it
setopt hash_list_all          # hash everything before completion
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt share_history          # share command history data
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu

#####################
# ENV VARIABLE      #
#####################
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
export EDITOR=nvim
export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1



#####################
# FZF SETTINGS      #
#####################
FD_OPTIONS="--hidden --follow"
export FZF_DEFAULT_OPTS="--prompt '⯈ ' --marker=+ --color=dark --layout=reverse --color=fg:250,fg+:15,hl:203,hl+:203 --color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15"
export FZF_DEFAULT_COMMAND="fd -E '.git' --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_COMPLETION_OPTS="-x"

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}

#####################
# GO SETTINGS       #
#####################
export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"
export GOPATH="$HOME/go/"
export PATH="$GOPATH/bin:$PATH"


#####################
# Node and Yarn     #
#####################
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


#####################
# Functions         #
#####################
# echo "Ethernet :: IP => $( ip -4 -o a show wlan1 | awk '{ print $4 }' )"
ip-internal() echo "Wireless :: IP => $( ip -4 -o a show wlo1 | awk '{ print $4 }' )"
ip-external() echo "External :: IP => $( curl --silent https://ifconfig.me )"
ipinfo() { ipInternal && ipExternal }

prcreate() gh pr create -B "$1" -f
prmerge() gh pr merge --merge --delete-branch=false "$1"
prlist() gh pr list --state open
prcheck() { gh pr checkout "$1" && gh pr diff }

# open_with_fzf() {
#     fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
# }

# cd_with_fzf() {
#     cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
# }
# zle -N cd_with_fzf{,}

# pacs() {
#     sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
# zle -N pacs{,}


# bindkey '^N' cd_with_fzf


#####################
# Misc Stuff        #
#####################

# typeset -U config_files
# config_files=($HOME/.zsh/*.zsh)

# 1. Load anything which ends with e.zsh
# 2. Load anything except file ending with e.zsh
# zinit is-snippet for \
#     ${(M)config_files:#*/*e.zsh} \
#     ${config_files:#*/*e.zsh}  \

# alias g="command g"

if command -v pazi &>/dev/null; then
  eval "$(pazi init zsh)" # or 'bash'
fi
zinit is-snippet for \
    if"[[ -f $HOME/.config/zsh/autoloadrc  ]]" $HOME/.config/zsh/autoloadrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
