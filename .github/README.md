# PRERQUIRE

# Arch
```
sudo pacman -Sy nodejs npm python2 python  python-pip python2-pip
```
## Termux
```
apt install neovim nodejs python python2
```
## Ubuntu  
PPA GROUVY
```
sudo apt install nodejs npm python2 python 
```
## Debian
```
PPA GROUVY
sudo apt install nodejs python2 python3 npm
```
# Void
```
sudo xbps-install -Sy nodejs python2 python3 npm
```
# PROVIDER
```
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
npm install -g neovim
```

```
mkdir -p $HOME/.local/tmp/
mkdir -p $HOME/.config/nvim/
```
## PLUG MANAGER
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```
### SSH
```
git clone                                      \
    git@github.com:ayoubelmhamdi/nvim.git      \
    $HOME/.config/nvim/
```
### HTTPS
```
git clone                                      \
    https://github.com/ayoubelmhamdi/nvim.git  \
    $HOME/.config/nvim/
```
