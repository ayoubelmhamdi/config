#!/bin/zsh

declare -a bookmark=(
    't:/tmp'
    'T:~/tmp'
    'd:/mnt/simple/Download'
    'D:~/tmp/simple_download'
    'm:/mnt/simple/movies'
    'b:~/book/new'
    'W:~/tmp/whatsapp'
    'w:/mnt/simple/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Documents'
    'u:/mnt'
    's:/mnt/winD/s3'
    'S:~/tmp/s3'
    'r:/'
)

# echo "${arr[@]}"
for b in  "${bookmark[@]}";do
    NNN_BMS+="$b;"
done

export NNN_BMS
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=0
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TMPFILE="/tmp/nnn"

# export VISUAL=ewrap
export NNN_SSHFS='sshfs -o reconnect,idmap=user,cache_timeout=3600'

NNN_A='a:-'         ; NNN_B='b:-!bat -p'   ; NNN_C='c:-'       ; NNN_D='d:-!git diff'        ;
NNN_E='e:-'         ; NNN_F='f:-finder'    ; NNN_G='g:-'       ; NNN_H='h:-'                 ;
NNN_I='i:-imgsxiv'  ; NNN_J='j:-'          ; NNN_K='k:-'       ; NNN_L='l:-!git log'         ;
NNN_M='m:-'         ; NNN_N='n:-'          ; NNN_O='o:-fzopen' ; NNN_P='p:-preview-tabbed'   ;
NNN_Q='q:-'         ; NNN_R='r:-'          ; NNN_S='s:-'       ; NNN_T='t:-nmount'           ;
NNN_U='u:-'         ; NNN_V='v:-imgview'   ; NNN_W='w:-'       ; NNN_X='x:-!chmod +x $nnn*'  ;
NNN_Y='y:-'         ; NNN_Z='z:-'          ;

export NNN_PLUG="$NNN_A;$NNN_B;$NNN_C;$NNN_D;$NNN_E;$NNN_F;$NNN_G;$NNN_H;$NNN_I;$NNN_J;$NNN_K;$NNN_L;$NNN_M;$NNN_N;$NNN_O;$NNN_P;$NNN_Q;$NNN_R;$NNN_S;$NNN_T;$NNN_U;$NNN_V;$NNN_W;$NNN_X;$NNN_Y;$NNN_Z;"

