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

#function z
#    if test -d $argv
#        cd $argv
#        zoxide add
#    else
#        set zres ( zoxide query $argv|cut -c8-)
#        if test (count $zres) -gt 0
#            cd $zres
#        end
#    end
#end

cd (){
    if [ $# -eq 0 ];then
        # builtin cd $HOME
        builtin cd /data
        return
    fi

    if ! [ "$1" != ".." ];then
        builtin cd ..
        return
    fi

    if ! [ "$1" != "..." ];then
        builtin cd ../..
        return
    fi

    if ! [ "$1" != "~" ];then
        builtin cd $HOME
        return
    fi

    if ! [ "$1" != "-" ];then
        builtin cd -
        return
    fi

    if [ -d "$1" ];then
        builtin cd "$1"
        zoxide add .
        return
    fi

    query=$( zoxide query "$1" >/dev/null 2>&1 | head -1)
    if [ $? -eq 0 ] && [ -d "$query" ];then
        builtin cd "$query"
        zoxide add "$query"
    else
        case "$1" in
            "pack"*) builtin cd "$packerdir" ;;
            *) echo 'zoxide: no match found !!' ;;
        esac
    fi
}
