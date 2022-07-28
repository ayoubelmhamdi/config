#!/bin/zsh

### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$HOME/.local/share/zinit" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    echo "\033[1;33mInstalling Zinit in $HOME/.local/share/zinit...\033[0m\n"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zi ice silent wait"1"
zi snippet ~/.zinit
