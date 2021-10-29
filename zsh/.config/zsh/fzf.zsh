export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(bash {+})'
"
# fzf's command fd
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# rg
# i wnat now test fd

# zsh autocomlete 
zsh_fzf_compgen_path() {
    fd . "$1"
}

fzf_compgen_dir() {
    fd --type d . "$1"
}
