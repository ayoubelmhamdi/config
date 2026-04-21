# !/bin/zsh

#1# complete
#1bindkey '^[[A' history-substring-search-up   # <UP>
#1bindkey '^[[B' history-substring-search-down # <DOWN>
#1
#1bindkey '^P' history-substring-search-up     # <C-P>
#1bindkey '^N' history-substring-search-down   # <C-N>
#1
#1bindkey '^@' forward-word                    # key <C-Space>
#1
#1
#1bindkey '^[[1;5D' backward-word              # key <C-Left>
#1bindkey '^[[1;5C' forward-word               # key <C-right>
#1
#1# keys
#1bindkey '^[[3~' delete-char                  # key <delete>
#1# bindkey '^[[P' delete-char                   # key <delete> alternative
#1
#1#set -o ignoreeof
#1#bindkey '^D' delete-char                   # key <delete>
#1
#1
#1# assert default
#1bindkey "^E" end-of-line
#1bindkey "^E" end-of-line
#1bindkey "^M" accept-line
#1bindkey "^[[P" delete-char
#1bindkey "^[[3~" delete-char
#1#1# bindkey "^[LEFT" "exec chvt 2"
#1#1# bindkey "^[RIGHT" "exec ls"
#1#1# bindkey "\e[1;3C" "exec ls"
#1
#1bindkey '^B' backward-char
#1
#1####################################
#1# kitty
#1
#1zmodload -i zsh/parameter
#1
#1insert-last-command-output() {
#1  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
#1}
#1zle -N insert-last-command-output
#1
#1bindkey "\e[105;5u" insert-last-command-output # ctrl + I
#1bindkey "^I" insert-last-command-output # ctrl + I
#1
#1# bindkey '\e[46;5u'  a # map ctrl+.
#1# bindkey '\e[44;5u'  a # map ctrl+,
#1# bindkey '\e[59;5u'  a # map ctrl+;
#1
#1
#1bindkey '\e[13;5u'  accept-line # ctrl + Enter
#1
#1# bindkey '\e[13;2u'  a # shift + Enter
#1
#1# bindkey '\e[72;6u'  a # map ctrl+shift+h
#1# bindkey '\e[74;6u'  a # map ctrl+shift+j
#1# bindkey '\e[75;6u'  a # map ctrl+shift+k
#1# bindkey '\e[76;6u'  a # map ctrl+shift+l
#1
