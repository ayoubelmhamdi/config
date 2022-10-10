#!/bin/zsh

export CD_NNN="/tmp/nnn"
export CD_FORK="/tmp/fork"

n(){
    nnn "$@"

    if [ -f $CD_NNN ]; then
        . $CD_NNN
        rm $CD_NNN
    fi
}

fork(){
    command fork "$@"

    if [ -f $CD_FORK ]; then
        . $CD_FORK
        rm $CD_FORK
    fi
}

