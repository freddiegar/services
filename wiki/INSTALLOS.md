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
[See](https://linuxblog.io/linux-performance-almost-always-add-swap-space/)

```bash
free -h
sudo swapoff -a
command cat /etc/fstab | grep swap
sudo fallocate -l 8G /swap.img
sudo mkswap /swap.img
sudo chown 0600 /swap.img
sudo swapon -a
```

# Better SSD I/O

[See](https://wiki.debian.org/SSDOptimization)

Increase commit 5s to 10m (600s), it uses RAM over I/O operations

```bash
sudo cp /etc/fstab /etc/fstab.original

sudo vi /etc/fstab
# Adding: discard,noatime,nodiratime,nobarrier,commit=600
# / ext4 defaults,discard,noatime,nodiratime,nobarrier,commit=600 0 1

# Not use: data=writeback, use next command:
## To revert, try
## ls -la /dev/mapper
## mount -n ubuntu--vg-ubuntu--lv / -w -o remount,rw
## vi /etc/fstab
## reboot

sudo tune2fs -o journal_data_writeback ubuntu--vg-ubuntu--lv

# Not use:
#   nobh:       not valid option in SSD drives, depends of date=writeback
#   relatime:   default in newer versions of kernel (>= 2.3)

reboot
```
> man mount

# Better TMP/Logs I/O

[See](https://itbeginner.net/tweak-optimize-ssd-ubuntu-linux-mint/)
[For /tmp not use noexec flag](https://github.com/dbeaver/dbeaver/issues/5939#issuecomment-506719658) error with SQLite

```bash
echo '# /tmp is better as RAM info
tmpfs /tmp tmpfs defaults,noatime,nosuid,nodev,mode=1777,size=2048M 0 0' | sudo tee -a /etc/fstab

echo '# /var/cache is faster and temporal, then: use in RAM
tmpfs /var/cache tmpfs defaults,noatime,mode=1777 0 0' | sudo tee -a /etc/fstab

echo '# /var/log is faster and temporal, then: use in RAM
tmpfs /var/log tmpfs defaults,noatime,mode=0755 0 0' | sudo tee -a /etc/fstab
```

# English Language for All

```bash
command cat /etc/default/locale

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
sudo apt-get install --no-install-recommends -y software-properties-common git-core curl
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
[Tips 3](https://blog.arrietty.ca/unlocking-advanced-linux-performance-through-kernel-parameter-tuning/)
[Tips 4](https://support.tools/linux-performance-monitoring-optimization-guide/)

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

# @see https://www.kernel.org/doc/html/latest/admin-guide/sysctl/vm.html#vfs-cache-pressure

# Default: 100 (percentage)
sysctl -a | grep 'vm.vfs_cache_pressure'

echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

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
grep "GRUB_TIMEOUT=\|GRUB_TIMEOUT_STYLE=" /etc/default/grub

sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/g' /etc/default/grub

grep "GRUB_TIMEOUT=\|GRUB_TIMEOUT_STYLE=" /etc/default/grub

sudo update-grub
```
> @see https://askubuntu.com/a/150377
> 1. Hold Shift or Esc key to show GRUB menu (after POST screen)
> 2. Recovery as root user
>   Advance Options -> Recovery Mode -> Drop to root shell prompt

# Change graphical to text GRUB

```bash
grep "GRUB_CMDLINE_LINUX_DEFAULT=\|GRUB_CMDLINE_LINUX=\|GRUB_TERMINAL=" /etc/default/grub

# Not comment to avoid showing each step in GRUB: quiet splash
# sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT/#GRUB_CMDLINE_LINUX_DEFAULT/g' /etc/default/grub

# WARNING: Security advice
# [See](https://linuxblog.io/why-small-vps-slow/)
# [Attack](https://meltdownattack.com/)
# sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash spec_store_bypass_disable=off mitigations=off"/g' /etc/default/grub

# @see https://www.baeldung.com/linux/solid-state-drive-optimization#optimize-io-scheduler (slower: 3.15 vs 2.45m)
# @see https://yarondar.wordpress.com/2018/07/29/have-you-tried-blk-mq/
# command cat /sys/block/loop*/queue/scheduler
# command cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
# echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
# command cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

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
sudo apt-get install --no-install-recommends -y unattended-upgrades update-notifier-common

grep 'Remove-Unused-Kernel-Packages\|Remove-Unused-Dependencies\|Automatic-Reboot-Time' /etc/apt/apt.conf.d/50unattended-upgrades

sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages "[true|false]*";/Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Dependencies "[true|false]*";/Unattended-Upgrade::Remove-Unused-Dependencies "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/g' /etc/apt/apt.conf.d/50unattended-upgrades

grep 'Remove-Unused-Kernel-Packages\|Remove-Unused-Dependencies\|Automatic-Reboot-Time' /etc/apt/apt.conf.d/50unattended-upgrades

dpkg-reconfigure --priority=low unattended-upgrades
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

# Disabled LPD (Printers) Service

```bash
sudo service lpd stop && sudo systemctl disable lpd
sudo apt-get remove -y --purge lpr && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# ZSH

[See](https://towardsdatascience.com/comparing-sh-bash-ksh-and-zsh-speed-82a72bbc20ed)
[See 2](https://google.github.io/styleguide/shellguide.html)

```bash
sudo apt-get install --no-install-recommends -y zsh
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
sudo apt-get install --no-install-recommends -y fonts-firacode
## sudo apt-get remove fonts-firacode && sudo apt-get autoremove
```

## Profile Environment

```bash
grep "EDITOR=\|VISUAL=\|VIEWER=\|BROWSER=\|WWW_HOME=" ~/.profile

echo '
export EDITOR=vim
export VISUAL=vim
export VIEWER=nsxiv
export BROWSER=/usr/bin/zen
export WWW_HOME="https://www.duckduckgo.com"' >> ~/.profile
```
> export BROWSER=/usr/lib/x86_64-linux-gnu/opera/opera
> export BROWSER=/opt/brave.com/brave/brave-browser
> export BROWSER=/opt/google/chrome/google-chrome
> export BROWSER=/opt/microsoft/msedge/microsoft-edge

## Setup ulimit

```bash
grep -F "Improve Disk IO Performance" ~/.zshrc

# Defaults 1024
ulimit -n

echo '
# Improve Disk IO Performance
ulimit -n 4096' >> ~/.zshrc
```

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
grep -F "# Vi mode" ~/.zshrc

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
bindkey -M menuselect 'j' vi-down-line-or-history

function precmd() {
    # Keep block cursor shape after close nvim (after v0.12 fails)
    echo -e -n "\e[2 q"
}" >> ~/.zshrc
```
> @see ~/.oh-my-zsh/plugins/
> man zshzle

# Ignore aliasses

grep -F "# Ignores in History" ~/.zshrc

echo "
# Ignores in History
# @see https://unix.stackexchange.com/a/6104
# @see https://zsh.sourceforge.io/Doc/Release/Options.html
# @thanks https://github.com/ohmyzsh/ohmyzsh/blob/6a65ac90259d87f7549c581372403405ef01b7d2/lib/history.zsh#L35
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
HISTORY_IGNORE='..|__|___|a|b|c|d|e|g|h|i|l|m|n|o|p|q|r|s|t|w|y|z|a *|alias|alias *|v|v[vlnd]|x|exit|reset|clear|htop|[rv][azh3]|f|f[adfjmnotu]|ls|ls *|cd|cd ..|cd *|cd[eatx]|g[sfvVMN]|gst|ga .|gd|gdc|glo[gpf]|rm *|cd[etxf]|vd[etxf]|k[dl]|pkill *|startx|reboot|sa[irsy]|s[uc] *|h[ht]|fo *|[bf]g'" >> ~/.zshrc

# Aliases

```bash
ln -s `pwd`/shell/bash/bash_aliases ~/.bash_aliases

## Enable alias in Zsh
echo '
[ -f ~/.bash_aliases ] && \. ~/.bash_aliases' >> ~/.zshrc

command cat <<"EOF" >> ~/.zshrc

# @thanks https://unix.stackexchange.com/a/595281
bindkey -s '^o' "^u`alias W | sed "s/'//g" | awk -F= '{print $2}'`^M"
# bindkey -s '^e' "^uvde^M" conflicts with zsh shorcut
# bindkey -s '^f' "^uvdf^M" conflicts with zsh shorcut
EOF
```

## Enable alias in Vim

```bash
echo '
[ -f ~/.bash_aliases ] && \. ~/.bash_aliases' >> ~/.zshenv
```

# Main and extra utils

```bash
sudo apt-get install --no-install-recommends -y unzip curl tree nmap htop i3 xsel xcompmgr feh pavucontrol pulseaudio-utils maim xclip ncal make build-essential
## sudo apt-get remove unzip curl tree nmap htop i3 xsel xcompmgr feh pavucontrol pulseaudio-utils maim xclip ncal make build-essential && sudo apt-get autoremove
```

## i3

```bash
mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3/config
ln -s `pwd`/i3/status.conf ~/.config/i3/status.conf
ln -s `pwd`/i3/battery ~/.config/i3/battery-popup
ln -s `pwd`/i3/workspace ~/.config/i3/workspace
ln -s `pwd`/i3/lock ~/.config/i3/lock
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
command cat ~/.xinitrc

# Hack: '<,'>w !bash
echo 'dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
xrdb -I$HOME ~/.Xresources
exec i3' >> ~/.xinitrc
```

### Clipboard history in i3

[See](https://github.com/erebe/greenclip?tab=readme-ov-file#installation)
[Battery?](https://andreafortuna.org/2024/08/04/a-minimalist-approach-to-clipboard-management-in-linux-crafting-a-custom-solution)

```bash
ln -s `pwd`/greenclip/greenclip.toml ~/.config/greenclip.toml

# v4.3 is broken

sudo curl -L https://github.com/erebe/greenclip/releases/download/v4.2/greenclip -o /usr/local/bin/greenclip
sudo chmod +x /usr/local/bin/greenclip
## sudo rm /usr/local/bin/greenclip
```

### Background Lock Image

```bash
sudo apt-get install --no-install-recommends -y imagemagick
# Allows use
#      import
#      convert
## sudo apt-get remove imagemagick && sudo apt-get autoremove
```
> Used in aliases wh and wr and i3 lock script

## Terminal Emulator

```bash
sudo apt-get install --no-install-recommends -y rxvt-unicode

sudo ln -s `pwd`/emulator/urxvt/resize-font /usr/lib/x86_64-linux-gnu/urxvt/perl/resize-font
sudo ln -s `pwd`/emulator/urxvt/config-reload /usr/lib/x86_64-linux-gnu/urxvt/perl/config-reload

ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xdefaults
ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xresources

xrdb ~/.Xresources
```

## Vim Configuration

```bash
sudo apt-get install --no-install-recommends -y vim
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
sudo apt-get install --no-install-recommends -y vim-gtk3
## In olders versions use: vim-gnome
# Check again ;)
```

## Vim JSON Development (and Git Hooks)

[See](https://jqlang.github.io/jq/)

```bash
sudo apt-get install --no-install-recommends -y jq
# sudo apt remove jq && sudo apt-get autoremove
```

## Vim SQL Development

```bash
sudo apt-get install --no-install-recommends -y sqlformat
# sudo apt remove sqlformat && sudo apt-get autoremove
```

## Vim XML Development

```bash
sudo apt-get install --no-install-recommends -y libxml2-utils
# sudo apt remove libxml2-utils && sudo apt-get autoremove
```

## Vim CSV to JSON

```bash
sudo apt-get install --no-install-recommends -y miller
# sudo apt remove miller && sudo apt-get autoremove
```

## Node (require in Vim LSP but in development work too!)

[NVM Versions](https://github.com/nvm-sh/nvm/releases)
[Node Versions](https://nodejs.org/en/about/previous-releases)

```bash
cd ~
# Slower!
# @see https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
# sudo apt-get install --no-install-recommends -y build-essential libssl-dev # Only oldest Ubuntu
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo '
# # Uncomment to update node
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | tee -a ~/.zshrc

# # Close Terminal to load changes
# # Show version available
nvm ls-remote

# # Ubuntu 18
# # @requirements https://github.com/nodesource/distributions#debian-and-ubuntu-based-distributions
# # ldd --version
nvm install v24.0.1
# Latest version of node (and npm)
## nvm install node

# nvm alias default v24.0.1
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
## npm install -g npm@11.3.0
## npm --version
## npm uninstall -g npm@latest
```

### LSP (Skip if use :Mason)

#### C (Skip if use :Mason)

[See](https://llvm.org/docs/GettingStarted.html#overview)
[See 2](https://www.jianshu.com/p/3c7eae5c0c68)
[See 3](https://github.com/llvm/llvm-project/releases)
[See 4](https://apt.llvm.org/)

```bash
cd ~
# sudo apt-get install --no-install-recommends -y libncurses5
sudo apt-get install --no-install-recommends -y clang-20 clangd-20 lldb-20 lld-20
sudo rm /usr/bin/clang /usr/bin/clang++ /usr/bin/clang-cpp /usr/bin/clangd
sudo ln -s /usr/bin/clang-20 /usr/bin/clang
sudo ln -s /usr/bin/clang++-20 /usr/bin/clang++
sudo ln -s /usr/bin/clang-cpp-20 /usr/bin/clang-cpp
sudo ln -s /usr/bin/clangd-20 /usr/bin/clangd
clangd --version
```

#### Vim (Skip if use :Mason)

[See](https://github.com/iamcco/vim-language-server)

```bash
npm install -g vim-language-server
```

#### Sh (Skip if use :Mason)

[See](https://github.com/iamcco/vim-language-server)

```bash
npm install -g bash-language-server
```

#### Javascript|Typescript (js, jsx, ts) (Skip if use :Mason)

[See](https://github.com/typescript-language-server/typescript-language-server)

```bash
npm install -g typescript-language-server typescript
```

#### Tailwindcss (Skip if use :Mason)

[See](https://github.com/tailwindlabs/tailwindcss-intellisense)

```bash
npm install -g @tailwindcss/language-server
```

#### JSON (Skip if use :Mason)

[See](https://github.com/hrsh7th/vscode-langservers-extracted)

```bash
npm install -g vscode-langservers-extracted
```

#### YAML (Skip if use :Mason)

[See](https://github.com/redhat-developer/yaml-language-server)

```bash
npm install -g yaml-language-server
```

#### SQL (Skip if use :Mason)

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
#     "user": "user",
#     "password": "password",
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
#             "user": "user",
#             "password": "password",
#             "projectPaths": [
#                 "/var/www/html/freddiegar/working/path/CODE/microsites"
#             ]
#         }
#     ]
# }' > ~/.config/sql-language-server/.sqllsrc.json
```

#### Lua (Skip if use :Mason)

[See](https://luals.github.io/wiki/build/)

```bash
sudo apt-get install --no-install-recommends -y ninja-build
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

#### Rust (Skip if use :Mason)

[Versions](https://releases.rs/)

```bash
# Check version
rustc --version

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

#### Go (Skip if use :Mason)

[See](https://go.dev/doc/install)
[See 2](https://go.dev/doc/install/source)
[See 3](https://github.com/golang/wiki/blob/master/Ubuntu.md#using-ppa)
[See 4](https://thenewstack.io/golang-how-to-use-the-go-install-command/)

```bash
# Check version
go version

curl -L https://go.dev/dl/go1.25.6.linux-amd64.tar.gz -o go-linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go-linux-amd64.tar.gz && rm go-linux-amd64.tar.gz

grep -F "Enable go" ~/.profile

echo '
# Enable go
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

grep -F "Enable go" ~/.profile

go version

sudo apt-get install --no-install-recommends -y gopls
```
> sudo apt-get remove gopls

##### Laravel LSP (Skip if use :Mason)

[See](https://github.com/laravel-ls/laravel-ls)

```bash
go install github.com/laravel-ls/laravel-ls/cmd/laravel-ls@latest
sudo ln -s /home/$USER/go/bin/laravel-ls /usr/bin/laravel-ls
```

#### Ruby (Skip if use :Mason)

[See](https://solargraph.org/guides/getting-started)

```bash
sudo apt-get install --no-install-recommends -y make build-essential ruby-dev
sudo gem install solargraph
```

#### Vim Slides (require go) not used at 2026-01-24

[See](https://github.com/maaslalani/slides)
[Manual](http://bloodgate.com/perl/graph/manual/syntax.html)
[Demo](https://youtu.be/wIyz7UQPL70)
[AscciArt](https://www.asciiart.eu/text-to-ascii-art)

```go
sudo apt-get install --no-install-recommends -y make
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
sudo apt-get install --no-install-recommends -y git-lfs
## sudo apt-get remove git-lfs && sudo apt-get autoremove
```
> https://www.howtogeek.com/devops/how-to-completely-reset-a-git-repository-including-untracked-files/

### GIT Flow

```bash
sudo apt-get install --no-install-recommends -y git-flow
## sudo apt-get remove git-flow && sudo apt-get autoremove
```

### GIT Summary

[See](https://github.com/albenik/git-summary)
[AWK Intro](https://www.youtube.com/watch?v=Dr0zFRswrwk)

```bash
cd ~
sudo apt-get install --no-install-recommends -y gawk
sudo curl -L https://raw.githubusercontent.com/albenik/git-summary/master/git-summary -o /usr/local/bin/git-summary
sudo chmod +x /usr/local/bin/git-summary
## sudo apt-get remove gawk && sudo rm /usr/local/bin/git-summary && sudo apt-get autoremove
```

## GIT Stats

[See](https://github.com/arzzen/git-quick-stats)

```bash
sudo apt-get install --no-install-recommends -y git-quick-stats
```

## GIT CLI

[See](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```bash
# Install
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "Types: deb
URIs: https://cli.github.com/packages
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/githubcli-archive-keyring.gpg" | sudo tee /etc/apt/sources.list.d/github-cli.sources > /dev/null

sudo apt-get update
sudo apt-get install --no-install-recommends -y gh

# Auth (need token from: https://github.com/settings/tokens)
gh config set -h github.com git_protocol ssh
## or Interactive
gh auth login
```
> Disable to use saU alias
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*github-cli*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*github-cli*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*github-cli*.sources

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
# @see /etc/apt/sources.list.d/ondrej-ubuntu-php-plucky.sources :: plucky -> noble
sudo sed -i 's/^Suites: plucky/Suites: noble/g' /etc/apt/sources.list.d/ondrej*.sources

sudo apt-get install --no-install-recommends -y php8.5-cli
sudo apt-get install --no-install-recommends -y php8.5-dev
sudo apt-get install --no-install-recommends -y php8.5-mbstring
sudo apt-get install --no-install-recommends -y php8.5-mysql
sudo apt-get install --no-install-recommends -y php8.5-curl
sudo apt-get install --no-install-recommends -y php8.5-zip
sudo apt-get install --no-install-recommends -y php8.5-soap
sudo apt-get install --no-install-recommends -y php8.5-gd
sudo apt-get install --no-install-recommends -y php8.5-sqlite3
sudo apt-get install --no-install-recommends -y php8.5-intl
sudo apt-get install --no-install-recommends -y php8.5-memcached
sudo apt-get install --no-install-recommends -y php8.5-redis
sudo apt-get install --no-install-recommends -y php8.5-bcmath
sudo apt-get install --no-install-recommends -y php8.5-gmp
sudo apt-get install --no-install-recommends -y php8.5-xml

## PHP Xdebug (I'm not god)
sudo apt-get install --no-install-recommends -y php8.5-xdebug

## PHP Coverage (I'm desesperate)
sudo apt-get install --no-install-recommends -y php8.5-ast
sudo apt-get install --no-install-recommends -y php8.5-pcov

## sudo apt-get remove php8.5\* && sudo apt-get autoremove
## echo "\n" | sudo add-apt-repository --remove ppa:ondrej/php
```
> Disable to use saU alias
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*ondrej*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*ondrej*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*ondrej*.sources

## Composer for PHP

```bash
cd ~
curl -L https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -Rf composer-setup.php
## Update
## sudo composer self-update
## Rollback
## sudo composer self-update --rollback
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
# Check version
/usr/local/bin/dependency --version

composer global require --dev shipmonk/composer-dependency-analyser
sudo ln -s `pwd`/.config/composer/vendor/bin/composer-dependency-analyser /usr/local/bin/dependency
## dependency
## dependency --composer-json /path/to/composer.json
## rm -Rf /usr/local/bin/dependency
```

## Code Sniffer Fixer for PHP (and Vim)

[Versions](https://cs.symfony.com/)

```bash
# Check version
/usr/local/bin/php-cs-fixer --version

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
# Check version
/usr/local/bin/phpmd --version

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
sudo apt-get install --no-install-recommends -y apt-transport-https ca-certificates curl gnupg software-properties-common
curl -L https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/docker.gpg > /dev/null

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/trusted.gpg.d/docker.gpg
EOF

sudo apt-get install --no-install-recommends -y docker-ce
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
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*docker*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*docker*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*docker*.sources

## Docker Compose

[See](https://github.com/docker/compose/releases)

```bash
cd ~
sudo curl -L https://github.com/docker/compose/releases/download/v5.0.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/v2.40.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose-v2.40.3
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
sudo apt-get install --no-install-recommends -y mysql-client
## sudo apt-get remove mysql-client && sudo apt-get autoremove

# Debian
sudo apt-get install --no-install-recommends -y mariadb-client
## sudo apt-get remove mariadb-client && sudo apt-get autoremove
```
> Auth Secure: mysql_config_editor set --login-path=development --host=db --user=root --password

# SSH Keys

Clone SSH keys from Secrets or

```bash
ssh-keygen                 # Insert passphrase (Algo ...)
ls ~/.ssh
command cat ~/.ssh/id_rsa.pub      # Setup SSH Keys in Apps or VPS
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

grep "default-cache-ttl\|max-cache-ttl\|default-cache-ttl-ssh\|max-cache-ttl-ssh" ~/.gnupg/gpg-agent.conf
```

## Direnv

[See](https://github.com/direnv/direnv?tab=readme-ov-file)
[Lib](https://direnv.net/man/direnv-stdlib.1.html)
[Advanced](https://deepwiki.com/direnv/direnv/4-advanced-usage)

```bash
grep -F "direnv" ~/.zshrc

echo '
# Direnv hook
eval "$(direnv hook zsh)"' >> ~/.zshrc
```

## Global setup

```bash
rm -f ~/.envrc.global
ln -s `pwd`/direnv/.envrc.global ~/.envrc.global
```

## Enable specific setup

```bash
HTMLDIRS=(wordpress prestashop magento)

for DIR in $HTMLDIRS; do
    if [ ! -d /var/www/html/$DIR ]; then
        continue
    fi

    echo '# Load centralize settings

. ~/.envrc.global' > /var/www/html/$DIR/.envrc
done
```

# Postman

```bash
cd ~
curl -L "https://dl.pstmn.io/download/latest/linux_64" -o postman.tar.gz
sudo tar -xvf postman.tar.gz -C /opt && rm -Rf postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
## rm -Rf /usr/bin/postman
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
```

## Enchance Security

[See](https://support.mozilla.org/en-US/kb/linux-security-warning?as=u&utm_source=inproduct)

```bash
# Zen

echo "# This profile allows everything and only exists to give the
# application a name instead of having the label \"unconfined\"
abi <abi/4.0>,
include <tunables/global>
profile zen-local
/opt/zen/{zen,zen-bin,updater}
flags=(unconfined) {
	userns,
	# Site-specific additions and overrides. See local/README for details.
	include if exists <local/zen>
}" | sudo tee /etc/apparmor.d/zen-local

```
> about:config setting                         default     custom
> gfx.webrender.all                         -> false    -> true
> gfx.x11-egl.force-enabled                 -> false    -> true
> layers.acceleration.force-enabled         -> false    -> true
> security.dialog_enable_delay              -> 1000     -> 0

Better not change (UI)
> zen.downloads.download-animation          -> true     -> false
> zen.downloads.download-animation-duration -> 1000     -> 0

# Opera

[Versions](https://download3.operacdn.com/ftp/pub/opera/desktop/)

```bash
LATESTOPERA=`curl -s https://download3.operacdn.com/ftp/pub/opera/desktop/ | grepx -o ">.*<" | sed -e 's/[></]//g' | sort -n | tail -n1`
curl -L https://download3.operacdn.com/ftp/pub/opera/desktop/`printf "%s" $LATESTOPERA`/linux/opera-stable_`printf "%s" $LATESTOPERA`_amd64.deb -o opera.deb
sudo dpkg -i opera.deb && rm -f opera.deb
```
> Disable to use saU alias
>   sudo sed -i 's/^deb /###Disable deb /g' /etc/apt/sources.list.d/*opera*.list
> Update or Install new versions
>   sudo sed -i 's/^###Disabled deb /   deb /g' /etc/apt/sources.list.d/*opera*.list
>   sudo sed -i 's/^   deb /###Disabled deb /g' /etc/apt/sources.list.d/*opera*.list

# JetBrains Mono

[See](https://www.jetbrains.com/lp/mono/)
[See 2](https://github.com/JetBrains/JetBrainsMono)

```bash
ls -la /home/$USER/.local/share/fonts/fonts/ttf | grep Mono

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
grep "^export PATH" ~/.profile

command cat <<"EOF" >> ~/.profile

# Avoid duplicates in PATH env
export PATH=$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')
EOF

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

# Set defaults for ... browser

[See](https://unix.stackexchange.com/questions/584478/how-to-add-browser-to-update-alternatives#584506)

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/zen 100
sudo update-alternatives --install /usr/bin/gnome-www-browser gnome-www-browser /usr/bin/zen 100

sudo update-alternatives --set x-www-browser /usr/bin/zen
sudo update-alternatives --set gnome-www-browser /usr/bin/zen

sudo update-alternatives --config x-www-browser
sudo update-alternatives --config gnome-www-browser

## sudo update-alternatives --remove x-www-browser /usr/bin/zen
## sudo update-alternatives --remove gnome-www-browser /usr/bin/zen
```
> update-alternatives --display x-www-browser
> update-alternatives --display gnome-www-browser
> update-alternatives --get-selections
> update-alternatives --get-selections | grep browser

## That is ALL :D !

# Performance (Optionals)

# Fuzzy Finder (FZF)

[See](https://github.com/junegunn/fzf)

```bash
# After :PluInstall in Vim (Last version auto update by Vim)
sudo ln -s ~/.vim/plugged/fzf/bin/fzf /usr/bin/fzf

# or Debian 9+/Ubuntu 19.10+
# 2025-01-20: Debian APT keeps v0.46.0 (2024-01-23), older!
# sudo apt-get install --no-install-recommends -y fzf
```

# RigGrep for Vim search (Performance FZF and Terminal)

[See](https://github.com/BurntSushi/ripgrep)

```bash
# [L|X]Ubuntu 18.10+ | Rg v11.0.2+
sudo apt-get install --no-install-recommends -y ripgrep
## sudo apt-get remove ripgrep && sudo apt-get autoremove

# [L|X]Ubuntu < 18.10 | Rg v0.9.0-3
echo "\n" | sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get install --no-install-recommends -y ripgrep
## sudo apt-get remove ripgrep && echo "\n" | sudo add-apt-repository --remove ppa:x4121/ripgrep
```

# Bat no Cat (Preview FZF and Terminal)

[See](https://github.com/sharkdp/bat)

```bash
# [L|X]Ubuntu 18.10+ | bat v0.22.1
sudo apt-get install --no-install-recommends -y bat
sudo ln -s `which batcat` /usr/bin/bat

# [L|X]Ubuntu < 18.10 | bat v0.9.0-3
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
export MANPAGER="sh -c '"'"'col -bx | bat -l man -p'"'"'"
export MANROFFOPT="-c"
export BAT_THEME="gruvbox-dark"' >> ~/.profile

grep "MANPAGER=\|MANROFFOPT=\|BAT_THEME=" ~/.profile
```

## Best less

```bash
grep "LESSOPEN=" ~/.profile

echo '
# @thanks https://www.jwillikers.com/pagers-and-syntax-highlighting
export LESSOPEN="| bat --color always %s"' >> ~/.profile

grep "LESSOPEN=" ~/.profile
```

# Vifm (Terminal File Manager with Vim Style)

[See](https://wiki.vifm.info/index.php?title=Manual)
[Previewer](https://github.com/ueber-devel/ueberzug/)

```bash
sudo apt-get install --no-install-recommends -y vifm
## sudo apt-get remove vifm && sudo apt-get autoremove

mkdir -p ~/.config/vifm
mkdir -p ~/.config/vifm/scripts
ln -s `pwd`/vifm/vifmrc ~/.config/vifm/vifmrc
ln -s `pwd`/vifm/gruvbox-dark ~/.config/vifm/colors/gruvbox-dark
ln -s `pwd`/vifm/gruvbox-light ~/.config/vifm/colors/gruvbox-light

# NOT works in rxvt: ueberzug
# ln -s `pwd`/vifm/previewx ~/.config/vifm/scripts/previewx
# sudo ln -s `pwd`/vifm/vifmrun /usr/bin/vifmrun
# sudo ln -s `pwd`/vifm/previewx /usr/local/bin/previewx
```

# Nsxiv (See Images with Vim Style)

[Viewer](https://github.com/nsxiv/nsxiv)
[Configuration](https://nsxiv.codeberg.page/man/#CONFIGURATION)

```bash
sudo apt-get install --no-install-recommends -y nsxiv
## sudo apt-get remove nsxiv && sudo apt-get autoremove

mkdir -p ~/.config/nsxiv
mkdir -p ~/.config/nsxiv/exec
ln -s `pwd`/nsxiv/key-handler ~/.config/nsxiv/exec/key-handler
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

# PHPUnit Failed

```bash
sudo apt-get install --no-install-recommends -y xmlstarlet
composer global require chrisdicarlo/phpunit-failed-runner --dev
## composer global remove chrisdicarlo/phpunit-failed-runner --dev
```

# Infection AST

[See](https://github.com/infection/infection/releases)

```bash
sudo curl -L https://github.com/infection/infection/releases/download/0.32.3/infection.phar -o /usr/local/bin/infection
sudo chmod +x /usr/local/bin/infection
## Command:
## infection -j$(nproc)
## infection -j$(nproc) [--filter=file.php]
## sudo rm /usr/local/bin/infection
```

# PHPLOC (Lines Of Code - lines-of-code)

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
sudo curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v3.0.0rc8/phpmetrics.phar -o /usr/local/bin/phpmetrics
sudo chmod +x /usr/local/bin/phpmetrics
## Command:
## phpmetrics --excluded-dirs vendor --report-html=./tests/coverage/phpmetrics .
## sudo rm /usr/local/bin/phpmetrics
```

# Xdebug (PHP Debugger)

```bash
sudo apt-get install --no-install-recommends -y php-xdebug
# sudo apt-get install --no-install-recommends -y php7.4-xdebug
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
sudo apt-get install --no-install-recommends -y filezilla
```

## OBS - Open Broadcasting Software

```bash
sudo apt-get install --no-install-recommends -y ffmpeg obs-studio
mkdir $HOME/obs
## sudo apt-get remove obs-studio ffmpeg && sudo apt-get autoremove && echo "\n" | sudo add-apt-repository --remove ppa:obsproject/obs-studio

# Oldest
sudo add-apt-repository ppa:obsproject/obs-studio
```

[See](https://www.thregr.org/wavexx/software/screenkey/)

```bash
sudo apt-get install --no-install-recommends -y screenkey
## sudo apt-get remove screenkey && sudo apt-get autoremove
```

## Screenshot++

[See](https://flameshot.org/#features)

```bash
sudo apt-get install --no-install-recommends -y flameshot

rm ~/.config/flameshot/flameshot.ini
ln -s `pwd`/flameshot/flameshot.ini ~/.config/flameshot/flameshot.ini
```

## Dashboard++

[See](https://github.com/bk138/gromit-mpx?tab=readme-ov-file)

```bash
sudo apt-get install --no-install-recommends -y gromit-mpx

rm ~/.config/gromit-mpx.ini
ln -s `pwd`/gromit/gromit-mpx.ini ~/.config/gromit-mpx.ini

rm ~/.config/gromit-mpx.cfg
ln -s `pwd`/gromit/gromit-mpx.cfg ~/.config/gromit-mpx.cfg
```
> F9:           toggle painting
> SHIFT-F9:     clear screen
> CTRL-F9:      toggle visibility
> ALT-F9:       quit Gromit-MPX
> F8:           undo last stroke
> SHIFT-F8:     redo last undone stroke

## Google Chrome

```bash
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -L https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/google-chrome.gpg > /dev/null

sudo apt-get update
sudo apt-get install --no-install-recommends -y google-chrome-stable
## sudo apt-get remove google-chrome-stable && sudo apt-get autoremove
```
> Disable to use saU alias
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*chrome*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*chrome*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*chrome*.sources

## Brave (Anime ;P)

```bash
curl -fsS https://dl.brave.com/install.sh | sh
## sudo apt-get remove brave-browser && sudo apt-get autoremove
```
> Disable to use saU alias
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*brave*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*brave*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*brave*.sources

## Microsoft Edge (for Teams :()

```bash
curl -L https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft-edge.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'

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

> Disable to use saU alias
>   sudo sed -i 's/^deb /###Disable deb /g' /etc/apt/sources.list.d/*microsoft-edge*.list
> Update or Install new versions
>   sudo sed -i 's/^###Disabled deb /   deb /g' /etc/apt/sources.list.d/*microsoft-edge*.list
>   sudo sed -i 's/^   deb /###Disabled deb /g' /etc/apt/sources.list.d/*microsoft-edge*.list

## GNUPG (Legacy)

```bash
sudo apt-get install --no-install-recommends -y gnupg1
```

## Onefetch

Not snap please
[See](https://github.com/o2sh/onefetch/wiki/getting-started)

```bash
echo "\n" | sudo add-apt-repository ppa:o2sh/onefetch
# @see /etc/apt/sources.list.d/o2sh-ubuntu-onefetch-plucky.sources :: plucky -> noble
sudo sed -i 's/^Suites: plucky/Suites: noble/g' /etc/apt/sources.list.d/*onefetch*.sources

sudo apt-get update
sudo apt-get install --no-install-recommends -y onefetch
# onefetch /path/git
## sudo apt-get remove onefetch
## echo "\n" | sudo add-apt-repository --remove ppa:o2sh/onefetch
```
> Disable to use saU alias
>   sudo sed -i '/^Types: deb/a Enabled: no' /etc/apt/sources.list.d/*onefetch*.sources
> Update or Install new versions
>   sudo sed -i 's/^Enabled: no/Enabled: yes/g' /etc/apt/sources.list.d/*onefetch*.sources
>   sudo sed -i 's/^Enabled: yes/Enabled: no/g' /etc/apt/sources.list.d/*onefetch*.sources

# # Redshif (for my eyes please)
#
# [See](https://github.com/jonls/redshift)
#
# ```bash
# sudo apt-get install --no-install-recommends -y redshift
# mkdir -p ~/.config/redshift
# ln -s `pwd`/redshift/redshift.conf ~/.config/redshift/redshift.conf
# # sudo apt-get remove redshift && sudo apt-get autoremove
# ```

# # Picom (alternative for xcompmgr)
#
# [See](https://github.com/yshui/picom)
#
# ```bash
# sudo apt-get install --no-install-recommends -y picom
# mkdir -p ~/.config/picom
# ln -s `pwd`/picom/picom.conf ~/.config/picom/picom.conf
# # sudo apt-get remove picom && sudo apt-get autoremove
# ```
# > Slower and more customizable, In fact: I dont use it

# ## Auto-cpufreq (well: bluetooth fails)
#
# [See](https://github.com/AdnanHodzic/auto-cpufreq?tab=readme-ov-file#auto-cpufreq-installer)
#
# ```bash
# git clone --depth=1 https://github.com/AdnanHodzic/auto-cpufreq.git
# cd auto-cpufreq
# sudo ./auto-cpufreq-installer
# sudo auto-cpufreq --install
# auto-cpufreq --stats
# sudo systemctl enable auto-cpufreq
# sudo systemctl status auto-cpufreq
#
# sudo auto-cpufreq --update=/var/www/html/AdnanHodzic/auto-cpufreq
# ## sudo systemctl disable auto-cpufreq
# ## sudo auto-cpufreq --remove
# ```

## Virtual Machine

### Virt-Manager

[See](https://www.youtube.com/watch?v=p1d_b_91YlU)
[See 2](https://www.youtube.com/watch?v=9FBhcOnCxM8)

```bash
sudo apt-get update
sudo apt-get install --no-install-recommends -y qemu qemu-kvm libvirt-bin bridge-utils virt-manager
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
# Enable user to use libvirt
sudo usermod -G libvirt -a $USER
# Enable UEFI feature
sudo apt-get install --no-install-recommends -y ovmf
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
sudo apt-get install --no-install-recommends -y virtualbox
## sudo apt-get remove virtualbox && sudo apt-get autoremove

# v6.1
sudo apt-get update
sudo apt-get install --no-install-recommends -y libqt5opengl5
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

In olders Ubuntu versions <= 24.10

```bash
sudo snap list

for pkg in $(snap list | awk '{print $1}'); do
    sudo snap remove "$pkg"
done

sudo apt-get remove snapd
```

## Remove Gnome

```bash
sudo apt-get remove -y --purge gnome\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

## Remove LibreOffice

```bash
sudo apt-get remove -y --purge libreoffice\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

## Remove Rhythmbox

```bash
sudo apt-get remove -y --purge rhythmbox\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# Check Apps and Services

## StartUp Aplications

```bash
ls -la /etc/init.d
```

## Systemd Services

[See](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)

```bash
# Blame
systemd-analyze blame

# Active (booted on boot)
systemctl list-units --type=service --state=active

# Running (memory consume)
systemctl list-units --type=service --state=running
```

## Mitigations

```bash
grepx . /sys/devices/system/cpu/vulnerabilities/*
```

# SetUp new PROMPT

In ~/.zshrc at ends add:

```bash
command cat <<"EOF" >> ~/.zshrc

# Custom from this:
#   ➜  services git:(master) ✗
# to this (refresh time each second):
#   ➜ services master ✗                           00:00
# @see /home/freddie/.oh-my-zsh/themes/robbyrussell.zsh-theme:1
# %D     The date in yy-mm-dd format.
# %T     Current time of day, in 24-hour format.
# %t %@  Current time of day, in 12-hour, am/pm format.
# %*     Current time of day in 24-hour format, with seconds.
# %w     The date in day-dd format.
# %W     The date in mm/dd/yy format.
# %D{strftime-format}: https://man7.org/linux/man-pages/man3/strftime.3.html
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# @see https://superuser.com/a/1742815
TMOUT=60
RPROMPT="%{$fg_bold[blue]%}%D{%H:%M}% %{$reset_color%}"
TRAPALRM() {
    zle reset-prompt
}
EOF
```

# Clean installation

```bash
sudo apt-get autoremove -y && sudo apt-get autoclean -y
```

# Summary

[Versus](https://www.cpu-monkey.com/en/compare_cpu-intel_core_i7_1260p-vs-intel_core_ultra_7_155u)

## Commands

:Rj_wv$P/\v^\w+

```bash
lsb_release -d | grep -e "Description:" | awk '{print $2" "$3" "$4}'
# Ubuntu 25.10
uname -r
# 6.17.0-8-generic
command cat /proc/cpuinfo | grep 'name'| uniq | cut -d ':' -f 2
# Intel(R) Core(TM) Ultra 7 155U
nproc --all
# 14
command cat /proc/meminfo | grep 'MemTotal'| cut -d ':' -f 2
# 31824616 kB
ldd --version | grep -e "^ldd" | awk '{print $5}'
# 2.42
gcc --version | grep -e "^gcc" | awk '{print $4}'
# 15.2.0
openssl version | awk '{print $2}'
# 1.1.1w
# 3.3.1
i3 --version | awk '{print $3}'
# 4.24
i3status --version | grep -e "i3status" | awk '{print $2}'
# 2.15-non-git
greenclip --version | head -n 1 | awk '{print $2}'
# v4.2
# konsole --version | awk '{print $2}'
# # 23.08.1
urxvt -help 2>&1 | head -n 1 | awk '{print $3}'
# v9.31
bash --version | grep -e "bash" | awk '{print $4}'
# 5.2.37(1)-release
zsh --version | awk '{print $2}'
# 5.9
# https://github.com/vim/vim/releases/tag/v9.1.#
echo `vim --version | grep -e "^VIM " | awk '{print $5}'`.`vim --version | grep -e "^Included "`
# 9.1.Included patches: 1-948, 950-967
echo `nvim --version | grep -e "^NVIM " | awk '{print $2}'`-`nvim --version | grep -e "^LuaJIT " | awk '{print $1"-"$2}'`
# v0.12.0-dev-LuaJIT-2.1.1737090214
neovide --version | awk '{print $2}'
# 0.15.2
vifm --version | grep -e "^Version" | awk '{print $2}'
# 0.14
$VIEWER -v | head -n 1 | awk '{print $2}'
# 32
curl --version | grep -e "^curl " | awk '{print $2}'
# 8.14.1
git --version | awk '{print $3}'
# 2.51.0
git lfs version
# git-lfs/3.6.1 (GitHub; linux amd64; go 1.23.5)
gh --version | head -n 1 | awk '{print $3}'
# 2.86.0
docker --version | awk '{print $3}' | sed 's/,//g'
# 28.2.1
docker-compose --version | awk '{print $4}'
# v5.0.2
feh --version | grep version | awk '{print $3}'
# 3.10.3
maim --version | awk '{print $1}'
# v5.8.0
unzip -v | grep "^UnZip.*\.$" | awk '{print $2}'
# 6.00
jq --version | sed 's/jq-//g'
# 1.8.1
tree --version | awk '{print $2}'
# v2.2.1
nmap --version | grep "^Nmap" | awk '{print $3}'
# 7.95
htop --version | grep "^htop" | awk '{print $2}'
# 3.4.1
man xcompmgr | grep "^X Version" | awk '{print $5}'
# 1.1.8
batcat --version | awk '{print $2}'
# 0.25.0
rg --version | grep -e "^ripgrep" | awk '{print $2}'
# 14.1.1
php --version | grep -e "^PHP" | awk '{print $2}'
# 8.4.17
composer --version 2> /dev/null | head -1 | awk '{print $3}'
# 2.9.4
git -C ~/.nvm describe --tag
# v0.40.3
npm --version
# 11.4.1
node --version
# v24.0.1
mysql --version | awk '{print $3}'
# 8.4.7-0ubuntu0.25.10.3
# stoken --version | head -1 | awk '{print $2}'
# 0.92
python3 --version | awk '{print $2}'
# 3.13.7
ruby --version | awk '{print $2}'
# 3.3.8
rustc --version | awk '{print $2}'
# 1.93.0
go version | awk '{print $3}' | sed 's/go//g'
# 1.25.6
ctags --version | head -1 | awk '{print $3}' | sed 's/,//g'
# 6.2.0(2046889)
gpg1 --version | head -1 | awk '{print $3}'
# 1.4.23
ftp about:version | head -1 | awk '{print $3}'
# 20230507
# ncftpput --version | head -1 | awk '{print $2}'
# 3.2.6
pipewire --version | head -2 | awk '{print $4}'
# 1.4.7
NetworkManager --version
# 1.52.0
bluemoon --version
# 5.83
zen --version | awk '{print $3}'
# 1.19t
filezilla --version | tail -1 | awk '{print $2}' | sed 's/,//g'
# 3.69.3
obs --version |  awk '{print $4}'
# 30.2.3.1-3
screenkey --version
# 1.5
flameshot --version | head -1 | awk '{print $2}'
# v12.1.0
gromit-mpx --version 2> /dev/null | tail -1 | awk '{print $2}'
# 1.7.0
direnv --version
# 2.32.1
# Unstable CLI: apt-get list --installed | wc --lines
# apt show gnome
# dpkg --list | wc --lines
# dpkg --get-selections | grep -v deinstall > ~/packages.log
dpkg --get-selections | grep -v deinstall | wc --lines
# 2121
for app in /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop; do app="${app##/*/}"; echo "${app::-8}"; done | wc --lines
# 52
apt-mark showmanual | wc --lines
# 408
```
