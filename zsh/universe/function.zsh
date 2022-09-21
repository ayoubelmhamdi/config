
cd_book(){
    BOOK="$HOME/book"

    case ${1:-} in
        [tT]|[tT][rR][pP][mM])
            DIR="TRPM"                    ;;
        [aA]|[aA][yY][oO][uU][bB])
            DIR="ayoubelmhamdi.github.io" ;;
        [rR]|[rR][uU][sS][tT])
            DIR="rust-lang.org"           ;;
        [lL]|[lL][iI][nn][uU][xX])
            DIR="linux"                   ;;
        [nN]|[nN][eE][wW])
            DIR="new"                   ;;
        *)  echo "no book at $BOOK";return;;
    esac

    cd $BOOK/$DIR
    nvim -c 'lua require("harpoon.ui").toggle_quick_menu()'
}

cd_git_root(){
    GITROOT="$(git rev-parse --show-toplevel)"
    if [ -d "$GITROOT" ];then
        cd "$GITROOT"
    else
        echo "no git in this path"
    fi
}
