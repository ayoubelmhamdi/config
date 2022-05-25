source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish
source ~/.config/fish/functions/linux.fish
source ~/.config/fish/functions/git.fish
source ~/.config/fish/functions/ovvride.fish
source ~/.config/fish/functions/fish_user_key_bindings.fish

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'

## #startx
## if status --is-login
##   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
##      exec startx -- -keeptty
##   end
## end

set -gx EDITOR nvim
#cd /projects/c/suckless/dwm

function addpaths
    contains -- $argv $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end

function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end
