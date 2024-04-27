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

#set -o ignoreeof
#bindkey '^D' delete-char                   # key <delete>


# assert default
bindkey "^E" end-of-line
bindkey "^E" end-of-line
bindkey "^M" accept-line
bindkey "^[[P" delete-char
bindkey "^[[3~" delete-char
#1# bindkey "^[LEFT" "exec chvt 2"
#1# bindkey "^[RIGHT" "exec ls"
#1# bindkey "\e[1;3C" "exec ls"

bindkey '^B' backward-char

# kitty


# bindkey '\e[46;5u'  a # map ctrl+.
# bindkey '\e[44;5u'  a # map ctrl+,
# bindkey '\e[59;5u'  a # map ctrl+;


bindkey '\e[13;5u'  .accept-line # ctrl + Enter

# bindkey '\e[13;2u'  a # shift + Enter

# bindkey '\e[105;5u' a # ctrl + I

# bindkey '\e[72;6u'  a # map ctrl+shift+h
# bindkey '\e[74;6u'  a # map ctrl+shift+j
# bindkey '\e[75;6u'  a # map ctrl+shift+k
# bindkey '\e[76;6u'  a # map ctrl+shift+l

