# function zt(){
#   zathura $@ &!
# }

# Create a directory and cd into it
function mk (){ 
    if [[ ! -d "$1" ]];then
      command mkdir -p "$1"
    fi
    cd "$1"
}
