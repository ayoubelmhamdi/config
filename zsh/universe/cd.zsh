#!/bin/zsh


n(){
    TMPFILE="${TMPFILE:-/tmp}"
    NNN_FIFO="$TMPFILE/nnn.fifo" NVIM_APPNAME=nvim-ayoub nnn "$@"
}

fork(){
    command fork "$@"

    if [ -f $CD_FORK ]; then
        . $CD_FORK
        rm $CD_FORK
    fi
}

cd (){
    if [ $# -eq 0 ];then
        # builtin cd $HOME
        if touch /data 2>/dev/null;then
          builtin cd /data
        else
          builtin cd
        fi
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

    n=$(zoxide query "$1" -l 2>/dev/null | wc -l)
    if [ $n -eq 0 ] ;then
        echo "cd: no such file or directory: $1"
        return
    elif [ $n -ge 2 ] ;then
        if zoxide query "$1" -ls 2>/dev/null | awk 'NR==1{a=$1} NR==2{b=$1} END{exit !(a>=10*b)}'; then
            query=$(zoxide query "$1" 2>/dev/null)
        else
            query=$(zoxide query "$1" -i 2>/dev/null)
        fi
        builtin cd "$query"
        zoxide add "$query"
    elif [ $n -eq 1 ] ;then
        query=$(zoxide query "$1" 2>/dev/null)
        if [ $? -eq 0 ] && [ -d "$query" ];then
            builtin cd "$query"
            zoxide add "$query"
        else
            echo "cd.zsh: Unreacheble zoxide: query=1 and zoxide faild or directory not exit" >&1
            return 1
        fi
    else
        echo "cd.zsh: Unreacheble zoxide \$n < 0" >&1
        return 1
    fi
}

cdf(){
    file=${1-}
    if [[ ! -z $file ]];then
        if [[ -f $file ]];then
           cd $(dirname "$file")
        else
            echo -e "\n$file not exist\n"
        fi
    else
        echo -e '\ncd to dir of this file\n'
    fi
}

cf(){
  if [ -z "$1" ]; then
    echo "usage: cf <file>"
    exit 1
  fi
  builtin cd $(dirname $(which $1))
}


cd_book(){
    BOOK="/data/book"

    case ${1:-} in
        [tT]|[tT][rR][pP][mM])
            DIR="TRPM"                    ;;
        [aA]|[aA][yY][oO][uU][bB])
            DIR="ayoubelmhamdi.github.io" ;;
        [rR]|[rR][uU][sS][tT])
            DIR="rust-lang.org"           ;;
        [iI]|[iI][nN][fF][oO])
            DIR="info"                    ;;
        [pP]|[pP][rR][oO][jJ][eE][cC][tT][sS])
            DIR="projects"                ;;
        [lL]|[lL][iI][nn][uU][xX])
            DIR="linux"                   ;;
        [nN]|[nN][eE][wW])
            DIR="new"                     ;;
        *)  echo "no book at $BOOK";return;;
    esac

    builtin cd $BOOK/$DIR
    # nvim -c 'lua require("harpoon.ui").toggle_quick_menu()'
}


cg(){
    # cd_git_root: cd to the root of git repo:
    GITROOT="$(git rev-parse --show-toplevel)"
    if [ -d "$GITROOT" ];then
        builtin cd "$GITROOT"
    else
        echo "no git in this path"
    fi
}
