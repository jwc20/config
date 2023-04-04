# .config

## Copy all hidden dotfiles to fresh Ubuntu virtual machine.

Update virtual machine:

```
sudo apt update
```

Clone this repo:

```
git clone https://github.com/jwc20/config.git
```

Using scp, copy all files to current directory (must be in root directory):

```
scp -rp config/. .
```

Install brew:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install starship

```
sudo snap install --edge starship
```

Install fish:

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

Use fish:

```
fish
```

Install fisher:

```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Install fzf.fish:

```
fisher install PatrickF1/fzf.fish
```

Install fzf:

```
sudo apt install fzf
```

install neovim

```
sudo snap install --beta nvim --classic
```

Install nodejs and npm (Need this for snippets):

```
sudo apt install nodejs npm
```

Upgrade node and npm:

```
sudo apt upgrade nodejs
npm install n -g
n stable
```

install vim-plug

```
curl -flo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install unzip:

```
sudo apt-get install unzip
```

Install pip:

```
sudo apt-get -y install python3-pip
```

Install Python client for neovim (pynvim):

```
pip3 install pynvim
```

Open neovim init.vim file:

```
vi ~/.config/nvim/init.vim
```

Change python host:

```
# Remove this line: let g:python3_host_prog = '/opt/homebrew/bin/python3'
# add the line:
let g:python3_host_prog = '/usr/bin/python3'
```

Install all the plugins inside neovim:

```
:PlugInstall
:UpdateRemotePlugin
```

Note: Some tools don't work with Ubuntu inside macOS ARM like brew, telescope.nvim, and lazygit.
