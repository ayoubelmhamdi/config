#!/bin/zsh

export NNN_BMS='d:~/Documents;r:/root;D:~/Downloads/'
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=1
export NNN_FIFO=/tmp/nnn.fifo

# function nnn_cd()                                                                                                   
# {
#     if ! [ -z "$NNN_PIPE" ]; then
#         printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
#     fi  
# }
#
# trap nnn_cd EXIT
# export nnn="$1"


NNN_A='a:-'
NNN_B='b:-'
NNN_C='c:-'
NNN_D='d:-!git diff'
NNN_E='e:-'
NNN_F='f:-finder'
NNN_G='g:-'
NNN_H='h:-'
NNN_I='i:-'
NNN_J='j:-'
NNN_K='k:-'
NNN_L='l:-!git log'
NNN_M='m:-'
NNN_N='n:-'
NNN_O='o:-fzopen'
NNN_P='p:-preview-tabbed'
# NNN_P='p:-!less -iR $nnn*'
NNN_Q='q:-'
NNN_R='r:-'
NNN_S='s:-'
NNN_T='t:-nmount'
NNN_U='u:-'
NNN_V='v:-imgview'
NNN_W='w:-'
NNN_X='x:-!chmod +x $nnn*'
NNN_Y='y:-'
NNN_Z='z:-'

NNN_PLUG="$NNN_A;$NNN_B;$NNN_C;$NNN_D;$NNN_E;$NNN_F;$NNN_G;$NNN_H;$NNN_I;$NNN_J;$NNN_K;$NNN_L;$NNN_M;$NNN_N;$NNN_O;$NNN_P;$NNN_Q;$NNN_R;$NNN_S;$NNN_T;$NNN_U;$NNN_V;$NNN_W;$NNN_X;$NNN_Y;$NNN_Z;"
export NNN_PLUG
