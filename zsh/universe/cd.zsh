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
