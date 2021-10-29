#!/bin/zsh

if [[ -z "$TMUX" ]]; then
  if [[ ! $TERM =~ "xterm-256color" ]]; then
    # tmux attach -t tmux-ay || tmux
    # [[ $(pgrep tmux| wc -l) >1 ]] || tmux attach   >/dev/null 2>&1 || tmux new-session -s tmux-ay -n win1-ay
    if [[ $(pgrep tmux| wc -l) == 0 ]]; then 
      tmux new-session -s tmux-ay -n win1-ay
    elif [[ $(pgrep tmux| wc -l) == 1 ]]; then 
      echo "pid=1"
      tmux attach   >/dev/null 2>&1 
    else
      echo "pid=2"
      : #tmux attach   >/dev/null 2>&1 
    fi
  fi
fi
