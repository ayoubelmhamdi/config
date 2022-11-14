
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
