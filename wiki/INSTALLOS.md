Install Software in Debian|[L|X]Ubuntu OS
___

[Comparation SO](https://wiki.archlinux.org/title/Arch_compared_to_other_distributions)

# User

```bash
cut -d: -f1 /etc/passwd
sudo deluser --remove-home user

---------------

useradd -D
sudo useradd --create-ho[m]e --[u]id 1000 --[s]hell /bin/bash --[c]omment Freddie freddie
sudo usermod -aG sudo freddie
sudo passwd freddie
# Reload profile
su - freddie
```

# Swap unlock

[See](https://www.youtube.com/watch?v=mp7xNTLFE38)

```bash
free -h
sudo swapoff -a
cat /etc/fstab | grep swap
sudo fallocate -l 8G /swap.img
sudo mkswap /swap.img
sudo chown 0600 /swap.img
sudo swapon -a
```

# Better SSD I/O

```bash
sudo cp /etc/fstab /etc/fstab.bak
sudo vi /etc/fstab
# Adding: discard,noatime,nodiratime
# / ext4 defaults,commit=60 0 1
# / ext4 defaults,discard,noatime,nodiratime,commit=60 0 1
reboot
```

# English Language for All

```bash
cat /etc/default/locale
echo "\n" | sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en
# On error, generate locale, uncomment in this file en_US.UTF-8 (and comment current)
# sudo vi /etc/locale.gen
# Regenerate options
# sudo locale-gen

grep -F "Acquire::Languages" /etc/apt/apt.conf.d/00aptitude

echo 'Acquire::Languages "none";' | sudo tee -a /etc/apt/apt.conf.d/00aptitude
```

# Utils

```bash
sudo apt-get install -y software-properties-common git-core curl
## sudo apt-get remove software-properties-common git-core curl && sudo apt-get autoremove
```
> By example: add-apt-repository

## GIT Configuration

[See](http://git-scm.com/docs/git-mergetool)

```bash
# Hack: .w !bash
ln -s `pwd`/git/.gitconfig ~/.gitconfig
ln -s `pwd`/git/.gitignore ~/.gitignore
```

## Sync config files using git

```bash
sudo mkdir -p /var/www/html/freddiegar
sudo chown freddie:freddie /var/www -R
git clone https://github.com/freddiegar/services.git /var/www/html/freddiegar/services
```
> Sync .ssh (and .gnupg) keys (if there any)

> tar -czvf ssh.tar.gz .ssh     -> tar -xzvf ssh.tar.gz --overwrite .ssh

> tar -czvf gnupg.tar.gz .gnupg -> tar -xzvf gnupg.tar.gz --overwrite .gnupg

Now, we can to use SSH

```bash
git remote set-url origin git@github.com:freddiegar/services.git
```

# PWD

```bash
cd /var/www/html/freddiegar/services
```

## Vim Latest :D, of course! (Non necessary in current LTS)

```bash
# echo "\n" | sudo add-apt-repository ppa:jonathonf/vim
## echo "\n" | sudo add-apt-repository --remove ppa:jonathonf/vim
```

# Updated repositories

```bash
sudo apt-get update
sudo apt-get -y upgrade
```

# Performance, not use swap while RAM < 95% used

[Tips 1](https://www.linuxbabe.com/ubuntu/4-tips-speed-up-ubuntu-16-04)

[Tips 2](https://github.com/akalongman/ubuntu-configuration)

```bash
grep -F "vm.swappiness=" /etc/sysctl.d/99-sysctl.conf

echo '# Overwrite default: 60
vm.swappiness=5' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

grep -F "vm.swappiness=" /etc/sysctl.d/99-sysctl.conf

# @see https://www.kernel.org/doc/html/latest/networking/ip-sysctl.html

# 0 - disable
# 1 - global enable
# 2 - enable for loopback traffic only (default)
sysctl -a | grep 'net.ipv4.tcp_tw_reuse'
echo '# Better Network
net.ipv4.tcp_tw_reuse=1' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Default: 60 (in seconds)

sysctl -a | grep 'net.ipv4.tcp_fin_timeout'
echo 'net.ipv4.tcp_fin_timeout=15' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# @see https://www.golinuxcloud.com/how-to-improve-disk-io-performance-in-linux/
# @see https://www.kernel.org/doc/html/latest/admin-guide/sysctl/vm.html
# @see https://lonesysadmin.net/2013/12/22/better-linux-disk-caching-performance-vm-dirty_ratio/

# Default: 20 (percentage)
sysctl -a | grep 'vm.dirty_ratio'

echo '# Better I/O
vm.dirty_ratio=60' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Default: 10 (percentage)
sysctl -a | grep 'vm.dirty_background_ratio'

echo 'vm.dirty_background_ratio=20' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

sudo sysctl --system
```

# Change default User Max Watches

```bash
grep -F "fs.inotify.max_user_watches=" /etc/sysctl.d/99-sysctl.conf

echo '# Overwrite default: 8192 ~8M to ~540M
fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

grep -F "fs.inotify.max_user_watches=" /etc/sysctl.d/99-sysctl.conf

sudo sysctl --system
```

# Change default time GRUB to 2

```bash
sudo cp -p /etc/default/grub /etc/default/grub.backup
```

```bash
grep -F "GRUB_TIMEOUT=" /etc/default/grub

sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/g' /etc/default/grub

grep -F "GRUB_TIMEOUT=" /etc/default/grub

sudo update-grub
```

# Change graphical to text GRUB

```bash
grep "GRUB_CMDLINE_LINUX_DEFAULT=\|GRUB_CMDLINE_LINUX=\|GRUB_TERMINAL=" /etc/default/grub

sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT/#GRUB_CMDLINE_LINUX_DEFAULT/g' /etc/default/grub

# @see https://www.baeldung.com/linux/solid-state-drive-optimization#optimize-io-scheduler (slower: 3.15 vs 2.45m)
# @see https://yarondar.wordpress.com/2018/07/29/have-you-tried-blk-mq/
# cat /sys/block/loop*/queue/scheduler
# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
# echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sudo sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_LINUX="text scsi_mod.use_blk_mq=1 dm_mod.use_blk_mq=y"/g' /etc/default/grub
# sudo sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_LINUX="text"/g' /etc/default/grub

sudo sed -i 's/#GRUB_TERMINAL=console/GRUB_TERMINAL=console/g' /etc/default/grub

grep "GRUB_CMDLINE_LINUX_DEFAULT=\|GRUB_CMDLINE_LINUX=\|GRUB_TERMINAL=" /etc/default/grub

sudo update-grub

sudo systemctl set-default multi-user.target
```

# Turn-off hibernation

```bash
grep 'HandleLidSwitch=\|LidSwitchIgnoreInhibited=' /etc/systemd/logind.conf

sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sudo sed -i 's/#LidSwitchIgnoreInhibited=yes/LidSwitchIgnoreInhibited=no/g' /etc/systemd/logind.conf

grep 'HandleLidSwitch=\|LidSwitchIgnoreInhibited=' /etc/systemd/logind.conf

sudo systemctl restart systemd-logind
```

# Auto-update (ONLY on servers!)

```bash
sudo apt-get install -y unattended-upgrades update-notifier-common

grep 'Remove-Unused-Kernel-Packages\|Remove-Unused-Dependencies\|Automatic-Reboot-Time' /etc/apt/apt.conf.d/50unattended-upgrades

sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages "[true|false]*";/Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Dependencies "[true|false]*";/Unattended-Upgrade::Remove-Unused-Dependencies "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/g' /etc/apt/apt.conf.d/50unattended-upgrades

grep 'Remove-Unused-Kernel-Packages\|Remove-Unused-Dependencies\|Automatic-Reboot-Time' /etc/apt/apt.conf.d/50unattended-upgrades
```

# Disabled IPP Service: 631 (Internet Printer Protocol)

```bash
# Hack: .w !bash
sudo service cups stop && sudo systemctl disable cups
sudo apt-get remove -y --purge cups\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# Disabled Plymouth Service

```bash
sudo service plymouth stop && sudo systemctl disable plymouth
sudo service plymouth-log stop && sudo systemctl disable plymouth-log
sudo apt-get remove -y --purge plymouth-* plymouth && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# ZSH

[See](https://towardsdatascience.com/comparing-sh-bash-ksh-and-zsh-speed-82a72bbc20ed)
[See 2](https://google.github.io/styleguide/shellguide.html)

```bash
sudo apt-get install -y zsh
# As User NOT root
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo $SHELL
# Change shell if not is zsh
chsh -s `which zsh`

grep "CASE_SENSITIVE=\|HIST_STAMPS=\|^plugins=" ~/.zshrc

cp -p ~/.zshrc ~/.zshrc.original
sed -i 's/# CASE_SENSITIVE="true"/CASE_SENSITIVE="true"/g' ~/.zshrc
sed -i 's/# HIST_STAMPS="mm\/dd\/yyyy"/HIST_STAMPS="yyyy-mm-dd"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=()/g' ~/.zshrc

grep "CASE_SENSITIVE=\|HIST_STAMPS=\|DISABLE_AUTO_TITLE=\|^plugins=" ~/.zshrc

# In i3
i3-msg exit
# In Ubuntu
gnome-session-quit
# In Lubuntu
lxqt-leave
## sudo apt-get remove zsh && sudo apt-get autoremove
```

# Font Fira Code

[See](https://dev.to/josuerodriguez98/installing-firacode-on-windows-and-ubuntu-1fn1)

```bash
# [L|X]Ubuntu
sudo apt-get install -y fonts-firacode
## sudo apt-get remove fonts-firacode && sudo apt-get autoremove
```

## Profile Environment

```bash
grep "EDITOR=\|VISUAL=\|BROWSER=\|WWW_HOME=" ~/.profile

echo '
export EDITOR=vim
export VISUAL=vim
export BROWSER=/usr/bin/firefox
export WWW_HOME="https://www.duckduckgo.com"' >> ~/.profile
```
> export BROWSER=/usr/lib/x86_64-linux-gnu/opera/opera
> export BROWSER=/opt/brave.com/brave/brave-browser
> export BROWSER=/opt/google/chrome/google-chrome
> export BROWSER=/opt/microsoft/msedge/microsoft-edge

## Setup in Zsh

```bash
grep -F "Load special vars" ~/.zshrc

echo '
# Load special vars
[ -f ~/.profile ] && \. ~/.profile' >> ~/.zshrc
```

## Enable Vi Mode in Zsh

[See](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh)
[See 2](https://github.com/tpope/tpope/blob/master/.zshrc)
[See 3](https://zsh.sourceforge.io/Guide/zshguide04.html)
[See 4](https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#Menu-selection)
[See 5](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins)

```bash
echo "
# Vi mode
bindkey -v

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Normal mode
bindkey '^A' beginning-of-line
bindkey '^B' backward-word
bindkey '^E' end-of-line
bindkey '^F' forward-word
bindkey '^J' down-line-or-history
bindkey '^K' up-line-or-history
bindkey '^N' history-beginning-search-forward-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^T' transpose-chars

# Command mode
bindkey -M vicmd 'vv' edit-command-line

# Menuselect mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history" >> ~/.zshrc
```
> @see ~/.oh-my-zsh/plugins/
> man zshzle

# Ignore aliasses

echo "
# Ignores in History
# @see https://unix.stackexchange.com/a/6104
# @thanks https://github.com/ohmyzsh/ohmyzsh/blob/6a65ac90259d87f7549c581372403405ef01b7d2/lib/history.zsh#L35
setopt HIST_REDUCE_BLANKS
HISTORY_IGNORE='..|__|___|a|a *|alias|alias *|v|v[vlnd]|x|reset|htop|[rv][azh3]|f|f[adfjmnotug|ls|ls *|cd ..|cd *|cd[eatx]|g[sfvVMN]|gst|ga .|gd|gdc|glo[gpf]|rm *|cd[etxf]|vd[etxf]|k[dl]|pkill *|startx|reboot|sa[irsy]|s[uc] *|h[ht]|fo *'" >> ~/.zshrc

# Aliases

```bash
ln -s `pwd`/shell/bash/bash_aliases ~/.bash_aliases

## Enable alias in Zsh
echo '
[ -f ~/.bash_aliases ] && \. ~/.bash_aliases' >> ~/.zshrc
```

## Enable alias in Vim

```bash
echo '
[ -f ~/.bash_aliases ] && \. ~/.bash_aliases' >> ~/.zshenv
```

# Main and extra utils

```bash
sudo apt-get install -y unzip curl tree nmap htop i3 xsel xcompmgr feh pavucontrol pulseaudio-utils maim xclip ncal make build-essential
## sudo apt-get remove unzip curl tree nmap htop i3 xsel xcompmgr feh pavucontrol pulseaudio-utils maim xclip ncal make build-essential && sudo apt-get autoremove
```

## i3

```bash
mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3/config
ln -s `pwd`/i3/status.conf ~/.config/i3/status.conf
ln -s `pwd`/i3/battery ~/.config/i3/battery-popup
ln -s `pwd`/i3/workspace ~/.config/i3/workspace
```
> On VM:
> cp -p /var/www/html/freddiegar/services/i3/config ~/.config/i3/config
> Change $mod Mod4 -> Mod1
> sed -i 's/$mod Mod4/$mod Mod1/g' ~/.config/i3/config
> Change $meta Mod1 -> Mod4
> sed -i 's/$meta Mod1/$meta Mod4/g' ~/.config/i3/config

### Set i3 as WM

```bash
sudo update-alternatives --config x-session-manager
# if not is available i3:
# sudo update-alternatives --install /usr/bin/x-session-manager x-session-manager /usr/bin/i3 60
```

### Start i3 after StartX

[See](https://www.reddit.com/r/i3wm/comments/72oiwl/how_do_i_set_environment_variables_so_that_they/)

```bash
cat ~/.xinitrc
# Hack: '<,'>w !bash
echo 'dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
xrdb -I$HOME ~/.Xresources
exec i3' >> ~/.xinitrc
```

## Terminal Emulator

```bash
sudo apt-get install -y rxvt-unicode

sudo ln -s `pwd`/emulator/urxvt/resize-font /usr/lib/x86_64-linux-gnu/urxvt/perl/resize-font
sudo ln -s `pwd`/emulator/urxvt/config-reload /usr/lib/x86_64-linux-gnu/urxvt/perl/config-reload

ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xdefaults
ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xresources

xrdb ~/.Xresources
```

## Vim Configuration

```bash
sudo apt-get install -y vim
## sudo apt-get remove vim && sudo apt-get autoremove

# Set as default editor
sudo update-alternatives --config editor

rm -f ~/.viminfo
ln -s `pwd`/editor/vim/.vimrc ~/.vimrc

## CoC Settings
mkdir ~/.vim
ln -s `pwd`/editor/vim/coc-settings.json ~/.vim/coc-settings.json

## PHPActor Settings
mkdir -p ~/.config/phpactor
ln -s `pwd`/editor/vim/phpactor.json ~/.config/phpactor/phpactor.json
sudo ln -s ~/.vim/plugged/phpactor/bin/phpactor /usr/local/bin/phpactor
```

## Vim Copy/Paste (Share SO)

```bash
# Check: +xterm_clipboard
vim --version | grep xterm_clipboard
# if -xterm_clipboard then
sudo apt-get install -y vim-gtk3
## In olders versions use: vim-gnome
# Check again ;)
```

## Vim JSON Development (and Git Hooks)

[See](https://jqlang.github.io/jq/)

```bash
sudo apt-get install -y jq
# sudo apt remove jq && sudo apt-get autoremove
```

## Vim SQL Development

```bash
sudo apt-get install -y sqlformat
# sudo apt remove sqlformat && sudo apt-get autoremove
```

## Vim XML Development

```bash
sudo apt-get install -y libxml2-utils
# sudo apt remove libxml2-utils && sudo apt-get autoremove
```

## Vim CSV to JSON

```bash
sudo apt-get install -y miller
```

### LSP

#### C

[See](https://llvm.org/docs/GettingStarted.html#overview)
[See 2](https://www.jianshu.com/p/3c7eae5c0c68)
[See 3](https://github.com/llvm/llvm-project/releases)
[See 4](https://apt.llvm.org/)

```bash
cd ~
# sudo apt-get install libncurses5
sudo apt-get install -y clang-19 clangd-19 lldb-19 lld-19
sudo ln -s /usr/bin/clang-19 /usr/bin/clang
sudo ln -s /usr/bin/clang++-19 /usr/bin/clang++
sudo ln -s /usr/bin/clang-cpp-19 /usr/bin/clang-cpp
sudo ln -s /usr/bin/clangd-19 /usr/bin/clangd
clangd --version
```

#### Node (require in Vim LSP)

```bash
cd ~
# Slower!
# @see https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
# sudo apt-get install -y build-essential libssl-dev # Only oldest Ubuntu
# # @see https://github.com/nvm-sh/nvm/releases
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

#
# # Only oldest Ubuntu
# echo '
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | sudo tee -a ~/.zshrc
#
# # Close Terminal to load changes
# # Show version available
nvm ls-remote

# # Ubuntu 18
# # @requirements https://github.com/nodesource/distributions#debian-and-ubuntu-based-distributions
# # ldd --version
nvm install v21.7.3

# nvm alias default v21.7.3
# nvm current
# ## Enabled to all users in [L|X]Ubuntu
# # n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
#
# ## Install package: npm install express
# ## nvm deactivate && nvm uninstall v18.16.0

echo '
# Enable node|npm
[ -d "$HOME/.nvm/versions/node/`command cat $HOME/.nvm/alias/default`/bin/" ] && export PATH=$PATH:$HOME/.nvm/versions/node/`command cat $HOME/.nvm/alias/default | tr -d "\\n"`/bin' >> ~/.profile

## Install npm
npm install -g npm@latest
npm install -g npm@10.9.2
## npm --version
## npm uninstall -g npm@latest
```


#### Vim

[See](https://github.com/iamcco/vim-language-server)

```bash
npm install -g vim-language-server
```

#### Sh

[See](https://github.com/iamcco/vim-language-server)

```bash
npm install -g bash-language-server
```

#### Javascript|Typescript (js, jsx, ts)

[See](https://github.com/typescript-language-server/typescript-language-server)

```bash
npm install -g typescript-language-server typescript
```

#### Tailwindcss

[See](https://github.com/tailwindlabs/tailwindcss-intellisense)

```bash
npm install -g @tailwindcss/language-server
```

#### JSON

[See](https://github.com/hrsh7th/vscode-langservers-extracted)

```bash
npm install -g vscode-langservers-extracted
```

#### YAML

[See](https://github.com/redhat-developer/yaml-language-server)

```bash
npm install -g yaml-language-server
```

#### SQL

[See](https://github.com/joe-re/sql-language-server)

```bash
# npm install -g sql-language-server
#
# mkdir -p ~/.config/sql-language-server/
#
# echo '{
#     "name": "db80",
#     "adapter": "mysql",
#     "host": "db80",
#     "port": 3306,
#     "user": "root",
#     "password": "N3uroSiS",
#     "database": "microsites"
# }' > /var/www/html/path/project/.sqllsrc.json
#
# echo '{
#     "connections": [
#         {
#             "name": "db80",
#             "adapter": "mysql",
#             "host": "db80",
#             "port": 3306,
#             "user": "root",
#             "password": "N3uroSiS",
#             "projectPaths": [
#                 "/var/www/html/freddiegar/working/path/CODE/microsites"
#             ]
#         }
#     ]
# }' > ~/.config/sql-language-server/.sqllsrc.json
```

#### Lua

[See](https://luals.github.io/wiki/build/)

```bash
sudo apt-get install -y ninja-build
mkdir /var/www/html/LuaLS
cd /var/www/html/LuaLS
git clone --depth=1 https://github.com/LuaLS/lua-language-server
cd lua-language-server
git pull origin master
./make.sh

# Update
cd /var/www/html/LuaLS/lua-language-server && git pull origin master && ./make.sh

# Enable globally
sudo ln -s /var/www/html/LuaLS/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
```

#### Rust

```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup component add rust-analyzer
```
> rustup update
> rustup self uninstall

```bash
grep -F "Enable rust" ~/.profile

echo '
# Enable rust
[ -d ~/.cargo/bin ] && \. "$HOME/.cargo/env"' >> ~/.profile

grep -F "Enable rust" ~/.profile
```

#### Go

[See](https://go.dev/doc/install)
[See 2](https://go.dev/doc/install/source)
[See 3](https://github.com/golang/wiki/blob/master/Ubuntu.md#using-ppa)
[See 4](https://thenewstack.io/golang-how-to-use-the-go-install-command/)

```bash
curl -L https://go.dev/dl/go1.24.2.linux-amd64.tar.gz -o go-linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go-linux-amd64.tar.gz && rm go-linux-amd64.tar.gz

grep -F "Enable go" ~/.profile

echo '
# Enable go
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

grep -F "Enable go" ~/.profile

go version

sudo apt-get install -y gopls
```
> sudo apt-get remove gopls

##### Vim Slides (require go)

[See](https://github.com/maaslalani/slides)
[Manual](http://bloodgate.com/perl/graph/manual/syntax.html)
[Demo](https://youtu.be/wIyz7UQPL70)
[AscciArt](https://www.asciiart.eu/text-to-ascii-art)

```go
sudo apt-get install -y make
go install github.com/maaslalani/slides@latest
sudo ln -s /home/$USER/go/bin/slides /usr/bin/slides

# Dependency for graphs
# @see https://metacpan.org/pod/Graph::Easy
# After installation open shell
perl -MCPAN -e shell
install Graph::Easy
# Check graph-easy path, check in PATH
ls -la $HOME/perl5/bin
```

#### Ruby

[See](https://solargraph.org/guides/getting-started)

```bash
sudo apt-get install -y make build-essential ruby-dev
sudo gem install solargraph
```

### C Tags

[See](https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions)

```bash
# After Ubuntu 23.04+
sudo apt-get -y install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

mkdir /var/www/html/universal-ctags
cd /var/www/html/universal-ctags
git clone --depth=1 https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install

## sudo rm /usr/local/bin/ctags
```
> /usr/local/bin/ctags
> man ctags
> ctags --list-languages
> ctags --list-kinds

```bash
# Need: Plug 'vim-scripts/autotags'
```

### PHP Tags

```bash
cd ~
sudo curl -L https://github.com/vim-php/phpctags/raw/gh-pages/install/phpctags.phar -o /usr/local/bin/phpctags
sudo chmod +x /usr/local/bin/phpctags
## Command:
## phpctags
## sudo rm /usr/local/bin/phpctags
```

## Vim Snippets

```bash
ln -s `pwd`/editor/vim/UltiSnips ~/.vim/
```

## Vim in PHPStorm

```bash
ln -s `pwd`/editor/phpstorm/.ideavimrc ~/.ideavimrc
```

# GIT

```bash
sudo apt-get install -y git-lfs
## sudo apt-get remove git-lfs && sudo apt-get autoremove
```
> https://www.howtogeek.com/devops/how-to-completely-reset-a-git-repository-including-untracked-files/

### GIT Flow

```bash
sudo apt-get install git-flow
## sudo apt-get remove git-flow && sudo apt-get autoremove
```

### GIT Summary

[See](https://github.com/albenik/git-summary)

```bash
cd ~
sudo apt-get install -y gawk
sudo curl -L https://raw.githubusercontent.com/albenik/git-summary/master/git-summary -o /usr/local/bin/git-summary
sudo chmod +x /usr/local/bin/git-summary
## sudo apt-get remove gawk && sudo rm /usr/local/bin/git-summary && sudo apt-get autoremove
```

## GIT Stats

[See](https://github.com/arzzen/git-quick-stats)

```bash
sudo apt-get install -y git-quick-stats
```

## GIT CLI

[See](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```bash
# Install
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh

# Auth (need token from: https://github.com/settings/tokens)
gh config set -h github.com git_protocol ssh
## or Interactive
gh auth login
```

## Wallpapers in i3

```bash
cd /var/www/html/freddiegar
git clone --depth=1 git@github.com:freddiegar/wallpapers.git

ln -s /var/www/html/freddiegar/wallpapers ~/BG
```

# PHP

```bash
# Only oldest Ubuntu or with oldest/newest version's PHP (Tune ubuntu version is required :|)
echo "\n" | sudo add-apt-repository ppa:ondrej/php
# @see https://devtutorial.io/how-to-install-php-8-3-on-ubuntu-23-10-p3206.html
# @see https://ppa.launchpadcontent.net/ondrej/php/ubuntu/dists/
# @see /etc/apt/sources.list.d/ondrej-ubuntu-php-oracular.sources :: oracular -> noble
sudo sed -i 's/^Suites: oracular/Suites: noble/g' /etc/apt/sources.list.d/ondrej*.sources

sudo apt-get install -y php8.4-cli
sudo apt-get install -y php8.4-dev
sudo apt-get install -y php8.4-mbstring
sudo apt-get install -y php8.4-mysql
sudo apt-get install -y php8.4-curl
sudo apt-get install -y php8.4-zip
sudo apt-get install -y php8.4-soap
sudo apt-get install -y php8.4-gd
sudo apt-get install -y php8.4-sqlite3
sudo apt-get install -y php8.4-intl
sudo apt-get install -y php8.4-memcached
sudo apt-get install -y php8.4-redis
sudo apt-get install -y php8.4-bcmath
sudo apt-get install -y php8.4-gmp
sudo apt-get install -y php8.4-xml
sudo apt-get install -y php8.4-zip

## sudo apt-get remove php8.4\* && sudo apt-get autoremove
## echo "\n" | sudo add-apt-repository --remove ppa:ondrej/php
```
> Disable to use saU alias
> sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/ondrej*.sources

## PHP Xdebug (I'm not god)

```bash
sudo apt-get install -y php7.4-xdebug
sudo apt-get install -y php8.1-xdebug
sudo apt-get install -y php8.2-xdebug
sudo apt-get install -y php8.3-xdebug
sudo apt-get install -y php8.4-xdebug
```

## Composer for PHP

```bash
cd ~
curl -L https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -Rf composer-setup.php
## Update
## sudo composer self-update
## rm -Rf /usr/local/bin/composer
```

### Old projects require old composer

```bash
wget https://getcomposer.org/composer-1.phar
chmod a+x composer-1.phar
sudo mv composer-1.phar /usr/local/bin/composer_v1
## rm -Rf /usr/local/bin/composer_v1
```

### Dependencies Checker

[See](https://github.com/shipmonk-rnd/composer-dependency-analyser)

```bash
composer global require --dev shipmonk/composer-dependency-analyser
sudo ln -s `pwd`/.config/composer/vendor/bin/composer-dependency-analyser /usr/local/bin/dependency
## dependency
## dependency --composer-json /path/to/composer.json
## rm -Rf /usr/local/bin/dependency
```

## Code Sniffer Fixer for PHP (and Vim)

```bash
cd ~
sudo curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o /usr/local/bin/php-cs-fixer
sudo chmod +x /usr/local/bin/php-cs-fixer
## Command:
## php-cs-fixer
## sudo rm /usr/local/bin/php-cs-fixer
```

## Mess Detector for PHP (and Vim)

[See](https://github.com/phpmd/phpmd/releases)

```bash
cd ~
sudo curl -L https://github.com/phpmd/phpmd/releases/download/2.15.0/phpmd.phar -o /usr/local/bin/phpmd
sudo chmod +x /usr/local/bin/phpmd
## Command:
## phpmd source/code format ruleset
## phpmd src ansi cleancode,design,naming,unusedcode
## phpmd src ansi cleancode,codesize,controversial,design,naming,unusedcode
## sudo rm /usr/local/bin/phpmd
```

## Dynamic Grep (used in phpx)

```bash
sudo ln -s `pwd`/shell/bash/grepx /usr/local/bin/grepx
```

## Change date

```bash
sudo ln -s `pwd`/shell/bash/datex /usr/local/bin/datex
```

## Dynamic PHP Version (based in current composer.json)

```bash
sudo ln -s `pwd`/php/phpx /usr/local/bin/phpx
```

## PHPLint recursive

```bash
sudo ln -s `pwd`/php/phplint /usr/local/bin/phplint
```

# Docker (Container)

[See 1](https://docs.docker.com/install/linux/docker-ce/ubuntu)

[See 2](https://docs.docker.com/install/linux/linux-postinstall/)

## [L|X]Ubuntu 18.*, 19.*, 20.* Debian 10

```bash
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg software-properties-common
curl -L https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/docker.gpg > /dev/null
echo "\n" | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/`lsb_release -is | awk '{print tolower($0)}'` `lsb_release -cs` stable"

sudo apt-get install -y docker-ce
sudo usermod -aG docker $(whoami)

# In i3
i3-msg exit
# In Ubuntu
gnome-session-quit
# In Lubuntu
lxqt-leave
## sudo apt-get remove docker-ce && sudo apt-get autoremove
```
> Disable to use saU alias
> sudo sed -i 's/^deb /###Disable deb /g' /etc/apt/sources.list.d/*docker*.list

## Docker Compose

[See](https://github.com/docker/compose/releases)

```bash
cd ~
sudo curl -L https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## sudo rm /usr/local/bin/docker-compose
```

## Docker Network

```bash
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
```

## Docker Logs

[See](https://linuxiac.com/reducing-docker-logs-file-size/)

```bash
grep "log-driver\|log-opts" /etc/docker/daemon.json

echo '{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "5m",
    "max-file": "3"
  }
}' | sudo tee /etc/docker/daemon.json

grep "log-driver\|log-opts" /etc/docker/daemon.json

sudo systemctl restart docker
```

# MySQL Client (Server is using Docker)

```bash
# [L|X]Ubuntu
sudo apt-get install -y mysql-client
## sudo apt-get remove mysql-client && sudo apt-get autoremove

# Debian
sudo apt-get install -y mariadb-client
## sudo apt-get remove mariadb-client && sudo apt-get autoremove
```
> Auth Secure: mysql_config_editor set --login-path=development --host=db --user=root --password

# SSH Keys

Clone SSH keys from Secrets or

```bash
ssh-keygen                 # Insert passphrase (Algo ...)
ls ~/.ssh
cat ~/.ssh/id_rsa.pub      # Setup SSH Keys in Apps or VPS
```
## Enable SSH Agent

[See](https://yashagarwal.in/posts/2017/12/setting-up-ssh-agent-in-i3/)

```bash
grep -F "~/.ssh/agent.env" ~/.zshrc

echo '
if [ -f ~/.ssh/agent.env ]; then
    . ~/.ssh/agent.env > /dev/null

    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        eval `ssh-agent -s | tee ~/.ssh/agent.env`
    fi
else
    eval `ssh-agent -s | tee ~/.ssh/agent.env`
fi' >> ~/.zshrc

```
> Don't use: ssh-agent zsh

# GPG Keys

Clone GPG keys from Secrets or

[See](https://docs.github.com/en/enterprise-server@2.22/github/authenticating-to-github/generating-a-new-gpg-key)
[Errors](https://gist.github.com/paolocarrasco/18ca8fe6e63490ae1be23e84a7039374)

```bash
# Create key
gpg --full-generate-key
> Kind:     RSA and RSA
> Long:     4096
> Time:     1y
> Name:     Freddie Gar
> Mail:     freddie.gar@outlook.com
> Comment:  Personal GPG Key

# List key
gpg --list-secret-keys --keyid-format LONG
> sec   rsa4096/C292DDB5 2021-03-30 [SC] [expires: 2022-03-30]
>       93AA89FC183E5D2A83114F49C6F296FCC292DDB5
> uid         [ultimate] Freddie Gar (Personal GPG Key) <freddie.gar@outlook.com>
> ssb   rsa4096/9567702A 2021-03-30 [E] [expires: 2022-03-30]
```
> GPG Keys are save in: /home/$USER/.gnupg

## Enable

```bash
git config --global commit.gpgsign true
git config --global user.signingkey [ID]

# Use ssh short id: 9567702A, in this example
git config --global user.signingkey 9567702A

# Override by repository
cd git/repository
git config user.signingkey [ID]
```

## Export Public GPG Key (for GitHub or BitBucket)

[See](https://github.com/settings/keys)

```bash
gpg --armor --export [ID]

# Use sec short id: C292DDB5, in this example
gpg --armor --export C292DDB5 | xclip -selection clipboard
```

## GPG in Terminal (Use between shells instances)

```bash
grep -F "GPG_TTY" ~/.zshrc

echo '
export GPG_TTY=$(tty)' >> ~/.zshrc
```

## GPG TTL (in seconds)

```bash
grep "default-cache-ttl\|max-cache-ttl\|default-cache-ttl-ssh\|max-cache-ttl-ssh" ~/.gnupg/gpg-agent.conf

echo 'default-cache-ttl 86400
max-cache-ttl 864000
default-cache-ttl-ssh 86400
max-cache-ttl-ssh 864000' > ~/.gnupg/gpg-agent.conf
```

# Postman

```bash
cd ~
curl -L "https://dl.pstmn.io/download/latest/linux_64" -o postman.tar.gz
sudo tar -xvf postman.tar.gz -C /opt && rm -Rf postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
## rm -Rf /usr/bin/postman
```

# Opera

```bash
sudo apt-get install opera-stable

## sudo apt-get remove opera && sudo apt-get autoremove
```

# Zen (Firefox for this days 2025-01-28 is slower and CPU eater)

```bash
curl -L "https://github.com/zen-browser/desktop/releases/download/twilight/zen.linux-x86_64.tar.xz" -o zen.tar.xz
sudo tar xvf zen.tar.xz -C /opt && rm -Rf zen.tar.xz
sudo ln -s /opt/zen/zen /usr/bin/zen
## sudo rm -Rf /usr/bin/zen && sudo rm -Rf /opt/zen
```

# Firefox (Dont use snap for this, security risk)

```bash
sudo apt-get remove firefox && sudo apt-get autoremove
curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" -o firefox.tar.xz
sudo tar xvf firefox.tar.xz -C /opt && rm -Rf firefox.tar.xz
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
## sudo rm -Rf /usr/bin/firefox && sudo rm -Rf /opt/firefox
```

## Firefox Developer Edition Shortcut

```bash
echo '[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Firefox Web Browser Developer Edition
NoDisplay=true
Type=Application
Comment=Browse the WWW
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web
Exec=/usr/bin/firefox %u
Terminal=false
X-MultipleArgs=false
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
StartupNotify=true
Actions=new-window;new-private-window;
StartupWMClass=Firefox Developer Edition
MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;

[Desktop Action new-window]
Name=Open a New Window
Exec=/usr/bin/firefox -new-window
MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/usr/bin/firefox -private-window
MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;' > ~/.local/share/applications/firefox.desktop
```

## Enable in i3 as default browser

[See](https://forum.endeavouros.com/t/i3-default-browser-change/14381/14)

```bash
# see ~/.config/mimeapps.list and replace using firefox.desktop if it is necesary
sudo ln -s ~/.local/share/applications/firefox.desktop /usr/share/applications/firefox.desktop

# xdg-mime query default x-scheme-handler/https
# CAUTION: xdg-mime default firefox.desktop text/xml text/html application/xhtml+xml x-scheme-handler/http x-scheme-handler/https
```

# JetBrains Mono

[See](https://www.jetbrains.com/lp/mono/)
[See 2](https://github.com/JetBrains/JetBrainsMono)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
```

# Rotate system logs

```bash
sudo journalctl --rotate
sudo journalctl --vacuum-time=30days
sudo journalctl --vacuum-size=50M
# journalctl --disk-usage
```

# Avoid duplicates in PATH env

[See](https://unix.stackexchange.com/a/149054)

```bash
echo $(command cat <<EOF
\n
# Avoid duplicates in PATH env\n
export PATH=\$(perl -e 'print join(":", grep { not \$seen{\$_}++ } split(/:/, \$ENV{PATH}))')
EOF
) >> ~/.profile
```

# Clean installation

```bash
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
```

# Avoid DEPRECATION on Keys Managment

```bash
sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
```

## That is ALL :D !

# Performance (Optionals)

# Fuzzy Finder (FZF)

[See](https://github.com/junegunn/fzf)

```bash
# After :PluInstall in Vim (Last version auto update by Vim)
sudo ln -s ~/.vim/plugged/fzf/bin/fzf /usr/bin/fzf

# or Debian 9+/Ubuntu 19.10+
# 2025-01-20: Debian APT keeps v0.46.0 (2024-01-23), older!
sudo apt-get install -y fzf
```

# RigGrep for Vim search (Performance FZF and Terminal)

[See](https://github.com/BurntSushi/ripgrep)

```bash
# [L|X]Ubuntu 18.10+ | Rg v11.0.2+
sudo apt-get install -y ripgrep
## sudo apt-get remove ripgrep && sudo apt-get autoremove

# [L|X]Ubuntu < 18.10 | Rg v0.9.0-3
echo "\n" | sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get install -y ripgrep
## sudo apt-get remove ripgrep && echo "\n" | sudo add-apt-repository --remove ppa:x4121/ripgrep
```

# Bat no Cat (Preview FZF and Terminal)

[See](https://github.com/sharkdp/bat)

```bash
# [L|X]Ubuntu 18.10+ | Rg v0.22.1
sudo apt-get install -y bat

# [L|X]Ubuntu < 18.10 | Rg v0.9.0-3
cd ~
# @see https://github.com/sharkdp/bat/releases
sudo curl -L https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -o bat.deb
sudo dpkg -i bat.deb && rm -f bat.deb
sudo ln -s `which batcat` /usr/bin/bat

## Command:
## bat file.php
## sudo apt-get remove bat && sudo apt-get autoremove
```
## Best man

[See](https://gitlab.com/dwt1/dotfiles)

```bash
grep "MANPAGER=\|MANROFFOPT=\|BAT_THEME=" ~/.profile

echo '
# @thanks https://github.com/sharkdp/bat/issues/2753
export MANPAGER="sh -c '"'"'col -bx \| bat --language man --plain'"'"'"
export MANROFFOPT="-c"
export BAT_THEME="gruvbox-dark"' >> ~/.profile
```

## Best less

echo '
# @thanks https://www.jwillikers.com/pagers-and-syntax-highlighting
export LESSOPEN="| bat --color always %s"' >> ~/.profile
```

# Vifm (Terminal File Manager with Vim Style)

[See](https://wiki.vifm.info/index.php?title=Manual)

```bash
sudo apt-get install -y vifm
## sudo apt-get remove vifm && sudo apt-get autoremove
```

# Coding (Optionals)

# Rector

[See](https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md)

```bash
composer global require rector/rector --dev
sudo ln -s ~/.config/composer/vendor/bin/rector /usr/local/bin/phprector
## Command
## phprector -c /var/www/html/freddiegar/services/rector.php process src
## phprector -c /var/www/html/freddiegar/services/rector.php -n process src tests
## phprector -c /var/www/html/freddiegar/services/rector.php --no-diffs process src tests
## composer global remove rector/rector --dev
```

# Phan

[See](https://github.com/phan/phan)

```bash
composer global require phan/phan --dev
sudo ln -s ~/.config/composer/vendor/bin/phan /usr/local/bin/phan
## Command
## phan -k /var/www/html/freddiegar/services/phan.php src
## composer global remove phan/phan --dev
```

# Faker

```bash
composer global require fakerphp/faker --dev
# require_once '/home/freddie/.config/composer/vendor/autoload.php';
# echo (Faker\Factory::create())->email();
## composer global remove fakerphp/faker --dev
```

# Infection AST

[See](https://github.com/infection/infection/releases)

```bash
sudo curl -L https://github.com/infection/infection/releases/download/0.29.6/infection.phar -o /usr/local/bin/infection
sudo chmod +x /usr/local/bin/infection
## Command:
## infection -j$(nproc)
## infection -j$(nproc) [--filter=file.php]
## sudo rm /usr/local/bin/infection
```

# PHPLOC (Lines Of Code)

```bash
sudo curl -L https://phar.phpunit.de/phploc.phar -o /usr/local/bin/phploc
sudo chmod +x /usr/local/bin/phploc
## Command:
## phploc --exclude=vendor .
## sudo rm /usr/local/bin/phploc
```

# PHPCPD (Copy/Paste Dectector)

```bash
sudo curl -L https://phar.phpunit.de/phpcpd.phar -o /usr/local/bin/phpcpd
sudo chmod +x /usr/local/bin/phpcpd
## Command:
## phpcpd --exclude=vendor .
## sudo rm /usr/local/bin/phpcpd
```

# PHPMetrics

[See](https://github.com/phpmetrics/PhpMetrics/releases)

```bash
sudo curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v3.0.0rc6/phpmetrics.phar -o /usr/local/bin/phpmetrics
sudo chmod +x /usr/local/bin/phpmetrics
## Command:
## phpmetrics --excluded-dirs vendor --report-html=./tests/coverage/phpmetrics .
## sudo rm /usr/local/bin/phpmetrics
```

# Xdebug (PHP Debugger)

```bash
sudo apt-get install -y php-xdebug
# sudo apt-get install -y php7.4-xdebug
# or
sudo pecl install -f xdebug

# Xdebug 3
## Backup v2
sudo cp -p /etc/php/7.4/mods-available/xdebug.ini /etc/php/7.4/mods-available/xdebug.ini.v2
echo 'xdebug.idekey=PHPSTORM
xdebug.mode=debug
xdebug.start_with_request=trigger
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
;xdebug.log=/var/www/html/xdebug/xdebug.log
xdebug.file_link_format=xdebug://%f@%l
zend_extension=/usr/lib/php/20210902/xdebug.so' | sudo tee /etc/php/8.1/mods-available/xdebug.ini

# Xdebug 2

sudo pecl install -f xdebug-2.9.8

echo 'xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=localhost
xdebug.remote_port=9003
xdebug.remote_enable=1
xdebug.remote_autostart=1
; To enable profiler use XDEBUG_PROFILE=PHPSTORM in (GET|POST|COOKIE)
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
zend_extension=/usr/lib/php/20190902/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini

# PHP 7.4: zend_extension=/usr/lib/php/20190902/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini
sudo phpenmod xdebug
```
> In docker is loaded in: /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

## Upgrade

```bash
# all
sudo pecl upgrade
# or specific
sudo pecl upgrade -f xdebug
```

## Linking

[See](https://xdebug.org/docs/all_settings#file_link_format)

```bash
mkdir ~/bin
echo "#\!/bin/sh

f=\`echo \$1 | cut -d @ -f 1 | sed 's/xdebug:\/\///'\`
l=\`echo \$1 | cut -d @ -f 2\`
gvim --remote-tab +\$l \$f
" > ~/bin/ff-xdebug.sh

# Permissions
sudo chmod +x ~/bin/ff-xdebug.sh
```

## Throuble

Maybe need run as `sudo` user! or:

### Cannot install, php_dir for channel "pecl.php.net" is not writeable by the current user
### No releases available for package "pecl.php.net/package"
### Error getting channel info from pear.php.net: Connection to `ssl://pear.php.net:443' failed

```bash
# Update channel
sudo pecl channel-update pecl.php.net

# Update certificates, use default_cert_file path
php -r "print_r(openssl_get_cert_locations());"
sudo curl -fLo /usr/local/ssl/cert.pem http://curl.haxx.se/ca/cacert.pem
# in Docker
# curl -fLo /usr/lib/ssl/cert.pem http://curl.haxx.se/ca/cacert.pem
```

Or download as old times

```bash
curl -fsL "http://pecl.php.net/get/xhprof-2.3.9.tgz" -o /tmp/xhprof.tgz
mkdir -p /var/www/html/xhprof/82 && tar -xf /tmp/xhprof.tgz -C /var/www/html/xhprof/82
cd /var/www/html/xhprof/82/xhprof-2.3.9/extension
phpize && ./configure && make && sudo make install && cd /var/www/html
```

# Extra (Optionals)

## Filezilla

```bash
sudo apt-get install -y filezilla
```

## VSCode (Don't use snap for this, security risk)

[Download](https://code.visualstudio.com/docs/?dv=linux64_deb)

```bash
# VS Code
cd ~
curl -L "https://vscode.download.prss.microsoft.com/dbazure/download/stable/fabdb6a30b49f79a7aba0f2ad9df9b399473380f/code_1.96.2-1734607745_amd64.deb" -o vscode.deb
sudo dpkg -i vscode.deb
rm -f vscode.deb
## sudo apt-get remove code && sudo apt-get autoremove
```

## Sublime Text

```bash
cd ~
curl -L https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublime-text.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install -y sublime-text
## sudo apt-get remove sublime-text && sudo apt-get autoremove
## sudo rm /etc/apt/sources.list.d/sublime-text.list
```

#### Font ST3

Menu -> Preferences -> Settings -> User Settings File

```json
{
    ...
    "font_face": "Fira Code",
    "font_size": 18,
    "font_options": [
        "gray_antialias"
    ],
    "show_encoding": false,
    "show_line_endings": false,
    "default_line_ending": "unix",
    "draw_white_space": "all",
    "translate_tabs_to_spaces": true,
    "word_wrap": false
    ...
}
```

### Vi(ntage) Mode

#### Enable
1. Ctrl + Shift + P: Install Package Control
2. Ctrl + Shift + P: Package Control: Enable Package<Enter>
3. Select Vintage Option

Ready! Vi Layout On :D

#### Disable
1. Ctrl + Shift + P: Package Control: Disable Package<Enter>
2. Select Vintage Option

Ready! Vi Layout Off :(

## Ubuntu: Gnome Tweak Tool

```bash
gnome-shell --version
sudo apt-get install -y gnome-tweak-tool
## sudo apt-get remove gnome-tweak-tool && sudo apt-get autoremove
```

## Ubuntu: Gnome Clocks

```bash
gnome-shell --version
sudo apt-get install -y gnome-clocks
## sudo apt-get remove gnome-clocks && sudo apt-get autoremove
```

## Install Xdebug Profiler

```bash
sudo apt-get install -y kcachegrind
## sudo apt-get remove kcachegrind && sudo apt-get autoremove
```

## OBS - Open Broadcasting Software

```bash
# Oldest
sudo add-apt-repository ppa:obsproject/obs-studio
##

sudo apt-get install -y ffmpeg obs-studio
mkdir $HOME/obs
## sudo apt-get remove obs-studio ffmpeg && sudo apt-get autoremove && echo "\n" | sudo add-apt-repository --remove ppa:obsproject/obs-studio
```

## Screen Recording

```bash
sudo apt-get install -y kazam
## sudo apt-get remove kazam && sudo apt-get autoremove
```

## ScreenKey -> only X11

[See](https://www.thregr.org/wavexx/software/screenkey/)

```bash
sudo apt-get install -y screenkey
## sudo apt-get remove screenkey && sudo apt-get autoremove
```

## Ubuntu: CPU Usage Bar

```bash
sudo apt-get install -y indicator-multiload
## sudo apt-get remove indicator-multiload && sudo apt-get autoremove
```

## Extensions GUI

```bash
# Clock to right (Frippery Move Clock)
https://extensions.gnome.org/extension/2/move-clock/
# Activities button hidden
https://ubuntuhandbook.org/index.php/2020/03/hide-activities-button-ubuntu-18-04/
```

## Screenshot++

[See](https://flameshot.org/#features)

```bash
sudo apt-get install -y flameshot
```

## RSA SecureID

[See](https://sourceforge.net/p/stoken/wiki/Home/)

```bash
# Oldest
echo "\n" && sudo add-apt-repository ppa:cernekee/ppa
sudo apt-get update
sudo apt-get install -y stoken libstoken-dev
## sudo apt-get remove stoken libstoken-dev && sudo apt-get autoremove
## echo "\n" | sudo add-apt-repository --remove ppa:cernekee/ppa # Only Ubuntu

# Newest
sudo apt-get install -y stoken
## sudo apt-get remove stoken && sudo apt-get autoremove
## Start
stoken-gui --small &
```

## Google Chrome

```bash
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -L https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/google-chrome.gpg > /dev/null

sudo apt-get update
sudo apt-get install -y google-chrome-stable
## sudo apt-get remove google-chrome-stable && sudo apt-get autoremove
```

## Brave (Anime ;P)

```bash
sudo apt-get update
sudo apt-get install -y brave-browser
## sudo apt-get remove brave-browser && sudo apt-get autoremove
```

## Microsoft Edge (for Teams :()

```bash
curl -L https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft-edge.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

sudo apt-get update
sudo apt install microsoft-edge-stable
## sudo apt-get remove microsoft-edge-stable && sudo apt-get autoremove
```
> Something was wrong?
> ls -la /etc/apt/trusted.gpg.d
> sudo chmod 755 /etc/apt/trusted.gpg.d -f
> sudo chmod 644 /etc/apt/trusted.gpg.d/* -Rf
> sudo chown root:root /etc/apt/trusted.gpg.d/* -Rf
> -rw-r--r-- 1 root root 2794 Mar 26  2021 ubuntu-keyring-2012-cdimage.gpg
> -rw-r--r-- 1 root root 1733 Mar 26  2021 ubuntu-keyring-2018-archive.gpg

## GNUPG (Legacy)

```bash
sudo apt-get install -y gnupg1
```

## Onefetch

Not snap please
[See](https://github.com/o2sh/onefetch/wiki/getting-started)

```bash
echo "\n" | sudo add-apt-repository ppa:o2sh/onefetch
sudo apt-get update
sudo apt-get install onefetch
# onefetch /path/git
# echo "\n" | sudo add-apt-repository --remove ppa:o2sh/onefetch
```

# Redshif (for my eyes please)

[See](https://github.com/jonls/redshift)

```bash
sudo apt-get install redshift
mkdir -p ~/.config/redshift
ln -s `pwd`/redshift/redshift.conf ~/.config/redshift/redshift.conf
# sudo apt-get remove redshift && sudo apt-get autoremove
```

# Picom (alternative for xcompmgr)

[See](https://github.com/yshui/picom)

```bash
sudo apt-get install picom
mkdir -p ~/.config/picom
ln -s `pwd`/picom/picom.conf ~/.config/picom/picom.conf
# sudo apt-get remove picom && sudo apt-get autoremove
```
> Slower and more customizable, In fact: I dont use it

## Auto-cpufreq (well: bluetooth fails)

[See](https://github.com/AdnanHodzic/auto-cpufreq?tab=readme-ov-file#auto-cpufreq-installer)

```bash
git clone --depth=1 https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq
sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
auto-cpufreq --stats
sudo systemctl enable auto-cpufreq
sudo systemctl status auto-cpufreq

sudo auto-cpufreq --update=/var/www/html/AdnanHodzic/auto-cpufreq
## sudo systemctl disable auto-cpufreq
## sudo auto-cpufreq --remove
```

## Virtual Machine

### Virt-Manager

[See](https://www.youtube.com/watch?v=p1d_b_91YlU)
[See 2](https://www.youtube.com/watch?v=9FBhcOnCxM8)

```bash
sudo apt-get update
sudo apt-get install qemu qemu-kvm libvirt-bin bridge-utils virt-manager
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
# Enable user to use libvirt
sudo usermod -G libvirt -a $USER
# Enable UEFI feature
sudo apt-get install -y ovmf
## Return to Host: Ctrl + Alt keys
## -format
## -Output
## Convert vdi image
sudo qemu-img convert -f vdi -O qcow2 Ubuntu\ 20.04.vdi /var/lib/libvirt/images/ubuntu-20-04.qcow2
## sudo apt-get remove virt-manager && sudo apt-get autoremove
```

### Virtual Box

```bash
# v5.2
sudo apt-get update
sudo apt-get install virtualbox
## sudo apt-get remove virtualbox && sudo apt-get autoremove

# v6.1
sudo apt-get update
sudo apt-get install -y libqt5opengl5
sudo curl -L https://download.virtualbox.org/virtualbox/6.1.32/virtualbox-6.1_6.1.32-149290~Ubuntu~bionic_amd64.deb -o virtualbox.deb
sudo dpkg -i virtualbox.deb
reboot
rm -f ~/virtualbox.deb
## sudo apt-get remove virtualbox-6.1 && sudo apt-get autoremove
```
> On updated, first uninstall: sar virtualbox-6.1

### Virtual Box Shared Folders

```bash
# After Shared Folder in GUI in Guest
# Insert Guest Additions Image
cd /media/[username]/VBox_GAs_6.1.32
# cd /media/freddie/VBox_GAs_6.1.32
sudo sh VBoxLinuxAdditions.run
sudo shutdown -r now

sudo -i
addgroup [username] vboxsf
# addgroup freddie vboxsf
# require logout: shutdown -r now
chown root:vboxsf [path]
# chown root:vboxsf /var/www
```

### Virtual Box Issues

[See](https://stegard.net/2016/10/virtualbox-secure-boot-ubuntu-fail/)

```bash
# In host machine
sudo -i
mkdir /root/module-signing
cd /root/module-signing
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/Freddie Gar/"
chmod 600 MOK.priv
mokutil --import /root/module-signing/MOK.der

echo '#!/usr/bin/env bash

for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
  echo "Signing $modfile"
  /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
                                /root/module-signing/MOK.priv \
                                /root/module-signing/MOK.der "$modfile"
done
' > /root/module-signing/sign-vbox-modules

chmod 700 /root/module-signing/sign-vbox-modules
```
> After each update linux-headers: sh /root/module-signing/sign-vbox-modules && modprobe vboxdrv

## Remove Snap Unused

In olders Ubuntu versions < 24.10

```bash
sudo snap list

sudo snap remove firefox
sudo snap remove gnome-3-28-1804
sudo snap remove gnome-42-2204
sudo snap remove gtk-common-themes
sudo snap remove snap-store
sudo snap remove snapd-desktop-integration
sudo snap remove teams-for-linux
```

## Remove LibreOffice

```bash
sudo apt-get remove -y --purge libreoffice\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

## Remove Rhythmbox

```bash
sudo apt-get remove -y --purge rhythmbox\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# Clean installation

```bash
sudo apt-get autoremove -y && sudo apt-get autoclean -y
```

# Summary

## Commands
:Rj_wv$P/\v^\w+

```bash
lsb_release -d | grep -e "Description:" | awk '{print $2" "$3" "$4}'
# Ubuntu 24.10
uname -r
# 6.11.0-21-generic
ldd --version | grep -e "^ldd" | awk '{print $5}'
# 2.40
gcc --version | grep -e "^gcc" | awk '{print $4}'
# 14.2.0
openssl version | awk '{print $2}'
# 3.0.10
# 1.1.1w
i3 --version | awk '{print $3}'
# 4.23
i3status --version | grep -e "i3status" | awk '{print $2}'
# 2.14-non-git
# konsole --version | awk '{print $2}'
# # 23.08.1
urxvt -help 2>&1 | head -n 1 | awk '{print $3}'
# v9.31
bash --version | grep -e "bash" | awk '{print $4}'
# 5.2.32(1)-release
zsh --version | awk '{print $2}'
# 5.9
# https://github.com/vim/vim/releases/tag/v9.1.#
echo `vim --version | grep -e "^VIM " | awk '{print $5}'`.`vim --version | grep -e "^Included "`
# 9.1.Included patches: 1-16, 647-648, 678, 697, 689, 17-496, 707
echo `nvim --version | grep -e "^NVIM " | awk '{print $2}'`-`nvim --version | grep -e "^LuaJIT " | awk '{print $1"-"$2}'`
# v0.12.0-dev-LuaJIT-2.1.1719379426
neovide --version | awk '{print $2}'
# 0.14.1
vifm --version | grep -e "^Version" | awk '{print $2}'
# 0.12
curl --version | grep -e "^curl " | awk '{print $2}'
# 8.9.1
git --version | awk '{print $3}'
# 2.45.2
git lfs version
# git-lfs/3.5.0 (GitHub; linux amd64; go 1.22.2)
docker --version | awk '{print $3}' | sed 's/,//g'
# 28.0.4
docker-compose --version | awk '{print $4}'
# v2.32.1
feh --version | grep version | awk '{print $3}'
# 3.10.2
maim --version | awk '{print $1}'
# v5.7.4
unzip -v | grep "^UnZip.*\.$" | awk '{print $2}'
# 6.00
jq --version | sed 's/jq-//g'
# 1.7
tree --version | awk '{print $2}'
# v2.1.1
nmap --version | grep "^Nmap" | awk '{print $3}'
# 7.94SVN
htop --version | grep "^htop" | awk '{print $2}'
# 3.3.0
man xcompmgr | grep "^X Version" | awk '{print $5}'
# 1.1.8
batcat --version | awk '{print $2}'
# 0.24.0
rg --version | grep -e "^ripgrep" | awk '{print $2}'
# 14.1.0
php --version | grep -e "^PHP" | awk '{print $2}'
# 8.4.5
# nvm --version
# # 0.39.3
npm --version
# 10.9.2
node --version
# v21.7.3
mysql --version | awk '{print $3}'
# 8.0.41-0ubuntu0.24.10.1
# stoken --version | head -1 | awk '{print $2}'
# 0.92
python3 --version | awk '{print $2}'
# 3.12.7
ruby --version | awk '{print $2}'
# 3.3.4
rustc --version | awk '{print $2}'
# 1.84.1
go version | awk '{print $3}' | sed 's/go//g'
# 1.23.4
ctags --version | head -1 | awk '{print $3}' | sed 's/,//g'
# 6.1.0(c3b5484)
gpg1 --version | head -1 | awk '{print $3}'
# 1.4.23
ftp about:version | head -1 | awk '{print $3}'
# 20230507
ncftpput --version | head -1 | awk '{print $2}'
# 3.2.6
pipewire --version | head -2 | awk '{print $4}'
# 1.2.4
NetworkManager --version
# 1.48.8
bluemoon --version
# 5.77
firefox --version | awk '{print $3}'
# 137.0b10
zen --version | awk '{print $3}'
# 1.10.3t
dpkg --list | wc --lines
# 2595
for app in /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop; do app="${app##/*/}"; echo "${app::-8}"; done | wc --lines
# 95
apt list --installed | wc --lines
# 2388
apt-mark showmanual | wc --lines
# 442
```
