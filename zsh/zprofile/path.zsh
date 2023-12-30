MY_PATH=

# USER c codes
export MY_PATH=/data/projects/c/ayoub/getbandwith/bin:$MY_PATH

# USER bash scripts
export MY_PATH=$HOME/scripts/bin:$MY_PATH

# User downloaded apps
export MY_PATH=$HOME/bin:$HOME/.local/bin:$MY_PATH

# go
export MY_PATH=$HOME/go/bin:$MY_PATH

# rust
export MY_PATH=$HOME/.cargo/bin:$MY_PATH

# flutter
export MY_PATH=/app/flutter/bin:$MY_PATH

# Android-Studio
export MY_PATH=/app/android-studio/bin:$MY_PATH

# cuda
export MY_PATH="/usr/local/cuda-10.1/bin:$MY_PATH"

# pylyzer
export MY_PATH="/home/mhamdi/.erg/bin:$MY_PATH"

#####  FINAL
export PATH=$PATH:$MY_PATH


# LIBRARY
export ERG_PATH=/home/mhamdi/.erg
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64
export PYTHONPATH=$PYTHONPATH:/data/github/lyrapdf
