# !/bin/zsh

# complete
bindkey '^[[A' history-substring-search-up   # <UP>
bindkey '^[[B' history-substring-search-down # <DOWN>

bindkey '^P' history-substring-search-up     # <C-P>
bindkey '^N' history-substring-search-down   # <C-N>

bindkey '^ ' forward-word                    # key <C-Space>

bindkey '^[[1;5D' backward-word              # key <C-Left>
bindkey '^[[1;5C' forward-word               # key <C-right>

# keys
bindkey '^[[P' delete-char                   # key <delete>

set -o ignoreeof
bindkey '^D' delete-char                   # key <delete>
