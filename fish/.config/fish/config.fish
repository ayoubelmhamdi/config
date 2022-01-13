source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish
source ~/.config/fish/functions.fish

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

#startx
if status --is-login
  if test -z "$DISPLAY"
     exec startx -- -keeptty
  end
end
