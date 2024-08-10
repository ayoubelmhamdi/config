#!/usr/bin/zsh

# function vv(){
#     NVIM_APPNAME=nvim-ayoub nvim -c ":lua require('ayoub.stream_to_nvim').run(\"bash -c '${*}'   \")"
# }

generate-nasm(){
    file=$1
    file=${file%.*}
    gcc -fno-asynchronous-unwind-tables  -c -g -O3 -s "$file.c" -o "$file.o" && objconv -fnasm "$file.o" "$file.asm"

    rm "$file.o" -rf
    nasm -f elf64 -g "$file.asm"
    gcc -no-pie -m64 -o "$file" "$file.o"
}

ls(){
    if command -v exa >/dev/null; then
        command exa "$@"
    else
        command ls "$@"
    fi
}

la(){
    if command -v exa >/dev/null; then
        command exa -al "$@"
    else
        command ls -al "$@"
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

cd_git_root(){
    GITROOT="$(git rev-parse --show-toplevel)"
    if [ -d "$GITROOT" ];then
        builtin cd "$GITROOT"
    else
        echo "no git in this path"
    fi
}


xp(){
  xprop | awk '
    /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
    /^WM_NAME/{sub(/.* =/, "title:"); print}'
}

get_archive_root(){
  if [ $# -eq 1 ];then
    tar tvf "$1" | head -1 | sed -E 's#^.{31}##'
  elif [ $# -eq 0 ];then
    echo
    echo 'no args'
  elif [ $# -ge 2 ];then
    echo
    echo 'args > 1'
  fi
}

pwd() {
  if which xclip >/dev/null 2>&1; then
    command pwd
    command pwd | xclip -selection clipboard
  else
    command pwd
  fi
}

\=() {
  math-eval "$@"
}
