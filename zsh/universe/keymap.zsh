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



# https://github.com/tomsquest/dotfiles/blob/969a13d2fb33e1f0013843ef4b4708bbdac3e10a/zsh/bindkey.zsh
# Standard and additional keybindings
#
# Find the key with: showkey -a
#
#   ctrl + u     : clear line
#   ctrl + w     : delete word backward
#   alt  + d     : delete word
#   ctrl + a     : move to beginning of line
#   ctrl + e     : move to end of line (e for end)
#   alt/ctrl + f : move to next word (f for forward)
#   alt/ctrl + b : move to previous word (b for backward)
#   ctrl + d     : delete char at current position (d for delete)
#   ctrl + k     : delete from character to end of line
#   alt  + .     : cycle through previous args

# Emacs style bindings (for Home/End keys...)
# bindkey -e

#1# In menu completion, the Return key will accept the current selected match
#1bindkey -M menuselect '^M' .accept-line
#1
#1# shift-tab: go backward in menu (invert of tab)
#1bindkey '^[[Z' reverse-menu-complete
#1
#1# alt-x: insert last command result
#1zmodload -i zsh/parameter
#1insert-last-command-output() {
#1  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
#1}
#1zle -N insert-last-command-output
#1bindkey '^[x' insert-last-command-output
#1
#1# ctrl+b/f or ctrl+left/right: move word by word (backward/forward)
#1bindkey '^b' backward-char
#1bindkey '^f' forward-char
#1bindkey '^[[1;5D' backward-word
#1bindkey '^[[1;5C' forward-word
#1
#1# ctrl+backspace: delete word before
#1bindkey '^H' backward-kill-word
#1# ctrl+delete: delete word after
#1bindkey "\e[3;5~" kill-word
#1
#1# alt+m: copy last word
#1bindkey "^[m" copy-prev-shell-word
#1
#1# Ctrl+space: print Git status
#1bindkey -s '^ ' ' git status --short^M'
#1
#1# Alt+~: run Git WTF script
#1function _git_wtf {
#1  echo
#1  git-wtf
#1  zle reset-prompt
#1}
#1zle -N _git_wtf
#1bindkey '^[`' _git_wtf
#1
#1# Execute the current suggestion (using zsh-autosuggestions)
#1# Alt+Enter = '^[^M' on recent VTE and '^[^J' for older (Lxterminal)
#1bindkey '^[^M' autosuggest-execute
#1bindkey '^[^J' autosuggest-execute
#1
#1# Disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
#1stty -ixon -ixoff
