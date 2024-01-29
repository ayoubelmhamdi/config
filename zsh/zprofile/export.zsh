# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export DELTA_PAGER="less --mouse -nR"
# fix java on dwm
export AWT_TOOLKIT=MToolKit
export _JAVA_AWT_WM_NONREPARENTING=1 wmname LG3D


# API


# SETTING
# interdit to change default editor and pager
# with zprofile some zsh completion not work
### export EDITOR=nvim
### export PAGER=bat
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export HOWDOI_COLORIZE="1"
export XDEB_PK_ROOT="/tmp/xdeb"

export LANG="en_US.UTF-8"
export LANGUAGE="en_US-UTF-8"
export LC_ADDRESS="POSIX"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="POSIX"
export LC_CTYPE="POSIX"
export LC_IDENTIFICATION="POSIX"
export LC_MEASUREMENT="POSIX"
export LC_MESSAGES="POSIX"
export LC_MONETARY="POSIX"
export LC_NAME="POSIX"
export LC_NUMERIC="POSIX"
export LC_PAPER="POSIX"
export LC_TELEPHONE="POSIX"
export LC_TIME="POSIX"

# export TERM="st-256color"
export TIME="\n%E CPU=%P"


export app8="$HOME/projects/flutter/app8"
export app9="$HOME/projects/flutter/app9"
export by_linux="$HOME/mega/by_linux"
export by_phone="$HOME/mega/by_phone"
export c_project="$HOME/projects/c"
export download_simple="$HOME/mnt/simple/Download"
export js_project="$HOME/projects/js"
export p5_project="$HOME/projects/p5"
export rust_project="$HOME/projects/rust"
export md_project="$HOME/projects/md"
export py_project="$HOME/projects/py"
export libreoffice_project="$HOME/projects/libreoffice"
export flutter_project="$HOME/projects/flutter"
export js_project="$HOME/projects/javascript"
export javascipt_project="$HOME/projects/javascript"
export lua_project="$HOME/projects/lua"
export shell_project="$HOME/projects/shell"
export tex_project="$HOME/projects/tex"

export accadimeque="/mega/cloud/accadimique"
export alias_="$HOME/.config/zsh/my_alias"
export animation1="/projects/flutter/animation1"
export cloud="/mega/cloud"
export codes="/mega/repo/codes"
export function_="$HOME/.config/zsh/my_function"
export kitty="$HOME/.config/kitty/kitty.conf"
export path_="$HOME/.config/zsh/all_PATH"
export repo="/mega/repo"
export scripts="$HOME/scripts"
export sv="/var/service"
export template="/xbps-src/all-srcpkgs"
export tmux="$HOME/.tmux.conf"
export todo="/mega/repo/todo"
export whatsapp_doc="/mnt/simple/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Documents"
export wiki="/mega/repo/wiki"
export xbps_src="/xbps-src/void-packages"
export zshrc="$HOME/.zshrc"

export nvimdoc="/usr/share/nvim/runtime/doc"
export nvimdir="$HOME/.config/nvim"
export packerdir="$HOME/.local/share/nvim/site/pack/packer/opt"
export plugin="$HOME/.config/nvim/lua"

export opt="$HOME/opt"
export porject="$HOME/project"
export fork="$HOME/projects/git/fork"

# override starship global config
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export DIRENV_LOG_FORMAT=

# override ncrustify global config
export UNCRUSTIFY_CONFIG=$HOME/.config/uncrustify/uncrustify.cfg

# Tenserflow Deactive Logs
export TF_CPP_MIN_LOG_LEVEL=3
