MY_PATH=

# USER c codes
export MY_PATH=/data/projects/c/ayoub/i3status/bin:$MY_PATH

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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64
# FINAL
export PATH=$PATH:$MY_PATH


# PYTHON
export PYTHONPATH=$PYTHONPATH:/data/book/pyTorch/v01/scripts
