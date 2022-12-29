Install Software in Debian|[L|X]Ubuntu OS
___

[Comparation SO](https://wiki.archlinux.org/title/Arch_compared_to_other_distributions)

# Utils

```bash
sudo apt-get install -y software-properties-common
## sudo apt-get remove software-properties-common && sudo apt-get autoremove
```
> By example: add-apt-repository

# Vim Latest :D, of course!

```bash
echo "\n" | sudo add-apt-repository ppa:jonathonf/vim
## echo "\n" | sudo add-apt-repository --remove ppa:jonathonf/vim
```

# Updated repositories

```bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y vim konsole
## sudo apt-get remove vim konsole && sudo apt-get autoremove
```

## Vim Configuration

```bash
# Set as default editor
sudo update-alternatives --config editor

ln -s `pwd`/.vimrc ~/.vimrc
```

## Konsole Profile

```bash
rm -f ~/.local/share/konsole/*.profile
ln -s `pwd`/konsole.profile ~/.local/share/konsole/konsole.profile
rm -f ~/.local/share/konsole/*.colorscheme
ln -s `pwd`/Linux.colorscheme ~/.local/share/konsole/Linux.colorscheme
```

# Performance, not use swap while RAM < 90% used

[Tips 1](https://www.linuxbabe.com/ubuntu/4-tips-speed-up-ubuntu-16-04)

[Tips 2](https://github.com/akalongman/ubuntu-configuration)

```bash
echo '# Overwrite default: 60
vm.swappiness=10' | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p
```

# Change default User Max Watches

```bash
echo '# Overwrite default: 8192 ~8M to ~540M
fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p
```

# Change default time GRUB to 2

```bash
sudo cp -p /etc/default/grub /etc/default/grub.backup
```

```bash
sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub
```

# Change graphical to text GRUB

```bash
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT/#GRUB_CMDLINE_LINUX_DEFAULT/g' /etc/default/grub
sudo sed -i 's/GRUB_CMDLINE_LINUX="*"/GRUB_CMDLINE_LINUX="text"/g' /etc/default/grub
sudo sed -i 's/#GRUB_TERMINAL=console/GRUB_TERMINAL=console/g' /etc/default/grub
sudo update-grub

sudo systemctl set-default multi-user.target
```

# Turn-off hibernation

```bash
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sudo sed -i 's/#LidSwitchIgnoreInhibited=yes/LidSwitchIgnoreInhibited=no/g' /etc/systemd/logind.conf
sudo systemctl restart systemd-logind
```

# English Language for All

```bash
cat /etc/default/locale
echo "\n" | sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en
echo 'Acquire::Languages "none";' | sudo tee -a /etc/apt/apt.conf.d/00aptitude
```

# Auto-update (on servers)

```bash
sudo apt-get install -y unattended-upgrades update-notifier-common
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages "[true|false]*";/Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Dependencies "[true|false]*";/Unattended-Upgrade::Remove-Unused-Dependencies "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/g' /etc/apt/apt.conf.d/50unattended-upgrades
```

# Disabled IPP Service: 631 (Internet Printer Protocol)

```bash
sudo service cups stop && sudo systemctl disable cups
```

# Main and extra utils

```bash
sudo apt-get install -y unzip curl tree nmap htop i3 xcompmgr feh pavucontrol maim toilet figlet
## sudo apt-get remove unzip curl tree nmap htop i3 xcompmgr feh pavucontrol maim toilet figlet && sudo apt-get autoremove
```

# i3

```bash
mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3/config
ln -s `pwd`/i3/status.conf ~/.config/i3/status.conf
ln -s `pwd`/i3/battery ~/.config/i3/battery-popup
```
> On VM:
> cp -p /var/www/html/freddiegar/services/i3/config ~/.config/i3/config
> Change $mod Mod4 -> Mod1
> sed -i 's/$mod Mod4/$mod Mod1/g' ~/.config/i3/config
> Change $meta Mod1 -> Mod4
> sed -i 's/$meta Mod1/$meta Mod4/g' ~/.config/i3/config

## Set i3 as WM

```bash
sudo update-alternatives --config x-session-manager
# if not is available i3:
# sudo update-alternatives --install /usr/bin/x-session-manager x-session-manager /usr/bin/i3 60
```

## Start i3 after StartX

[See](https://www.reddit.com/r/i3wm/comments/72oiwl/how_do_i_set_environment_variables_so_that_they/)

```bash
echo 'exec i3' >> ~/.xinitrc
```

# Vim Plugins

```bash
# Install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Open Vim and run
:PlugInstall

# Update all plugins
:PlugUpdate

# Clean plugins
:PlugClean

# Upgrade plugin manager
:PlugUpgrade
```
> See .vimrc file in root folder

## Vim Copy/Paste (Share SO)

```bash
# Check: +xterm_clipboard
vim --version | grep xterm
# if -xterm_clipboard then
# sudo apt-get install -y vim-gnome
# Check again
```

## Vim C Development

### LSP

[See](https://llvm.org/docs/GettingStarted.html#overview)
[See 2](https://www.jianshu.com/p/3c7eae5c0c68)

```bash
cd ~
curl -SL http://releases.llvm.org/9.0.0/clang%2bllvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJC .
mv clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_9.0.0
sudo mv clang_9.0.0 /usr/local
```

### C Tags

echo "--recurse=yes
--tag-relative=yes
--exclude=.git
--exclude=.idea
--exclude=.vscode
--exclude=composer.phar
--exclude=*.js
--exclude=*.vim
--langmap=php:.engine.inc.module.theme.install.php
--regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i
--PHP-kinds=+cfi-vj
" > ~/.ctags

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
ln -s `pwd`/UltiSnips ~/.vim/UltiSnips
```

## Vim in PHPStorm

```bash
ln -s `pwd`/.ideavimrc ~/.ideavimrc
```

# GIT

```bash
sudo apt-get install -y git-core
## sudo apt-get remove git-core && sudo apt-get autoremove
```
> https://www.howtogeek.com/devops/how-to-completely-reset-a-git-repository-including-untracked-files/

## GIT Configuration

[See](http://git-scm.com/docs/git-mergetool)

```bash
ln -s `pwd`/.gitconfig ~/.gitconfig
```

## GIT Flow

```bash
sudo apt-get install git-flow
## sudo apt-get remove git-flow && sudo apt-get autoremove
```

## GIT Summary

```bash
cd ~
sudo apt-get install -y gawk
sudo curl -L https://raw.githubusercontent.com/albenik/git-summary/master/git-summary -o /usr/local/bin/git-summary
sudo chmod +x /usr/local/bin/git-summary
## sudo apt-get remove gawk && sudo rm /usr/local/bin/git-summary && sudo apt-get autoremove
```

## Wallpapers in i3

```bash
git clone --depth=1 git@github.com:freddiegar/wallpapers.git

ln -s /var/www/html/freddiegar/wallpapers ~/BG
```

# Zsh

[See](https://towardsdatascience.com/comparing-sh-bash-ksh-and-zsh-speed-82a72bbc20ed)
[See 2](https://google.github.io/styleguide/shellguide.html)

```bash
sudo apt-get install -y zsh
# As User NOT root
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo $SHELL
# Change shell if not is zsh
chsh -s `which zsh`

cp -p ~/.zshrc ~/.zshrc.original
sed -i 's/# CASE_SENSITIVE="true"/CASE_SENSITIVE="true"/g' ~/.zshrc
sed -i 's/# HIST_STAMPS="mm\/dd\/yyyy"/HIST_STAMPS="yyyy-mm-dd"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=()/g' ~/.zshrc

# In Ubuntu
gnome-session-quit
# In Lubuntu
lxqt-leave
## sudo apt-get remove zsh && sudo apt-get autoremove
```

## Enable Vi Mode in Zsh

[See](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh)
[See 2](https://github.com/tpope/tpope/blob/master/.zshrc)
[See 3](https://zsh.sourceforge.io/Guide/zshguide04.html)
[See 4](https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#Menu-selection)
[See 5](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins)

```bash
echo "
export EDITOR=vim

# Vi mode
bindkey -v

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Normal mode
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^R' history-incremental-search-backward

# Insert mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-word
bindkey -M viins '^F' forward-word
bindkey -M viins '^E' end-of-line
bindkey -M viins 'jk' vi-cmd-mode

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

# Aliases

```bash
ln -s `pwd`/.bash_aliases ~/.bash_aliases

## Enable alias in Zsh
echo '
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.zshrc
```

## Enable alias in Vim

```bash
echo '
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.zshenv
```

# PHP 8.1

```bash
echo "\n" | sudo add-apt-repository ppa:ondrej/php # Only Ubuntu
sudo apt-get install -y php8.1-cli
sudo apt-get install -y php8.1-dev
sudo apt-get install -y php8.1-mbstring
sudo apt-get install -y php8.1-mysql
sudo apt-get install -y php8.1-curl
sudo apt-get install -y php8.1-zip
sudo apt-get install -y php8.1-soap
sudo apt-get install -y php8.1-gd
sudo apt-get install -y php8.1-sqlite3
sudo apt-get install -y php8.1-intl
sudo apt-get install -y php8.1-memcached
sudo apt-get install -y php8.1-redis
sudo apt-get install -y php8.1-bcmath
sudo apt-get install -y php8.1-gmp
## sudo apt-get remove php8.1\* && sudo apt-get autoremove
## echo "\n" | sudo add-apt-repository --remove ppa:ondrej/php # Only Ubuntu
```

## Composer for PHP

```bash
cd ~
curl -L https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -Rf composer-setup.php
## Update
## composer self-update
## rm -Rf /usr/local/bin/composer
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

# Mess Detector for PHP (and Vim)

```bash
cd ~
sudo curl -L https://github.com/phpmd/phpmd/releases/download/2.12.0/phpmd.phar -o /usr/local/bin/phpmd
sudo chmod +x /usr/local/bin/phpmd
## Command:
## phpmd source/code format ruleset
## phpmd src ansi cleancode,design,naming,unusedcode
## phpmd src ansi cleancode,codesize,controversial,design,naming,unusedcode
## sudo rm /usr/local/bin/phpmd
```

# Docker (Container)

[See 1](https://docs.docker.com/install/linux/docker-ce/ubuntu)

[See 2](https://docs.docker.com/install/linux/linux-postinstall/)

## [L|X]Ubuntu 18.*, 19.*, 20.* Debian 10

```bash
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg software-properties-common
echo "\n" | curl -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/`lsb_release -is | awk '{print tolower($0)}'` `lsb_release -cs` stable"
sudo apt-get install -y docker-ce
sudo usermod -aG docker $(whoami)

# In Ubuntu
gnome-session-quit
# In Lubuntu
lxqt-leave
## sudo apt-get remove docker-ce && sudo apt-get autoremove
```

## Docker Compose

```bash
cd ~
sudo curl -L https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## sudo rm /usr/local/bin/docker-compose
```

## Docker Network

```bash
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
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
echo '
if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        eval `ssh-agent | tee ~/.ssh/agent.env`
    fi
else
    eval `ssh-agent | tee ~/.ssh/agent.env`
fi' >> ~/.zshrc
```

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

## Export Public GPG Key (for GitHub example)

[See](https://github.com/settings/keys)

```bash
gpg --armor --export [ID]

# Use sec short id: C292DDB5, in this example
gpg --armor --export C292DDB5 | xclip -selection clipboard
```

## GPG in Terminal (Use between shells instances)

```bash
echo '
export GPG_TTY=$(tty)' >> ~/.zshrc
```

## GPG TTL (in seconds)

```bash
echo 'default-cache-ttl 86400
max-cache-ttl 864000
default-cache-ttl-ssh 86400
max-cache-ttl-ssh 864000' > ~/.gnupg/gpg-agent.conf
```

# Postman

```bash
cd ~
sudo snap install postman
```

# Firefox (Dont use snap for this, security risk)

```bash
sudo apt-get remove firefox && sudo apt-get autoremove
curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" -o firefox.tar.bz2
sudo tar -xvjf firefox.tar.bz2 -C /opt && rm -Rf firefox.tar.bz2
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
## rm -Rf /opt/firefox
```

## Firefox Developer Edition Shorcut

```bash
echo '[Desktop Entry]
Version=1.0
Name=Firefox Web Browser Developer Edition
Comment=Browse the WWW
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web
Exec=/usr/bin/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=new-window;new-private-window;
StartupWMClass=Firefox Developer Edition

[Desktop Action new-window]
Name=Open a New Window
Exec=/usr/bin/firefox -new-window

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/usr/bin/firefox -private-window' > ~/.local/share/applications/firefox.desktop
```

## Enable in i3 as default browser

```bash
# see ~/.config/mimeapps.list and replace using firefox.desktop if it is necesary
sudo ln -s ~/.local/share/applications/firefox.desktop /usr/share/applications/firefox.desktop
```

# Node (and Vim LSP)

```bash
cd ~
sudo apt-get install -y build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.38.0/install.sh | bash

echo '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | sudo tee -a ~/.zshrc

# Close Terminal to load changes
# Show version available
nvm ls-remote
nvm install v16.14.0
# nvm alias default v16.14.0
# nvm current
## Enabled to all users in [L|X]Ubuntu
# n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

## Install package: npm install express
## nvm deactivate && nvm uninstall v16.13.0

## Install npm
npm install -g npm
```

# Profile

```bash
echo '
export EDITOR=vim
export VISUAL=vim
export BROWSER=/usr/bin/firefox' >> ~/.profile
```

# Font Fira Code

[See](https://dev.to/josuerodriguez98/installing-firacode-on-windows-and-ubuntu-1fn1)

```bash
# [L|X]Ubuntu
sudo apt-get install -y fonts-firacode
## sudo apt-get remove fonts-firacode && sudo apt-get autoremove
```

# Clean installation
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove

## That is ALL :D !

# Performance (Optionals)

# Fuzzy Finder (FZF)

[See](https://github.com/junegunn/fzf)

```bash
# After :PluInstall in Vim (Last version auto update by Vim)
sudo ln -s ~/.vim/plugged/fzf/bin/fzf /usr/bin/fzf
# or Debian 9+/Ubuntu 19.10+
sudo apt-get install fzf
```

# RigGrep for Vim search (Performance FZF and Terminal)

[See](https://github.com/BurntSushi/ripgrep)

```bash
# [L|X]Ubuntu < 18.10 | Rg v0.9.0-3
echo "\n" | sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get install ripgrep
## sudo apt-get remove ripgrep && echo "\n" | sudo add-apt-repository --remove ppa:x4121/ripgrep

# [L|X]Ubuntu 18.10+ | Rg v11.0.2+
sudo apt-get install ripgrep
## sudo apt-get remove ripgrep && sudo apt-get autoremove
```

# Bat no Cat (Preview FZF and Terminal)

[See](https://github.com/sharkdp/bat)

```bash
cd ~
sudo curl -L https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb -o bat.deb
sudo dpkg -i bat.deb && rm -f bat.deb
## Command:
## bat file.php
## sudo apt-get remove bat && sudo apt-get autoremove
```

# Vifm (Terminal File Manager with Vim Style)

[See](https://wiki.vifm.info/index.php?title=Manual)

```bash
cd ~
sudo apt-get install vifm
## sudo apt-get remove vifm && sudo apt-get autoremove
```

# Coding (Optionals)

# Rector

[See](https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md)

```bash
cd ~
composer global require rector/rector --dev
sudo ln -s ~/.composer/vendor/bin/rector /usr/local/bin/phprector
## Command
## phprector -c /var/www/html/freddiegar/services/rector.php process src
## phprector -c /var/www/html/freddiegar/services/rector.php -n process src tests
## phprector -c /var/www/html/freddiegar/services/rector.php --no-diffs process src tests
## composer global remove rector/rector
```

# Infection AST

```bash
cd ~
sudo curl -L https://github.com/infection/infection/releases/download/0.25.6/infection.phar -o /usr/local/bin/infection
sudo chmod +x /usr/local/bin/infection
## Command:
## infection -j$(nproc) [--filter=file.php]
## sudo rm /usr/local/bin/infection
```

# PHPLOC (Lines Of Code)

```bash
cd ~
sudo curl -L https://phar.phpunit.de/phploc.phar -o /usr/local/bin/phploc
sudo chmod +x /usr/local/bin/phploc
## Command:
## phploc -v --exclude=vendor --ansi .
## sudo rm /usr/local/bin/phploc
```

# PHPCPD (Copy/Paste Dectector)

```bash
cd ~
sudo curl -L https://phar.phpunit.de/phpcpd.phar -o /usr/local/bin/phpcpd
sudo chmod +x /usr/local/bin/phpcpd
## Command:
## phpcpd -vvv --exclude=vendor --ansi --progress .
## sudo rm /usr/local/bin/phpcpd
```

# PHPMetrics

```bash
cd ~
sudo curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v2.8.1/phpmetrics.phar -o /usr/local/bin/phpmetrics
sudo chmod +x /usr/local/bin/phpmetrics
## Command:
## phpmetrics --excluded-dirs vendor --report-html=./tests/coverage/phpmetrics .
## sudo rm /usr/local/bin/phpmetrics
```

# Xdebug (PHP Debugger)

```bash
sudo pecl install -f xdebug-2.9.8

# Xdebug 2
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
zend_extension=/usr/lib/php/20190902/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini

sudo phpenmod xdebug
```

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
echo "#! /bin/sh

f=`echo $1 | cut -d @ -f 1 | sed 's/xdebug:\/\///'`
l=`echo $1 | cut -d @ -f 2`
vim --remote-tab +$l $f
" > ~/bin/ff-xdebug.sh

# Permissions
sudo chmod +x ~/bin/ff-xdebug.sh
```

## Throuble

Maybe need run as `sudo` user! or:

### No releases available for package "pecl.php.net/package"
### Error getting channel info from pear.php.net: Connection to `ssl://pear.php.net:443' failed

```bash
# Update channel
sudo pecl channel-update pecl.php.net

# Update certificates, use default_cert_file path
php -r "print_r(openssl_get_cert_locations());"
sudo curl -fLo /usr/local/ssl/cert.pem http://curl.haxx.se/ca/cacert.pem
```

# Extra (Optionals)

# VSCode (Dont use snap for this, security risk)

```bash
# VS Code
cd ~
curl -L "https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/code_1.65.2-1646927742_amd64.deb" -o vscode.deb
sudo dpkg -i vscode.deb
rm -f vscode.deb
## sudo apt-get remove code && sudo apt-get autoremove
```

## Sublime Text

```bash
cd ~
curl -L https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
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
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get install -y ffmpeg obs-studio
## sudo apt-get remove obs-studio ffmpeg && sudo apt-get autoremove && echo "\n" | sudo add-apt-repository --remove ppa:obsproject/obs-studio
```

## Screen Recording

```bash
sudo apt-get update
sudo apt-get install -y kazam
## sudo apt-get remove kazam && sudo apt-get autoremove
```

## ScreenKey -> only X11

```bash
sudo apt-get update
sudo apt-get install -y screenkey
## sudo apt-get remove screenkey && sudo apt-get autoremove
```

## Ubuntu: CPU Usage Bar

```bash
sudo apt-get update
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

## Google Chrome

```bash
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -L https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y google-chrome-stable
## sudo apt-get remove google-chrome-stable && sudo apt-get autoremove
```

## Virtual Machine

### Virt-Manager

[See](https://www.youtube.com/watch?v=p1d_b_91YlU)
[See 2](https://www.youtube.com/watch?v=9FBhcOnCxM8)

```bash
cd ~
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
cd ~
sudo apt-get update
sudo apt-get install virtualbox
## sudo apt-get remove virtualbox && sudo apt-get autoremove

# v6.1
cd ~
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

echo '#!/bin/bash

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

## Vagrant (VM)

```bash
sudo apt-get install -y vagrant
## sudo apt-get remove vagrant && sudo apt-get autoremove
```

## Remove LibreOffice

```bash
sudo apt-get remove -y --purge libreoffice\* && sudo apt-get clean -y && sudo apt-get autoremove -y
```

# Clean installation

```bash
sudo apt-get autoremove -y && sudo apt-get autoclean -y
```

# Summary

date            : 2022-07-28
so              : Ubuntu 18.04.5 LTS
kernel          : 5.4.0-122-generic
gcc             : 7.5.0
ssl             : 1.1.1k
i3              : 4.14.1
konsole         : 17.12.3
bash            : 4.4.20(1)-release
zsh             : 5.4.2
vim             : 8.2.1-4929
docker-compose  : v2.7.0
curl            : 7.58.0
git             : 2.17.1
docker          : 20.10.17
feh             : 2.23.2
maim            : v5.4.68
bat             : 0.19.0
rg              : 0.9.0

> Ubuntu 22.04: https://discourse.ubuntu.com/t/jammy-jellyfish-release-notes/24668

## Commands

lsb_release -d | grep -e "Description:" | awk '{print $2" "$3" "$4}'
uname -r
gcc --version | grep -e "^gcc" | awk '{print $4}'
openssl version | awk '{print $2}'
i3 --version | awk '{print $3}'
konsole --version | awk '{print $2}'
bash --version | grep -e "bash" | awk '{print $4}'
zsh --version | awk '{print $2}'
echo `vim --version | grep -e "^VIM " | awk '{print $5}'`.`vim --version | grep -e "^Included " | awk '{print $3}'`
curl --version | grep -e "^curl " | awk '{print $2}'
git --version | awk '{print $3}'
docker --version | awk '{print $3}'
docker-compose --version | awk '{print $4}'
feh --version | grep version | awk '{print $3}'
maim --version | awk '{print $1}'
bat --version | awk '{print $2}'
rg --version | grep -e "^ripgrep" | awk '{print $2}'
