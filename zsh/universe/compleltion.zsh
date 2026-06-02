

# goup completion `$app<TAB>`
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias parameter builtins functions commands
# zstyle ':completion:*' file-list all

# complete `$ app<space>-<tab>` by intelegent ^_^
zstyle ':completion:*' complete-options true


flatten-line() {
  BUFFER=$(printf '%s' "$BUFFER" | perl -0 -pe 's/\\\n\s*/ /g; s/^\s+|\s+$//g')
  CURSOR=$#BUFFER
}
zle -N flatten-line
bindkey '^F' flatten-line
